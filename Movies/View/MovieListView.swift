//
//  MovieListView.swift
//  Movies
//
//  Created by Enver Yigitler on 27.06.2022.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var movieListViewModel = MovieListViewModel()
    @State var searchText = ""
    
    @State var isSearching = false
    @State var lastQuery: String? = nil
    @State var showFilters = false
    @State private var showingAlert = false
    @State var filters = MovieFilter()
    @State var popoverSize = CGSize(width: 300, height: 250)
    struct MovieFilter: Equatable {
     enum MovieTypes: Equatable {
            case all
            case movies
            case series
            var typeString: String? {
                switch self {
                case .all:
                    return nil
                case .movies:
                    return "movie"
                case .series:
                    return "series"
                }
            }
            var id: Self { self }
        }
        var typeFilter: MovieTypes = .all
        var id: Self { self }
    }
    var body: some View {
        NavigationView {
            ZStack {
                WithPopover(
                    showPopover: $showFilters,
                    popoverSize: popoverSize,
                    content: {
                        Text("Tap")
                    },
                    popoverContent: {
                        FilterView(filters: $filters) {
                            if let lastQuery = lastQuery {
                                movieListViewModel.downloadMovies(search: lastQuery,
                                contentType: filters.typeFilter.typeString)
                            }
                        }
                    })
                VStack {
                    SearchBar(searchText: $searchText, isSearching: $isSearching) {
                        if searchText.count < 3 {
                            showingAlert = true
                            return
                        }
                        lastQuery = searchText
                        movieListViewModel
                        .downloadMovies(search: searchText, contentType: filters.typeFilter.typeString)
                        searchText = ""
                    }.alert(isPresented: $showingAlert, content: {
                        Alert(
                            title: Text("Error"),
                            message: Text("Enter words which have more than three letters."),
                            dismissButton: .default(Text("Got it!"))
                        )
                    })
                    List {
                        ForEach(movieListViewModel.movieList, id: \.self) { movie in
                            NavigationLink(
                                destination: DetailView(imdbId: movie.imdbID),
                                label: {
                                    HStack {
                                        URLImage(urlString: movie.poster)
                                            .frame(width: 100, height: 150)
                                        VStack(alignment: .leading) {
                                            Text(movie.title)
                                                .font(.title)
                                            Text("\(movie.year)")
                                                .foregroundColor(.yellow)
                                            Text("\(movie.type)")
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    .padding(10)
                                }).accessibilityIdentifier("navLink")
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    Spacer()
                }
                .navigationTitle("Movies").accessibilityIdentifier("navTitle")
                .toolbar {
                    Button {
                        showFilters = true
                    } label: {
                        Image(systemName: "doc.text.magnifyingglass")
                    }
                }
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
