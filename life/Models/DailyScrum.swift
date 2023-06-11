//
//  DailyScrum.swift
//  life
//
//  Created by Rahul Parkar on 07/06/2023.
//

import Foundation

// MARK: - DailyScrum

struct DailyScrum: Identifiable {
  let id: UUID
  var title: String
  var attendees: [String]
  var lengthInMinutes: Int
  var theme: Theme

  init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
    self.id = id
    self.title = title
    self.attendees = attendees
    self.lengthInMinutes = lengthInMinutes
    self.theme = theme
  }
}

extension DailyScrum {
  static let sampleData: [DailyScrum] = [
    DailyScrum(title: "Design", attendees: ["Ray"], lengthInMinutes: 30, theme: .yellow),
    DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
  ]
}
