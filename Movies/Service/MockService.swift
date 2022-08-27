//
//  MockService.swift
//  Movies
//
//  Created by Berat Yavuz on 23.08.2022.
//

import Foundation

final class MockService : ServiceApi {
    func downloadMovies(requestDTO: MovieRequestDTO, completion: @escaping (Result<[Movie]?, DownloaderError>) -> Void) {
        let movies = [
            Movie(title: "Mock", year: "2000", imdbID: "e4mr5", type: "film", poster: "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg"),
            Movie(title: "Mock", year: "2000", imdbID: "e4mr5", type: "film", poster: "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg")
        ]
        
        completion(.success(movies))
        
    }
    
    func downloadMovieDetails(imdbId: String, completion: @escaping (Result<MovieDetailModel, DownloaderError>) -> Void) {
         let movie = MovieDetailModel(title: "Mock", year: "2000", genre: "", director: "", writer: "", actors: "", plot: "", awards: "", poster: "", metascore: "", imdbRating: "4.6", imdbId: "e4mr5")
        
        completion(.success(movie))
    }
    
    
    
}


