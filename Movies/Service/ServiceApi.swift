//
//  ServiceApi.swift
//  Movies
//
//  Created by Berat Yavuz on 13.08.2022.
//

import Foundation

public protocol ServiceApi {
    
    func downloadMovies (
        search: String?,
        contentType: String? ,
        completion: @escaping (Result<[Movie]?, DownloaderError>) -> Void )
    
    
    func  downloadMovieDetails (
        imdbId: String,
        completion: @escaping (Result<MovieDetailModel, DownloaderError>) -> Void )
    
    
}
