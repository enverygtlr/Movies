//
//  MoviesAPI.swift
//  Movies
//
//  Created by Enver Yigitler on 27.06.2022.
//

import Foundation

enum MoviesAPI {
    case movies(search: String? = nil)
    
    private static var apiKey: String {
        "f82a83aa"
    }
    
    var url: URL? {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "omdbapi.com"
        component.path = "/"
        component.queryItems = pageQuery()
        return component.url
    }
    
    private func pageQuery()-> [URLQueryItem]? {
        switch self {
        case .movies(search: let searchQuery):
            var queryArray: [URLQueryItem] = [URLQueryItem(name: "apiKey", value: MoviesAPI.apiKey)]
            
            if let searchQuery = searchQuery {
                queryArray.append(URLQueryItem(name: "s", value: searchQuery))
            }
            
            if (!queryArray.isEmpty) {
                return queryArray
            } else {
                return nil
            }
        }
    }
    
    
}
