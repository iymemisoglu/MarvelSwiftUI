//
//  CharacterWraper.swift
//  Marvel
//
//  Created by İlker Yasin Memişoğlu on 29.01.2023.
//



import Foundation
import SwiftUI

// MARK: - CharacterDataWrapper

struct CharacterDataModel: Codable {
   
    
    let data : CharacterDataContainer?
}
// MARK: - CharacterDataContainer
struct CharacterDataContainer: Codable {
    
    let offset: Int?
    let limit : Int?
    let total : Int?
    let count : Int?
    let results : [Character]?
    
}
// MARK: - Character
struct Character: Codable {
    
    let id : Int?
    let name : String?
    let description : String?
    
    let thumbnail: CharacterImage?
    let comics : ComicList?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case description = "description"
        case thumbnail, comics
    }
    
    
}

struct CharacterImage : Codable {
    let path: String? // (string, optional): The directory path of to the image.,
    let imgExt : String? //(string, optional): The file extension for the image.
    
    enum CodingKeys: String, CodingKey {
        case path
        case imgExt = "extension"
    }
    
}
struct ComicList: Codable {
    let items: [ComicSummary]?
}
struct ComicSummary:Codable {
    
    let name : String?
}



