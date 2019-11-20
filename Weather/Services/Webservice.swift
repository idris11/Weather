//
//  Webservice.swift
//  Weather
//
//  Created by Idris on 02/11/19.
//  Copyright © 2019 Idris-labs. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD
struct Webservice {
  func getDailyWeather(_ city: String, completion: @escaping ([DailyWeather]?) -> Void) {
    if let url = URL(string: "https://api.weatherbit.io/v2.0/forecast/daily?city=\(city)&key=1524f1878a7c47fcac61ccd561b36df0&lang=id") {
      Alamofire.request(url).responseData { (response) in
        if response.result.isSuccess {
          if let data = response.data {
            let result = try? JSONDecoder().decode(DailyWeatherModel.self, from: data).data
            if let result = result {
               completion(result)
            }
            else {
              self.defaultDailyWeather { (res) in
                completion(res)
              }
            }
          }
        }
      }
    }
    else {
      self.defaultDailyWeather{ (res) in
        completion(res)
      }
    }
  }
  
  func getCurrentWeather(_ city: String,completion: @escaping (CurrentWeatherModel?) -> Void) {
    if let url = URL(string: "https://api.weatherbit.io/v2.0/current?city=\(city)&key=1524f1878a7c47fcac61ccd561b36df0&lang=id") {
      Alamofire.request(url).responseData { (response) in
        if response.result.isSuccess {
          if let data = response.data {
            let result = try? JSONDecoder().decode(CurrentWeatherModel.self, from: data)
            if let result = result {
               completion(result)
            }
            else {
              self.defaultCurrentWeather { (res) in
                completion(res)
              }
            }
          }
        }
      }
    }
    else {
      self.defaultCurrentWeather { (res) in
        completion(res)
      }
    }
  }

  func getHourlyWeather(_ city: String,completion: @escaping ([HourlyWeather]?) -> Void) {
    if let url = URL(string: "https://api.weatherbit.io/v2.0/forecast/hourly?city=\(city)&key=1524f1878a7c47fcac61ccd561b36df0&hours=12") {
      Alamofire.request(url).responseData { (response) in
        if response.result.isSuccess {
          if let data = response.data {
            let result = try? JSONDecoder().decode(HourlyWeatherModel.self, from: data).data
            if let result = result {
               completion(result)
            }
            else {
              self.defaultHourlyWeather { (res) in
                completion(res)
              }
            }
          }
        }
      }
    }
    else {
      self.defaultHourlyWeather{ (res) in
        completion(res)
      }
      DispatchQueue.main.asyncAfter(deadline: .now()+1) {
        SVProgressHUD.dismiss()
      }
    }
  }
  
  private func defaultCurrentWeather(completion: @escaping (CurrentWeatherModel) -> Void) {
    let url = URL(string: "https://api.weatherbit.io/v2.0/current?city=jakarta&key=1524f1878a7c47fcac61ccd561b36df0&lang=id")!
    Alamofire.request(url).responseData { (response) in
      if response.result.isSuccess {
        if let data = response.data {
          let result = try? JSONDecoder().decode(CurrentWeatherModel.self, from: data)
          if let result = result {
             completion(result)
          }
        }
      }
    }
  }
  
  private func defaultHourlyWeather(completion: @escaping ([HourlyWeather]) -> Void) {
    let url = URL(string: "https://api.weatherbit.io/v2.0/forecast/hourly?city=jakarta&key=1524f1878a7c47fcac61ccd561b36df0&hours=12")!
    Alamofire.request(url).responseData { (response) in
      if response.result.isSuccess {
        if let data = response.data {
          let result = try? JSONDecoder().decode(HourlyWeatherModel.self, from: data).data
          if let result = result {
             completion(result)
          }
        }
      }
    }
  }
  
  private func defaultDailyWeather(completion: @escaping ([DailyWeather]) -> Void) {
    let url = URL(string: "https://api.weatherbit.io/v2.0/forecast/daily?city=jakarta&key=1524f1878a7c47fcac61ccd561b36df0&lang=id")!
    Alamofire.request(url).responseData { (response) in
      if response.result.isSuccess {
        if let data = response.data {
          let result = try? JSONDecoder().decode(DailyWeatherModel.self, from: data).data
          if let result = result {
             completion(result)
          }
        }
      }
    }
  }
}
