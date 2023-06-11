//
//  lifeApp.swift
//  life
//
//  Created by Rahul Parkar on 06/06/2023.
//

import SwiftUI

@main
struct LifeApp: App {
  var body: some Scene {
    WindowGroup {
      ScrumsView(scrums: DailyScrum.sampleData)
    }
  }
}
