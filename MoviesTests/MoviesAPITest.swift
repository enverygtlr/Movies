//
//  MoviesAPITest.swift
//  MoviesTests
//
//  Created by Enver Yigitler on 20.07.2022.
//

import XCTest
@testable import Movies

class MoviesAPITest: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testMoviesURLs() throws {
        XCTAssertEqual(MoviesAPI.movies(search: "Batman", contentType: "series")
            .url, URL(string: "https://omdbapi.com/?apiKey=f82a83aa&s=Batman&type=series"))
        XCTAssertEqual(MoviesAPI.movies(imdbId: "tt0145487").url,
                       URL(string: "https://omdbapi.com/?apiKey=f82a83aa&i=tt0145487"))
    }
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
