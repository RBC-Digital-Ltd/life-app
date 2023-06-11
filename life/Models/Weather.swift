//
//  Weather.swift
//  life
//
//  Created by Rahul Parkar on 07/06/2023.
//

import CoreLocation
import Foundation
import WeatherKit

// MARK: - Weather

struct Weather {
  let temperature: Double
  let condition: String
  let symbolName: String
  let humidity: Double
  let isDaylight: Bool

  static func empty() -> Weather {
    Weather(temperature: 0, condition: "", symbolName: "", humidity: 0, isDaylight: false)
  }
}

// MARK: - WeatherViewModel

class WeatherViewModel: ObservableObject {
  let service = WeatherService()

  @Published var currentWeather: Weather = .empty()

  func getWeather() async {
    do {
      let weather = try await service.weather(for: CLLocation(latitude: 51.506927, longitude: -0.256908))

      currentWeather = Weather(
        temperature: weather.currentWeather.temperature.value,
        condition: weather.currentWeather.condition.rawValue,
        symbolName: weather.currentWeather.symbolName,
        humidity: weather.currentWeather.humidity,
        isDaylight: weather.currentWeather.isDaylight)
    } catch {
      assertionFailure(error.localizedDescription)
    }
  }
}
