//
//  MovieListViewModel.swift
//  Movies
//
//  Created by Enver Yigitler on 27.06.2022.
//

import Foundation
import SwiftUI

class MovieListViewModel: ObservableObject {
    @Published var viewData = MovieListViewData()
    
    var client : ServiceApi
    init(client:ServiceApi){
        self.client = client
    }
    
    func downloadMovies(search: String, contentType: String? = nil) { 
        client.downloadMovies(search: search, contentType: contentType) { result in
            switch result {
            case .success(let movieList):
                if let movieList = movieList {
                    DispatchQueue.main.async {
                        self.viewData.movieList = movieList
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func search() {
        if viewData.searchText.count < 3 {
            viewData.showingAlert = true
            return
        }
        viewData.lastQuery = viewData.searchText
        downloadMovies(search: viewData.searchText, contentType: viewData.filter.typeFilter.typeURLParamater)
        viewData.searchText = ""
    }
}







