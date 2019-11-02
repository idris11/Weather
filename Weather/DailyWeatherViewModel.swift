//
//  DailyWeatherViewModel.swift
//  Weather
//
//  Created by Idris on 02/11/19.
//  Copyright © 2019 Idris-labs. All rights reserved.
//

import Foundation
struct DailyWeatherViewModel {
  var dailyListWeather: [DailyWeather]
  
  init(_ dailyListWeather: [DailyWeather]) {
    self.dailyListWeather = dailyListWeather
  }
  
  func numberOfRowsInSection(_ section: Int) -> Int {
    return self.dailyListWeather.count
  }
  
  func dailyWeatherAtIndex(_ index: Int) -> DailyWeather {
    let dailyWeather = self.dailyListWeather[index]
    return dailyWeather
  }
}
