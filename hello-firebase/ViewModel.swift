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
    ref.child("hello").observeSingleEvent(of: .value, with: { (snapshot) in
      self.message = snapshot.value as! String
    }) { (error) in
      print(error.localizedDescription)
    }
  }
}
