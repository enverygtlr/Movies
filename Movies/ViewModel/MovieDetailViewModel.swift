//
//  MovieDetailViewModel.swift
//  Movies
//
//  Created by Berat Yavuz on 27.06.2022.
//

import Foundation
import SwiftUI

class MovieDetailViewModel:ObservableObject {
    @Published var movieDetails : NewMovieDetailModel?
  
    
    func getMovieDetails(imdbId:String) {
        DownloaderClient().downloadMovieDetails(imdbId: imdbId) { (result) in
            switch result {
            case .failure(let error) :
                print(error)
            case .success(let movieDetail):
                self.movieDetails = NewMovieDetailModel(detail: movieDetail)
                
            }
        }
    }
    
    
    
}

struct NewMovieDetailModel {
    
    let detail : MovieDetailModel
    
    var title:String {
        detail.title
    }
    var poster: String {
        detail.poster
    }
    var year: String {
        detail.year
    }
    var imdbId: String {
        detail.imdbId
    }
    var director: String {
        detail.director
    }
    var writer: String {
        detail.writer
    }
    var awards: String {
        detail.awards
    }
    var plot: String {
        detail.plot
    }
    var actors: String {
        detail.actors
    }
    
}
