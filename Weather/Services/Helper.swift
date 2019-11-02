//
//  Helper.swift
//  Weather
//
//  Created by Idris on 02/11/19.
//  Copyright © 2019 Idris-labs. All rights reserved.
//

import Foundation
struct Helper {
  func dateConverter(_ date: String) -> String {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd"

    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "dd-MM-yyyy"
    if let newDate = dateFormatterGet.date(from: date) {
        return dateFormatterPrint.string(from: newDate)
    }
    return "Date unavailable"
  }
}
