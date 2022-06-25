//
//  Film.swift
//  Movies
//
//  Created by Berat Yavuz on 25.06.2022.
//

import Foundation
//film model
struct Film : Codable {
    
    let title : String
    let year : String
    let imdbId : String
    let type : String
    let poster : String
    
    private enum CodingKeys : String , CodingKey {
        
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbId"
        case type = "Type"
        case poster = "Poster"
    }
}

struct GelenFilmler : Codable {
    let filmler : [Film]
//    Apideki Search keyi için
    private enum CodingKeys : String , CodingKey {
        case filmler = "Search"
    }
}
