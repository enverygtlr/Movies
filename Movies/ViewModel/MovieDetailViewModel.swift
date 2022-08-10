//
//  MovieDetailViewModel.swift
//  Movies
//
//  Created by Berat Yavuz on 27.06.2022.
//

import Foundation
import SwiftUI

class MovieDetailViewModel: ObservableObject {

//    @Published var movieDetails : MovieDetailModel?
    @Published var movieDetailData : MovieDetailViewData
    
    init ( imdbId:String) {
        _movieDetailData = Published(initialValue: MovieDetailViewData(imdbId:imdbId))
    }
    func getMovieDetails(imdbId: String) {
        DownloaderClient.downloadMovieDetails(imdbId: imdbId) { (result) in
            switch result {
            case .failure(let error) :
                print(error)
            case .success(let movieDetail):
                DispatchQueue.main.async {
                    self.movieDetailData.movieDetails = movieDetail
                }
            }
        }
    }
    
}
