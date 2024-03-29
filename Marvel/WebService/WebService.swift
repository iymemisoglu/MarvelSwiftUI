//
//  WebService.swift
//  Marvel
//
//  Created by İlker Yasin Memişoğlu on 29.01.2023.
//


import CryptoKit
import SwiftUI


struct WebService {
    
    let baseUrl = "https://gateway.marvel.com/v1/public/characters"
    let apikey =  "6bc760706a50feb51400ffff42782383"
    
    let ts: String = String(Date().timeIntervalSince1970)
    let privateKey = "629391ddc039d9f9615e10b323fb22984f145016"
    let publicKey = "6bc760706a50feb51400ffff42782383"
    
    var hash : String {
        return MD5(data: "\(ts)\(privateKey)\(apikey)")
    }
    
    func MD5(data: String) -> String {
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        return hash.map{String(format: "%02hhx", $0)}.joined()
    }
    
    var Url : String {
        
        return "\(baseUrl)?apikey=\(apikey)&ts=\(ts)&hash=\(hash)"
    }
    
    func getCharacter(url : String, completion: @escaping (Result<CharacterDataModel,Error>) -> Void) {
        
        
        let URL = URL(string: url)!
        
        URLSession.shared.dataTask(with: URL) { (data, error, response)  in
            
            if let data = data {
                do {
                    let characterDataWrapper = try JSONDecoder().decode(CharacterDataModel.self, from: data)
                   
                        completion(.success((characterDataWrapper)))
 
                
                } catch {
                    print(error)
                }
            }
            
        }.resume()
        
        
    }
    

}
