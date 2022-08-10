//
//  MovieRow.swift
//  Movies
//
//  Created by Enver Yigitler on 5.08.2022.
//

import SwiftUI

struct MovieRow: View {
    let movie: Movie
    var body: some View {
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
    }
}
