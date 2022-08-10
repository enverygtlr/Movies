//
//  MovieListView.swift
//  Movies
//
//  Created by Enver Yigitler on 27.06.2022.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var data: MovieListViewData
    var downloadMovies: (_ search: String, _ contentType: String?) -> Void
    var search: () -> Void

    var body: some View {
        NavigationView {
            ZStack {
                WithPopover(
                    showPopover: $data.showFilters,
                    popoverSize: data.popoverSize,
                    content: {
                        Text("Tap")
                    },
                    popoverContent: {
                        FilterView(filters: $data.filter) {
                            if let lastQuery = data.lastQuery {
                                downloadMovies(lastQuery, data.filter.typeFilter.typeURLParamater)
                            }
                        }
                    })

                VStack {
                    SearchBar(searchText: $data.searchText, isSearching: $data.isSearching) {
                        search()
                    }.alert(isPresented: $data.showingAlert, content: {
                        Alert(
                            title: Text("Error"),
                            message: Text("Enter words which have more than three letters."),
                            dismissButton: .default(Text("Got it!")))
                    })

                    List {
                        ForEach(data.movieList, id: \.self) { movie in

                            NavigationLink(
                                destination: MovieDetailWrapperView(imdbId: movie.imdbID),
                                label: {
                                    MovieRow(movie: movie)
                                }).accessibilityIdentifier("navLink")
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    Spacer()
                }
                .navigationTitle("Movies").accessibilityIdentifier("navTitle")
                .toolbar {
                    Button {
                        data.showFilters = true
                    } label: {
                        Image(systemName: "doc.text.magnifyingglass")
                    }
                }
            }
        }
    }
}

// struct MovieListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieListView()
//    }
// }
