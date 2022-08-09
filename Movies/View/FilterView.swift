//
//  FilterView.swift
//  Movies
//
//  Created by Enver Yigitler on 30.06.2022.
//

import SwiftUI

struct FilterView: View {
    @Binding var filters: MovieFilterCollection
    var apply: () -> Void
    var body: some View {
        VStack(alignment: .center) {
            Text("Filter")
                .font(.headline)
                .padding()
            VStack {
                Text("Type")
                Picker("Type", selection: $filters.typeFilter) {
                    Text("All").tag(MovieFilterCollection.MovieTypeFilter.all)
                    Text("Movie").tag(MovieFilterCollection.MovieTypeFilter.movies)
                    Text("Series").tag(MovieFilterCollection.MovieTypeFilter.series)
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
