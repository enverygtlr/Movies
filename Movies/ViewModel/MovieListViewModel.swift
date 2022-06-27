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
    
    func downloadMovies(search: String)
    {
        DownloaderClient.downloadMovies(search: search) { result in
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
        ScrollView {
            VStack() {
                Button {
                    movieListViewModel.downloadMovies(search: "some")
                } label: {
                    Text("Button")
                }
                ForEach(movieListViewModel.movieList, id: \.self) { movie in
                    Text(movie.title)
                    Text(movie.imdbID)
                }
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
