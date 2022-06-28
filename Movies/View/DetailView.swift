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
        
        VStack(alignment: .leading, spacing: 5) {
            HStack (alignment: .center){
                Spacer()
                URLImage(urlString: vm.movieDetails?.poster ?? "").frame(width: UIScreen.main.bounds.width*0.5, height: UIScreen.main.bounds.height*0.4, alignment: .center)
                Spacer()
            }
//            Text(vm.movieDetails?.poster ?? "deneme")
            Text("\(vm.movieDetails?.title ?? "")").font(.subheadline)
                .padding()
            Text("Year: \(vm.movieDetails?.year ?? "")").font(.subheadline)
                .padding()
            Text("Plot: \(vm.movieDetails?.plot ?? "")").font(.subheadline)
                .padding()
            Text("\(vm.movieDetails?.actors ?? "")").font(.subheadline)
                .padding()
            Text("\(vm.movieDetails?.director ?? "")").font(.subheadline)
                .padding()
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
