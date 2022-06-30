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
    @State var showFilters = false
    @State var filters = MovieFilter()
    
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
            VStack{
                SearchBar(searchText: $searchText, isSearching: $isSearching) {
                    movieListViewModel.downloadMovies(search: searchText, contentType: filters.typeFilter.typeString)
                }
                
                List() {                    
                    ForEach(movieListViewModel.movieList, id: \.self) { movie in
                        
                        NavigationLink(
                            destination:DetailView(imdbId: movie.imdbID),
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
                            })
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                Spacer()
            }
            .navigationTitle("Movies")
            .toolbar {
                Button {
                    showFilters = true
                } label: {
                    Image(systemName: "doc.text.magnifyingglass")
                }
                .sheet(isPresented: $showFilters) {
                    FilterView(filters: $filters)
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
