//
//  MovieDetailViewData.swift
//  Movies
//
//  Created by Berat Yavuz on 9.08.2022.
//

import Foundation

class MovieDetailViewData: ObservableObject {
    init(imdbId: String) {
        self.imdbId = imdbId
    }
    
    @Published var movieDetails: MovieDetailModel?
    var imdbId: String = ""
}
