//
//  MovieDetailsViewModelUnitTest.swift
//  MoviesTests
//
//  Created by Berat Yavuz on 24.08.2022.
//

import XCTest
@testable import Movies
class MovieDetailsViewModelUnitTest: XCTestCase {
   
    private var mockService : MockService!
    private var sut : MovieDetailViewModel!
    let requestImdbId: String = "e4mr5"
    override func setUpWithError() throws {
        
         mockService = MockService()
         sut = MovieDetailViewModel(imdbId: requestImdbId, service: mockService)
        try super.setUpWithError()
        
    }
    override func tearDownWithError() throws {
        mockService = nil
        sut = nil
        try super.tearDownWithError()
    }
    func testGetMovieDetails() {
        
        sut.getMovieDetails()
        XCTAssertEqual(sut.movieDetailData.movieDetails?.imdbId, requestImdbId)
    }

}
