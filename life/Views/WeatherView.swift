//
//  WeatherView.swift
//  life
//
//  Created by Rahul Parkar on 07/06/2023.
//

import SwiftUI

// MARK: - WeatherView

struct WeatherView: View {
  @ObservedObject var weatherViewModel: WeatherViewModel

  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack {
        WeatherDetailView(weather: weatherViewModel.currentWeather)
      }
      .frame(maxWidth: .infinity)
    }
    .ignoresSafeArea(.all)
    .background(LinearGradient(
      colors: weatherViewModel.currentWeather.isDaylight
        ? [.blue.opacity(0.7), .blue]
        : [.black.opacity(0.7), .black],
      startPoint: .top,
      endPoint: .bottom))
    .onAppear {
      Task {
        await weatherViewModel.getWeather()
      }
    }
  }
}

// MARK: - WeatherDetailView

// struct WeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherView(weatherViewModel: WeatherViewModel())
//    }
// }

struct WeatherDetailView: View {
  let weather: Weather

  var body: some View {
    VStack {
      Spacer()

      VStack(spacing: 30) {
        Image(systemName: weather.symbolName)
          .resizable()
          .scaledToFit()
          .foregroundColor(.white)
          .frame(width: 80, height: 80)

        Text(String(format: "%.0f", weather.temperature) + "°C")
          .foregroundColor(.white)
          .font(.largeTitle)

        Text(weather.condition.uppercased())
          .foregroundColor(.white)
          .font(.body)

        HStack {
          HStack(spacing: 10) {
            Image(systemName: "humidity.fill")
              .resizable()
              .scaledToFit()
              .foregroundColor(.white)
              .frame(width: 20, height: 20)

            Text(String(format: "%.0f", weather.humidity) + "%")
              .foregroundColor(.white)
              .font(.body)
          }
        }
      }
      .padding(.top, 80)

      Spacer()
    }
    .padding(.top, 50)
  }
}

extension Double {
  func formattedValue(style: NumberFormatter.Style = .decimal) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = style

    return formatter.string(from: NSNumber(value: self)) ?? ""
  }
}
