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
    
    var body: some View {
        NavigationView {
            VStack{
                SearchBar(searchText: $searchText, isSearching: $isSearching) {
                    movieListViewModel.downloadMovies(search: searchText)
                }
                
                List() {
                    ForEach(movieListViewModel.movieList, id: \.self) { movie in
                        
                        NavigationLink(
                            destination: Text("Destination"),
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
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
