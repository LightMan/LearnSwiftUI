//
//  BioCheckButton.swift
//  learnSwiftUI
//
//  Created by djorge on 8/5/23.
//

import SwiftUI

struct BioCheckButton: View {
  
  @State private var selected: Bool = false
  @State private var fillColor: Color
  @State private var shadowWhite: Double
  @State private var shadowOffset: Double

  let titleKey: String
  let action: () -> Void
  
  init(titleKey: String, selected: Bool, action: @escaping () -> Void) {
    self.titleKey = titleKey
    self.selected = selected;
    self.action = action

    fillColor = selected ? Color(white: 0.85, opacity: 0.6) : Color(white: 0.96, opacity: 0.6)
    shadowWhite = selected ? 0.4 : 0.9
    shadowOffset = selected ? -1.0 : 1.0
  }
  
  var body: some View {
    HStack {
      Circle()
        .fill(Color(white: 0.9))
        .frame(width: 35, height: 35)
        .shadow(color: Color.white, radius: 5, x: -5, y: -5)
        .shadow(color: Color.gray, radius: 5, x: 5, y: 5)
        .overlay(content: {
          Circle()
            .fill(fillColor)
            .frame(width: 25, height: 25)
            .shadow(color: Color.gray, radius: 1.0, x: shadowOffset, y: shadowOffset)
            .shadow(color: Color.white, radius: 1.0, x: -shadowOffset, y: -shadowOffset)
        })
      
      Text(LocalizedStringKey(titleKey))
        .font(Font.callout)
        .bold()
        .padding()
        .foregroundColor(Color.mint)
      
    }.onTapGesture {
      selected = !selected
      action()
      withAnimation(.spring(response: 0.2, dampingFraction: 0.4, blendDuration: 0.2)) {
        fillColor = selected ? Color(white: 0.85, opacity: 0.6) : Color(white: 0.96, opacity: 0.6)
        shadowWhite = selected ? 0.4 : 0.9
        shadowOffset = selected ? -1.0 : 1.0
      }
    }
  }
}
