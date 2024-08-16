//
//  ApiDecoder.swift
//  Idyllic Church
//
//  Created by Peter Samir on 13/11/2022.
//

import Foundation

extension Data {
    func Decode<T: Codable> (_ object:T.Type) ->(T?,Error?) {
       do {
           let decoder = JSONDecoder()
           let DataResponsed = try decoder.decode(T.self, from: self)
           return(DataResponsed, nil)
       } catch {
            print("-> Entity: " + String(describing: T.self))
            print("-> Error: " + String(describing: error))
            return (nil, error)
       }
    }
    
    var toString:String {
        return String(data: self, encoding: .utf8) ?? ""
    }
}
extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
    
}
