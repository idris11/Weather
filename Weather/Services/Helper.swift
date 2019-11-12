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
  
  func checkImageByCode(_ codeWeather: Int) -> String {
    switch codeWeather {
    case 200-233:
      return "lightning"
    case 300-522:
      return "rainy"
    case 801,802,803,804:
      return "cloudy"
    case 800:
      return "sunny"
    default:
      return "cloudy"
    }
  }
  
  func convertDateTime(_ date: String) -> String {
    if #available(iOS 10.0, *) {
      let newDate = date+"+07:00"
      let formatter = ISO8601DateFormatter()
      let dateAfterFormat = formatter.date(from: newDate)
      let dateFormatterPrint = DateFormatter()
      dateFormatterPrint.dateFormat = "HH:mm"
      if let dateAfterFormat = dateAfterFormat {
        return dateFormatterPrint.string(from: dateAfterFormat)
      }
      return "Date unavailable"
    }
    else {
      let dateFormatterGet = DateFormatter()
      dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
      let dateFormatterPrint = DateFormatter()
      dateFormatterPrint.dateFormat = "HH:mm"
      if let newDate = dateFormatterGet.date(from: date) {
          return dateFormatterPrint.string(from: newDate)
      }
      else {
        return "Date unavailable"
      }
    }

  }
}
