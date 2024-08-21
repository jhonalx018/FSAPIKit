//
//  JSONParser.swift
//  FSApiKey
//
//  Created by Jhon Gomez on 12/20/21.
//

import Foundation



public class Parser: Loggable {
    public init() {}
    
    public final func fromJson<GenericType: Decodable>(for jsonData: Data) -> GenericType? {
        do {
            self.debug(message:  String(data: jsonData, encoding: .utf8)!)
            let decoder = JSONDecoder()
            let data = try decoder.decode(GenericType.self, from: jsonData)
            
            return data
        } catch let error {
            self.debug(message: "Error parsing \(GenericType.self) json:\(jsonData) with error \(error)")
            
            return nil
        }
    }
    
    public final func toJson<GenericBodyType: Codable>(for data: GenericBodyType) -> Data? {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(data)
            
            let jsonString = String(data: data, encoding: .utf8)!
            self.debug(message: jsonString)
            
            return data
        } catch let error {
            self.debug(message: "Error enconding data:\(data) with error \(error)")

            return nil
        }
    }
}
