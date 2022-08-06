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
    @ObservedObject var movieDetailVM = MovieDetailViewModel()
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                HStack(alignment: .center) {
                    Spacer()
                    if movieDetailVM.movieDetails?.poster != "N/A" && movieDetailVM.movieDetails?.poster != nil {
                        KFImage(URL(string: movieDetailVM.movieDetails!.poster))
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width*0.8,
                                   height: UIScreen.main.bounds.height*0.5, alignment: .center)
                            .cornerRadius(10.0)
                    } else {
                        Image("no_image")
                            .frame(width: UIScreen.main.bounds.width*0.8,
                                   height: UIScreen.main.bounds.height*0.5, alignment: .center)
                            .cornerRadius(10.0)
                    }
                    Spacer()
                }
                Text("\(movieDetailVM.movieDetails?.title ?? "")").font(.title3).bold()
                    .padding().foregroundColor(.blue)
                HStack {
                    Text("Year:").foregroundColor(.blue)
                    Text(" \(movieDetailVM.movieDetails?.year ?? "")").font(.subheadline)
                        .padding()
                }
                HStack {
                    Text("Plot:").foregroundColor(.blue)
                    Text("\(movieDetailVM.movieDetails?.plot ?? "")").font(.subheadline)
                        .padding()
                }
                HStack {
                    Text("Actors:").foregroundColor(.blue)
                    Text("\(movieDetailVM.movieDetails?.actors ?? "")").font(.subheadline)
                        .padding()
                }
                HStack {
                    Text("Director:").foregroundColor(.blue)
                    Text("\(movieDetailVM.movieDetails?.director ?? "")").font(.subheadline)
                        .padding()
                }
            }
            .padding()
            .onAppear {
                self.movieDetailVM.getMovieDetails(imdbId: imdbId)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "")
    }
}
