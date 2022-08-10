//
//  MovieDetailWrapperView.swift
//  Movies
//
//  Created by Berat Yavuz on 9.08.2022.
//

import SwiftUI

struct MovieDetailWrapperView: View {
    @ObservedObject var detailViewModel: MovieDetailViewModel
    var imdbId: String
    init(imdbId: String) {
        self.imdbId = imdbId
        _detailViewModel = ObservedObject(initialValue: MovieDetailViewModel(imdbId: imdbId))
    }

    var body: some View {
        VStack {
            DetailView(data: detailViewModel.movieDetailData, getMovieDetails: { imdbId in
                detailViewModel.getMovieDetails(imdbId: imdbId)
            })
        }
    }
}
