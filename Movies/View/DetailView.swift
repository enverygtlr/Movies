//
//  DetailView.swift
//  Movies
//
//  Created by Berat Yavuz on 27.06.2022.
//

import SwiftUI

struct DetailView: View {
    let imdbId: String
    @ObservedObject var vm = MovieDetailViewModel()
    var body: some View {
        
        VStack {
         
            Text("\(vm.movieDetails?.title ?? "")").font(.title)
                .padding()
            Text("\(vm.movieDetails?.year ?? "")").font(.title2)
         
            Text("\(vm.movieDetails?.plot ?? "")").font(.title3)
            
            Text("\(vm.movieDetails?.actors ?? "")").font(.title3)
            
            Text("\(vm.movieDetails?.director ?? "")").font(.title3)
        }.padding()
        .onAppear {
            self.vm.getMovieDetails(imdbId: imdbId)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "")
    }
}
