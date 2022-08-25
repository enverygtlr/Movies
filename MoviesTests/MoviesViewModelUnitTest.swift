//
//  MoviesViewModelUnitTest.swift
//  MoviesTests
//
//  Created by Berat Yavuz on 23.08.2022.
//

import XCTest
@testable import Movies

class MoviesViewModelUnitTest: XCTestCase {
    
    private var mockService : MockService!
    private var sut : MovieListViewModel!
    
    override func setUpWithError() throws {
        
         mockService = MockService()
         sut = MovieListViewModel(client: mockService)
        try super.setUpWithError()
        
    }
    override func tearDownWithError() throws {
        mockService = nil
        sut = nil
        try super.tearDownWithError()
    }
    func testDownloadMovies() {
    
        sut.downloadMovies(search: "")
        
        XCTAssertGreaterThan(sut.viewData.movieList.count, 0)
    }
    
    func testSearchFuncReturnError() {
        
        
    }
    
}
