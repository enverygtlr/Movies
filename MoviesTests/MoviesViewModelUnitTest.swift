//
//  MoviesViewModelUnitTest.swift
//  MoviesTests
//
//  Created by Berat Yavuz on 23.08.2022.
//

import XCTest
@testable import Movies

class MoviesViewModelUnitTest: XCTestCase {

    func testDownloadMovies() {
      
        let mockService = MockService()
        let viewModel = MovieListViewModel(client: mockService)
        
        viewModel.downloadMovies(search: "")
        sleep(3)
        XCTAssertGreaterThan(viewModel.viewData.movieList.count, 0)
        
        
    }

}
