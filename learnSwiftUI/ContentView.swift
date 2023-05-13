//
//  ContentView.swift
//  learnSwiftUI
//
//  Created by djorge on 7/5/23.
//

import SwiftUI
import LearnSwiftPM

struct ContentView: View {
  
  let greet = LearnSwiftPM().greetMe("David")
  
  @State private var username: String = ""
  @State private var password: String = ""

  let trapezoid = Path { path in
    path.move(to: .zero)
    path.addLine(to: CGPoint(x: 90, y: 0))
    path.addLine(to: CGPoint(x: 80, y: 50))
    path.addLine(to: CGPoint(x: 10, y: 50))
  }

  var body: some View {
    ZStack {
      Theme.primaryColor.ignoresSafeArea()

      VStack{
        
        TextField(LocalizedStringKey("username") , text: $username)
          .padding()
          .background(Color.white)
          .cornerRadius(10)
        
        TextField(LocalizedStringKey("password"), text: $password)
          .padding()
          .background(Color.white)
          .cornerRadius(10)
        
        VStack(alignment: .leading) {
          BioCheckButton(titleKey: "login", selected: false, action: login)
          BioCheckButton(titleKey: "signup", selected: true, action: login)
          Spacer()
        }        
        Spacer()
      }
      .padding()
    }
  }
  
  func login() {
//    debugPrint("Login pressed username:\(username) password:\(password)")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
    }
  }
}

