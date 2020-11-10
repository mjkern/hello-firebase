//
//  ContentView.swift
//  hello-firebase
//
//  Created by Matt Kern on 11/10/20.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel = ViewModel()
  var body: some View {
    Text("Message: " + viewModel.message)
      .padding()
      .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
        self.viewModel.fetchData()
      })
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
