//
//  DailyWeatherModel.swift
//  Weather
//
//  Created by Idris on 02/11/19.
//  Copyright © 2019 Idris-labs. All rights reserved.
//

import Foundation
struct DailyWeatherModel: Decodable {
  let data: [DailyWeather]
}

struct DailyWeather: Decodable {
  let temp: Double
  let weather: DailyWeatherDescription
  let datetime: String
}

struct DailyWeatherDescription: Decodable {
  let description: String
  let code: Int
}
