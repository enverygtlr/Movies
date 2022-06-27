//
//  DownloaderClient.swift
//  Movies
//
//  Created by Berat Yavuz on 25.06.2022.
//

import Foundation

class DownloaderClient {
    
    // aranacak film ve bittikten sonra ne olacağını main threadi bloklamamak için escape succes ve failure verdik
    func downloadMovies(search:String, completion: @escaping (Result<[Film]?,DownloaderError>) -> Void ) {
        
        guard let url = URL (string: "http://www.omdbapi.com/?s=\(search)&apikey=f82a83aa") else {
            return completion(.failure(.wrongUrl))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,  error == nil else {
                return  completion(.failure(.dataNotArrived))
            }
            guard let filmCevabi =  try? JSONDecoder().decode(GelenFilmler.self, from: data) else {
                return completion(.failure(.dataNotProcessed))
            }
            completion(.success(filmCevabi.filmler))
        }.resume()
        
    }
}
// hatalar için enum
enum DownloaderError: Error {
    case wrongUrl
    case dataNotArrived
    case dataNotProcessed
}
