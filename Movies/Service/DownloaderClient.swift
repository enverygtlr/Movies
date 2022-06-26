//
//  DownloaderClient.swift
//  Movies
//
//  Created by Berat Yavuz on 25.06.2022.
//

import Foundation

class DownloaderCLient {
    
    // aranacak film ve bittikten sonra ne olacağını main threadi bloklamamak için escape succes ve failure verdik
    func filmleriIndir(search:String, completion: @escaping (Result<[Film]?,DownloaderError>) -> Void ) {
        
        guard let url = URL (string: "http://www.omdbapi.com/?i=tt3896198&apikey=f82a83aa") else {
            return completion(.failure(.yanlisUrl))
        }
        
    }
}
// hatalar için enum
enum DownloaderError: Error {
    case yanlisUrl
    case veriGelmedi
    case veriIslenmedi
}
