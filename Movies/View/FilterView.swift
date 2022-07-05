//
//  FilterView.swift
//  Movies
//
//  Created by Enver Yigitler on 30.06.2022.
//

import SwiftUI

struct FilterView: View {
    @Binding var filters: MovieListView.MovieFilter
        
        
    var body: some View {
        VStack{
            Text("Filter")
                .font(.headline)
                .padding()
            
            List {
                VStack {
                    Text("Type")
                    Picker("Type", selection: $filters.typeFilter) {
                        Text("All").tag(MovieListView.MovieFilter.MovieTypes.all)
                        Text("Movie").tag(MovieListView.MovieFilter.MovieTypes.movies)
                        Text("Series").tag(MovieListView.MovieFilter.MovieTypes.series)
                    }
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
//            Spacer()
        }
    }
}
