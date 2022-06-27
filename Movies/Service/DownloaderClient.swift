//
//  DownloaderClient.swift
//  Movies
//
//  Created by Berat Yavuz on 25.06.2022.
//

import Foundation

class DownloaderClient {
    
    // aranacak film ve bittikten sonra ne olacağını main threadi bloklamamak için escape succes ve failure verdik
    static func downloadMovies(search: String? = nil, imdbId: String? = nil, completion: @escaping (Result<[Movie]?,DownloaderError>) -> Void ) {
        
        guard let url = MoviesAPI.movies(search: search, imdbId: imdbId).url else {
            return completion(.failure(.wrongUrl))
        }
        print("imdb URL = \(url)")

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,  error == nil else {
                return  completion(.failure(.dataNotArrived))
            }
            
            guard let movieResponse =  try? JSONDecoder().decode(MovieArray.self, from: data) else {
                return completion(.failure(.dataNotProcessed))
            }
            completion(.success(movieResponse.movies))
            
        }.resume()
        
    }
}
// hatalar için enum
enum DownloaderError: Error {
    case wrongUrl
    case dataNotArrived
    case dataNotProcessed
}
