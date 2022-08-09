//
//  MovieListViewData.swift
//  Movies
//
//  Created by Enver Yigitler on 8.08.2022.
//

import Foundation
import SwiftUI

class MovieListViewData: ObservableObject {
    @Published var movieList: [Movie] = []
    @Published var searchText = ""
    @Published var isSearching = false
    @Published var lastQuery: String? = nil
    @Published var showFilters = false
    @Published  var showingAlert = false
    @Published var filter = MovieFilterCollection()
    @Published var popoverSize = CGSize(width: 300, height: 250)
}
