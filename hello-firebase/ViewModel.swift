//
//  ViewModel.swift
//  hello-firebase
//
//  Created by Matt Kern on 11/10/20.
//

import Foundation
import FirebaseFirestore

class ViewModel: ObservableObject {
  @Published var message = "hard coded message"
  
  private var db = Firestore.firestore()
  
  func fetchData() {
    self.message = db.value(forKey: "hello") as! String
  }
}
