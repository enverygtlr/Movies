//
//  DownloaderClient.swift
//  Movies
//
//  Created by Berat Yavuz on 25.06.2022.
//

import Foundation

public class DownloaderClient : ServiceApi {
     public  func downloadMovies (
    requestDTO: MovieRequestDTO,
    completion: @escaping (Result<[Movie]?, DownloaderError>) -> Void ) {
        guard let url = MoviesAPI.movies(search: requestDTO.search, contentType: requestDTO.contentType).url else {
            return completion(.failure(.wrongUrl))
        }
        print("URL: \(url)")
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return  completion(.failure(.dataNotArrived))
            }
            guard let movieResponse =  try? JSONDecoder().decode(MovieArray.self, from: data) else {
                return completion(.failure(.dataNotProcessed))
            }
            completion(.success(movieResponse.movies))
        }.resume()
    }
    
    
    
    public func  downloadMovieDetails(
        imdbId: String,
        completion: @escaping (Result<MovieDetailModel, DownloaderError>) -> Void) {
        guard let url = MoviesAPI.movies(imdbId: imdbId).url else {
            return completion(.failure(.wrongUrl))
        }
        print("URL: \(url)")
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return  completion(.failure(.dataNotArrived))
            }
            guard let movieDetailResponse =  try? JSONDecoder().decode(MovieDetailModel.self, from: data) else {
                return completion(.failure(.dataNotProcessed))
            }
            completion(.success(movieDetailResponse))
        }.resume()
    }
}

// hatalar için enum
 public enum DownloaderError: Error {
    case wrongUrl
    case dataNotArrived
    case dataNotProcessed
}
