//
//  MovieListViewModel.swift
//  Movies
//
//  Created by Enver Yigitler on 27.06.2022.
//

import Foundation
import SwiftUI

class MovieListViewModel {
    
    
    
}

struct TestView: View {
    
    var body: some View {
        Text("Hello \(MoviesAPI.movies(search: "some").url!)")
    }
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
