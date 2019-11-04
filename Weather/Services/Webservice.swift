//
//  Webservice.swift
//  Weather
//
//  Created by Idris on 02/11/19.
//  Copyright © 2019 Idris-labs. All rights reserved.
//

import Foundation
import Alamofire
struct Webservice {
  func getDailyWeather(_ city: String, completion: @escaping ([DailyWeather]?) -> Void) {
    guard let url = URL(string: "https://api.weatherbit.io/v2.0/forecast/daily?city=\(city)&key=1524f1878a7c47fcac61ccd561b36df0&lang=id") else {
      completion(nil)
      return
    }
    Alamofire.request(url).responseData { (response) in
      if response.result.isSuccess {
        if let data = response.data {
          let result = try? JSONDecoder().decode(DailyWeatherModel.self, from: data).data
          if let result = result {
             completion(result)
          }
          else {
            completion(nil)
          }
        }
      }
    }
  }
  
  func getCurrentWeather(_ city: String,completion: @escaping (CurrentWeatherModel?) -> Void) {
    guard let url = URL(string: "https://api.weatherbit.io/v2.0/current?city=\(city)&key=1524f1878a7c47fcac61ccd561b36df0&lang=id") else {
      completion(nil)
      return
    }
    Alamofire.request(url).responseData { (response) in
      if response.result.isSuccess {
        if let data = response.data {
          let result = try? JSONDecoder().decode(CurrentWeatherModel.self, from: data)
          if let result = result {
             completion(result)
          }
          else {
            completion(nil)
          }
        }
      }
    }
  }

  func getHourlyWeather(_ city: String,completion: @escaping ([HourlyWeather]?) -> Void) {
    guard let url = URL(string: "https://api.weatherbit.io/v2.0/forecast/hourly?city=\(city)&key=1524f1878a7c47fcac61ccd561b36df0&hours=12") else {
      completion(nil)
      return
    }
    Alamofire.request(url).responseData { (response) in
      if response.result.isSuccess {
        if let data = response.data {
          let result = try? JSONDecoder().decode(HourlyWeatherModel.self, from: data).data
          if let result = result {
             completion(result)
          }
          else {
            completion(nil)
          }
        }
      }
    }
  }
}
