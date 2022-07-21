//
//  filter_UITest.swift
//  MoviesUITests
//
//  Created by Berat Yavuz on 21.07.2022.
//

import XCTest

class Filter_UITest: XCTestCase {
    let app = XCUIApplication()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Filter() {
        
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
        
//        let app2 = app
        
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"Geç\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Search"].tap()
        sleep(3)
        app.navigationBars["Movies"].buttons["Search Document"].tap()
        app.popovers/*@START_MENU_TOKEN@*/.buttons["Series"]/*[[".segmentedControls.buttons[\"Series\"]",".buttons[\"Series\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.popovers.buttons["Search"].tap()
        sleep(3)
        app/*@START_MENU_TOKEN@*/.otherElements["PopoverDismissRegion"]/*[[".otherElements[\"dismiss popup\"]",".otherElements[\"PopoverDismissRegion\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
      let movie = app.tables["navTitle"]/*@START_MENU_TOKEN@*/.buttons["Batman: The Animated Series, 1992–1995, series"]/*[[".cells[\"Batman: The Animated Series, 1992–1995, series\"]",".buttons[\"Batman: The Animated Series, 1992–1995, series\"]",".buttons[\"navLink\"]"],[[[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        
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
