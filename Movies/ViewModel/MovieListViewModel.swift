//
//  MovieListViewModel.swift
//  Movies
//
//  Created by Enver Yigitler on 27.06.2022.
//

import Foundation
import SwiftUI

class MovieListViewModel: ObservableObject {
    @Published var movieList: [Movie] = []
    
    func downloadMovies(search: String, contentType: String? = nil) {
        DownloaderClient.downloadMovies(search: search, contentType: contentType) { result in
            switch result {
            case .success(let movieList):
                if let movieList = movieList {
                    DispatchQueue.main.async {
                        self.movieList = movieList
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct TestView: View {
    @ObservedObject var movieListViewModel = MovieListViewModel()
    
    var body: some View {
        Text("Hello \(MoviesAPI.movies(imdbId: "id").url!)")
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
