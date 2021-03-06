//
//  ViewModel.swift
//  hello-firebase
//
//  Created by Matt Kern on 11/10/20.
//

import Foundation
import Firebase
import FirebaseDatabase

class ViewModel: ObservableObject {
  @Published var message = "hard coded message"
  
  var ref = Database.database().reference()
  func fetchData() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      // https://stackoverflow.com/questions/38031137/how-to-program-a-delay-in-swift-3
      self.ref.child("hello").observeSingleEvent(of: .value, with: { (snapshot) in
        self.message = snapshot.value as! String
      }) { (error) in
        print(error.localizedDescription)
      }
    }
  }
  
  
}
