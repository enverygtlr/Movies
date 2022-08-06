//
//  FilterView.swift
//  Movies
//
//  Created by Enver Yigitler on 30.06.2022.
//

import SwiftUI

struct FilterView: View {
    @Binding var filters: MovieListView.MovieFilter
    var apply: () -> Void
    var body: some View {
        VStack(alignment: .center) {
            Text("Filter")
                .font(.headline)
                .padding()
            VStack {
                Text("Type")
                Picker("Type", selection: $filters.typeFilter) {
                    Text("All").tag(MovieListView.MovieFilter.MovieTypes.all)
                    Text("Movie").tag(MovieListView.MovieFilter.MovieTypes.movies)
                    Text("Series").tag(MovieListView.MovieFilter.MovieTypes.series)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Button(action: {
                self.apply()
            }, label: {
                Text("Search")
            })
            .foregroundColor(.blue)
            .padding(30)
        }
        .padding()
    }
}
