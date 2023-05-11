//
//  BioCheckButton.swift
//  learnSwiftUI
//
//  Created by djorge on 8/5/23.
//

import SwiftUI

struct BioCheckButton: View {
  
  @State private var selected: Bool
  @State private var fillColor: Color
  @State private var shadowWhite: Double

  let titleKey: String
  let action: () -> Void
  
  init(titleKey: String, selected: Bool, action: @escaping () -> Void) {
    self.titleKey = titleKey
    self.selected = selected;
    self.action = action

    fillColor = selected ? Color.init(.sRGB, white: 0.8, opacity: 1.0) : Color.init(.sRGB, white: 0.9, opacity: 1.0)
    shadowWhite = selected ? 0.4 : 0.9
    
  }
  
  var body: some View {
    HStack {
      Circle()
        .fill(Color(white: 0.9))
        .frame(width: 35, height: 35)
        .shadow(color: Color.white, radius: 5, x: -5, y: -5)
        .shadow(color: Color.gray, radius: 5, x: 5, y: 5)
        .overlay(content: {
          if selected {
            Circle()
              .fill(Color(white: 0.85, opacity: 0.6))
              .frame(width: 25, height: 25)
              .shadow(color: Color.gray, radius: 1.0, x: -1.0, y: -1.0)
              .shadow(color: Color.white, radius: 1.0, x: 1.0, y: 1.0)
          } else {
            Circle()
              .fill(Color(white: 0.96, opacity: 0.6))
              .frame(width: 25, height: 25)
              .shadow(color: Color.gray, radius: 1.0, x: 1.0, y: 1.0)
              .shadow(color: Color.white, radius: 1.0, x: -1.0, y: -1.0)
          }
        })
      
      Text(LocalizedStringKey(titleKey))
        .font(Font.callout)
        .bold()
        .padding()
        .foregroundColor(Color.mint)
      
    }.onTapGesture {
      selected = !selected
      action()
      withAnimation(.linear(duration: 1)) {
        fillColor = selected ? Color.init(.sRGB, white: 0.8, opacity: 1.0) : Color.init(.sRGB, white: 0.9, opacity: 1.0)
        shadowWhite = selected ? 0.4 : 0.9
      }
    }
  }
}
