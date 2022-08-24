////
////  DownloaderClientTest.swift
////  MoviesTests
////
////  Created by Enver Yigitler on 20.07.2022.
////
////
////import XCTest
////@testable import Movies
////
////class DownloaderClientTest: XCTestCase {
////    override func setUpWithError() throws {
////        // Put setup code here. This method is called before the invocation of each test method in the class.
////    }
////    override func tearDownWithError() throws {
////        // Put teardown code here. This method is called after the invocation of each test method in the class.
////    }
//    func testDownloadMovieList() throws {
//        var result: Result<[Movie]?, DownloaderError>?
//        let expectation = self.expectation(description: "Waiting for the downloadMovies call to complete.")
//        DownloaderClient.downloadMovies(search: "batman") { response in
//            result = response
//            expectation.fulfill()
//        }
//        waitForExpectations(timeout: 3) { error in
//            XCTAssertNil(error)
//            switch result {
//            case .success:
//                break
//            case .failure,
//                 .none:
//                XCTFail("download fail")
//            }
//        }
//    }
////    func testDownloadMovieDetails() throws {
////        var result: Result< MovieDetailModel, DownloaderError>?
////        let expectation = self.expectation(description: "Waiting for the downloadMovieDetails call to complete.")
////        DownloaderClient.downloadMovieDetails(imdbId: "tt0145487") { response in
////            result = response
////            expectation.fulfill()
////        }
////        waitForExpectations(timeout: 3) { error in
////            XCTAssertNil(error)
////            switch result {
////            case .success:
////                break
////            case .failure,
////                 .none:
////                XCTFail("download fail")
////            }
////        }
////    }
////    func testExample() throws {
////        // This is an example of a functional test case.
////        // Use XCTAssert and related functions to verify your tests produce the correct results.
////    }
////    func testPerformanceExample() throws {
////        // This is an example of a performance test case.
////        self.measure {
////            // Put the code you want to measure the time of here.
////        }
////    }
////}
