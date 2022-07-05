//
//  DetailView.swift
//  Movies
//
//  Created by Berat Yavuz on 27.06.2022.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    
    let imdbId: String
    @ObservedObject var vm = MovieDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                HStack (alignment: .center) {
                    Spacer()
                    KFImage(URL(string: vm.movieDetails?.poster ?? "no_image"))
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.height*0.5, alignment: .center)
                        .cornerRadius(10.0)
                    
                    //                URLImage(urlString: vm.movieDetails?!).frame(width: UIScreen.main.bounds.width*0.5, height: UIScreen.main.bounds.height*0.4, alignment: .center)
                    
                    Spacer()
                }
                Text("\(vm.movieDetails?.title ?? "")").font(.title3).bold()
                    .padding().foregroundColor(.blue)
                HStack {
                    Text("Year:").foregroundColor(.blue)
                    Text(" \(vm.movieDetails?.year ?? "")").font(.subheadline)
                        .padding()
                }
                HStack {
                    Text("Plot:").foregroundColor(.blue)
                    Text("\(vm.movieDetails?.plot ?? "")").font(.subheadline)
                        .padding()
                }
                HStack {
                    Text("Actors:").foregroundColor(.blue)
                    Text("\(vm.movieDetails?.actors ?? "")").font(.subheadline)
                        .padding()
                }
                HStack {
                    Text("Director:").foregroundColor(.blue)
                    Text("\(vm.movieDetails?.director ?? "")").font(.subheadline)
                        .padding()
                }
            }
            .padding()
            .onAppear {
                self.vm.getMovieDetails(imdbId: imdbId)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "")
    }
}
