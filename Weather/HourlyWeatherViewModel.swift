//
//  HourlyWeatherViewModel.swift
//  Weather
//
//  Created by Idris on 04/11/19.
//  Copyright © 2019 Idris-labs. All rights reserved.
//

import Foundation
struct HourlyWeatherViewModel {
  var hourlyListWeather: [HourlyWeather]
  
  func numberOfRowsInSection(_ section: Int) -> Int {
    return self.hourlyListWeather.count
  }
  
  func hourlyWeatherAtIndex(_ index: Int) -> HourlyWeather {
    let hourlyWeather = self.hourlyListWeather[index]
    return hourlyWeather
  }
}
