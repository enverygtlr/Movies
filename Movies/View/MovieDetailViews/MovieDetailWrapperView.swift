//
//  MovieDetailWrapperView.swift
//  Movies
//
//  Created by Berat Yavuz on 9.08.2022.
//

import SwiftUI

struct MovieDetailWrapperView: View {
    @ObservedObject var detailViewModel : MovieDetailViewModel
    var imdbId: String
    var service : DownloaderClient
    init(imdbId: String,service: DownloaderClient) {
        self.imdbId = imdbId
        self.service = service
        _detailViewModel = ObservedObject(initialValue: MovieDetailViewModel(imdbId: imdbId, service: service))
    }

    var body: some View {
        VStack {
            DetailView(data: detailViewModel.movieDetailData, getMovieDetails: { imdbId in
                detailViewModel.getMovieDetails()
            })
        }
    }
}
