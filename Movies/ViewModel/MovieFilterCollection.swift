//
//  MovieFilter.swift
//  Movies
//
//  Created by Enver Yigitler on 5.08.2022.
//

import Foundation

struct MovieFilterCollection: Equatable {
    
    enum MovieTypeFilter: Equatable {
        case all
        case movies
        case series
        
        var typeURLParamater: String? {
            switch self {
            case .all:
                return nil
            case .movies:
                return "movie"
            case .series:
                return "series"
            }
        }
        
        var id: Self { self }
    }
    
    var typeFilter: MovieTypeFilter = .all
    var id: Self { self }
}
