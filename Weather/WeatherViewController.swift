//
//  WeatherViewController.swift
//  Weather
//
//  Created by Idris on 02/11/19.
//  Copyright © 2019 Idris-labs. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class WeatherViewController: UIViewController {
  var dailyWeatherList: DailyWeatherViewModel!
  var currentWeather: CurrentWeatherViewModel?
  let locationManager = CLLocationManager()
  var location:CLLocationManager!
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var locationSearchBar: UISearchBar!
  @IBOutlet weak var tempratureLabel: UILabel!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var emptyViewImage: UIView!
  @IBOutlet weak var blankViewImage: UIView!
  @IBOutlet weak var currentWeatherImage: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    self.locationManager.requestAlwaysAuthorization()
    self.locationManager.requestWhenInUseAuthorization()
    if CLLocationManager.locationServicesEnabled() {
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    self.locationSearchBar.delegate = self
  }
  
  @IBAction func refreshLocation(_ sender: UIBarButtonItem) {
    self.location.startUpdatingLocation()
  }
  private func getCurrentWeather(_ place: String) {
    Webservice().getCurrentWeather(place) { (result) in
      if let result = result {
        self.emptyViewImage.isHidden = true
        self.currentWeather = CurrentWeatherViewModel(weather: result)
        self.setupView()
      }
      else {
        self.emptyViewImage.isHidden = false
      }
    }
  }
  
  private func setupView() {
    if let weather = self.currentWeather {
      self.cityLabel.text = weather.cityNameWeather
      self.tempratureLabel.text = weather.tempratureWeather
      self.descriptionLabel.text = weather.descriptionWeather
    }
  }
  
  
  private func setupTableView(_ city: String){
    Webservice().getDailyWeather(city) { (response) in
      if let response = response {
        self.dailyWeatherList = DailyWeatherViewModel(response)
        DispatchQueue.main.async {
          self.blankViewImage.isHidden = true
          self.tableView.reloadData()
          self.tableView.dataSource = self
          self.tableView.delegate = self
        }
      }
      else {
        self.blankViewImage.isHidden = false
      }
    }
  }
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.dailyWeatherList.numberOfRowsInSection(section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    
    let cell = self.tableView.dequeueReusableCell(withIdentifier: "DailyWeatherCell", for: indexPath) as! DailyWeatherTableViewCell
    let dailyWeatherVM = self.dailyWeatherList.dailyWeatherAtIndex(indexPath.row)
    cell.dayLabel.text = Helper().dateConverter(dailyWeatherVM.datetime)
    cell.descriptionLabel.text = dailyWeatherVM.weather.description
    cell.tempratureLabel.text = "\(Int(dailyWeatherVM.temp))°"
    return cell
  }
}


extension WeatherViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    if let keyword = searchBar.text {
      self.getCurrentWeather(keyword)
      self.setupTableView(keyword)
    }
    self.locationSearchBar.resignFirstResponder()
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.locationSearchBar.resignFirstResponder()
  }
}

extension WeatherViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    self.location = manager
    self.location.stopUpdatingLocation()
    if let node = self.location.location {
      let location = CLLocation(latitude: node.coordinate.latitude, longitude: node.coordinate.longitude)
      let geocoder = CLGeocoder()
      geocoder.reverseGeocodeLocation(location) { (response, error) in
        if let error = error {
          fatalError()
        }
        else {
          if let geocodeLocation = response {
            guard let placemark = geocodeLocation.first else {return}
            if let place = placemark.subAdministrativeArea {
              self.getCurrentWeather(place)
              self.setupTableView(place)
            }
          }
        }
      }
    }
  }
}
