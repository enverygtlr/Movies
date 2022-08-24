//
//  MovieListWrapperView.swift
//  Movies
//
//  Created by Enver Yigitler on 8.08.2022.
//

import SwiftUI

struct MovieListWrapperView: View {
    
    @ObservedObject var viewModel = MovieListViewModel(client: DownloaderClient())
    
    var body: some View {
        VStack {
            MovieListView(data: viewModel.viewData, downloadMovies: {search, contentType in
                viewModel.downloadMovies(search: search, contentType: contentType)
            }, search: {
                viewModel.search()
            })
            
         
        }
    }
}



