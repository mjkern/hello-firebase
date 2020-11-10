//
//  ContentView.swift
//  hello-firebase
//
//  Created by Matt Kern on 11/10/20.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel = ViewModel()
  let viewController = ViewController()
  var body: some View {
    VStack {
      Text("Asynchronous Message: " + viewModel.message)
        .padding()
        .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
          self.viewModel.fetchData()
        })
      Text("Synchronous Message: " + viewController.fetchData())
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
