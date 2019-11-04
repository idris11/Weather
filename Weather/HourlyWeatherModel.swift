//
//  HourlyWeatherModel.swift
//  Weather
//
//  Created by Idris on 04/11/19.
//  Copyright © 2019 Idris-labs. All rights reserved.
//

import Foundation
struct HourlyWeatherModel: Decodable {
  let data: [HourlyWeather]
}

struct HourlyWeather: Decodable {
  let temp: Double
  let timestamp_local: String
  let weather: HourlyWeatherDescription
}

struct HourlyWeatherDescription: Decodable {
  let description: String
  let code: Int
}
