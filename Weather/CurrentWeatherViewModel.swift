//
//  CurrentWeatherViewModel.swift
//  Weather
//
//  Created by Idris on 02/11/19.
//  Copyright © 2019 Idris-labs. All rights reserved.
//

import Foundation
struct CurrentWeatherViewModel {
  let weather: CurrentWeatherModel
  
  init(_ weather: CurrentWeatherModel) {
    self.weather = weather
  }
  var cityNameWeather: String {
    return self.weather.data[0].city_name
  }
  
  var descriptionWeather: String {
    return self.weather.data[0].weather.description
  }
  
  var tempratureWeather: String {
    return "\(self.weather.data[0].temp)°"
  }
  
  var imageWeather: String {
    if let code = Int(self.weather.data[0].weather.code) {
      return Helper().checkImageByCode(code)
    }
    return Helper().checkImageByCode(804)
  }
}
