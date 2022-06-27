//
//  Film.swift
//  Movies
//
//  Created by Berat Yavuz on 25.06.2022.
//

import Foundation
//film model
struct Movie : Codable, Hashable {
    
    let title : String
    let year : String
    let imdbID : String
    let type : String
    let poster : String
    
    private enum CodingKeys : String , CodingKey {
        
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}

struct MovieArray : Codable {
    let movies : [Movie]
    //    Apideki Search keyi için
    private enum CodingKeys : String , CodingKey {
        case movies = "Search"
    }
}
