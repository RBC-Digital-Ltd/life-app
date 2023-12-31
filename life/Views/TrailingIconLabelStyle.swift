//
//  TrailingIconLabelStyle.swift
//  life
//
//  Created by Rahul Parkar on 07/06/2023.
//

import SwiftUI

// MARK: - TrailingIconLabelStyle

struct TrailingIconLabelStyle: LabelStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      configuration.title
      configuration.icon
    }
  }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
  static var trailingIcon: Self { Self() }
}
