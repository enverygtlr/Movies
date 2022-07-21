//
//  SearchBar_UITest.swift
//  MoviesUITests
//
//  Created by Berat Yavuz on 21.07.2022.
//

import XCTest

class SearchBar_UITest: XCTestCase {
let app = XCUIApplication()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()
   
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_SearchBar() {
        
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.textFields["navTitle"]/*[[".textFields[\"Search names here\"]",".textFields[\"navTitle\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let bKey = app/*@START_MENU_TOKEN@*/.keys["B"]/*[[".keyboards.keys[\"B\"]",".keys[\"B\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        bKey.tap()
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
      
        let tKey = app/*@START_MENU_TOKEN@*/.keys["t"]/*[[".keyboards.keys[\"t\"]",".keys[\"t\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tKey.tap()
        
        let mKey = app/*@START_MENU_TOKEN@*/.keys["m"]/*[[".keyboards.keys[\"m\"]",".keys[\"m\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        mKey.tap()
     
        aKey.tap()
       
        let nKey = app/*@START_MENU_TOKEN@*/.keys["n"]/*[[".keyboards.keys[\"n\"]",".keys[\"n\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nKey.tap()
        
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"Geç\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.buttons["Search"].tap()
        
        sleep(2)
        
        let movie =  app.tables["navTitle"].cells["Batman Begins, 2005, movie"].children(matching: .other).element(boundBy: 0).children(matching: .other).element
        
        XCTAssertTrue(movie.exists)
    }
    
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
