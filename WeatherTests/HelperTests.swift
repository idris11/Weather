//
//  HelperTests.swift
//  WeatherTests
//
//  Created by Idris on 02/11/19.
//  Copyright © 2019 Idris-labs. All rights reserved.
//

import XCTest
@testable import Weather
class HelperTests: XCTestCase {
  private var helper: Helper!
  override func setUp() {
    super.setUp()
    self.helper = Helper()
  }

  func testConvertDate() {
    let date = "2019-12-01"
    
    XCTAssertEqual(self.helper.dateConverter(date), "01-12-2019")
  }
}
