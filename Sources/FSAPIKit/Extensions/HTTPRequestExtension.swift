//
//  HTTPRequestExtension.swift
//  
//
//  Created by Jhon Gomez on 12/30/21.
//

import Foundation

extension HTTPRequest {
    public func performCallbackRequest<R: Codable>(requestConf: URLRequest, request: HTTPRequestModel<R>) {
        let task = self.session.dataTask(with: requestConf) { data, response, error in
            self.handleResponse(data: data, response: response, request: request, error: error)
        }
        
        task.resume()
    }
    
    @available(macOS 12.0.0, *)
    @available(iOS 15.0.0, *)
    public func performRequestAwait<R: Codable>(requestConf: URLRequest, request: HTTPRequestModel<R>) async throws -> Response<R> {
        let (data, response): (Data, URLResponse) = try await self.session.data(for: requestConf)
        
        return self.substractResponse(data: data, response: response, request: request)
    }
    
    @available(iOS 13.0, *)
    @available(macOS 12.0, *)
    public func performCombineRequest<R: Codable>(requestConf: URLRequest, request: HTTPRequestModel<R>) -> AnyPublisherRequest<R> {
        return URLSession.shared.dataTaskPublisher(for: requestConf)
            .map { element in
                self.substractResponse(data: element.data, response: element.response, request: request)
            }
            //We can use this method to transfrom the data directly -> .decode(type: R?.self, decoder: JSONDecoder())
            .replaceError(with: .failure(.noData))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    public func convertToQueryString(for query: [String: String]?) -> String {
        let params: String = query?.reduce(into: []) { acc, current in
            acc.append("\(current.key)=\(current.value)")
        }.joined(separator: "&") ?? ""
        
        return params.isEmpty ? "" : "?\(params)"
    }
    
    public func buildURL(url: String, queryParams: [String: String]?) -> URL {
        URL(string: "\(url)\(self.convertToQueryString(for: queryParams))")!
    }
    
    public func getRequestConfWithHeader<R>(request: HTTPRequestModel<R>, for httpVerb: HTTPMethods) -> URLRequest {
        var requestConf = URLRequest(
            url: self.buildURL(url: request.url, queryParams: request.queryParams)
        )
    
        self.addHeaders(requestConf: &requestConf, extraHeaders: request.headers)
    
        requestConf.httpMethod = httpVerb.rawValue
        requestConf.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requestConf.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if let cookie = request.cookie {
            requestConf.addValue(cookie, forHTTPHeaderField: "cookie")
        }
      
        return requestConf
    }
    
    public func addHeaders(requestConf: inout URLRequest, extraHeaders: [String: String]?) {
        extraHeaders?.forEach { body in
            requestConf.addValue(body.value, forHTTPHeaderField: body.key)
        }
    }
    
    public func handleResponse<R: Codable>(data: Data?, response: URLResponse?, request: HTTPRequestModel<R>, error: Error?) {
        request.callback(
            substractResponse(data: data, response: response, error: error, request: request)
        )
    }
    
    public func substractResponse<R: Codable>(data: Data?, response: URLResponse?, error: Error? = nil, request: HTTPRequestModel<R>) -> Response<R> {
        if let httpResponse = response as? HTTPURLResponse {
            if let error = error {
                  return .failure(.transportError(error))
            }
            
            guard let wrappedData = data else {
                return .failure(.noData)
            }
            
            if HTTPResponseHandler.checkSuccessStatus(response: httpResponse, in:  request.expectedStatusCode) {
                if let parsedData: R = self.fromJson(for: wrappedData) {
                    return .success(parsedData)
                }
            } else {
                return .failure(.serverError(statusCode: httpResponse.statusCode))
            }
        }
        
        return .failure(.noData)
    }
}
