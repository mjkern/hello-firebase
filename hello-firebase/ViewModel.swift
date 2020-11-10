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
    db.collection("hello").addSnapshotListener({
      (querySnapshot, error) in
      guard let recievedMessage = querySnapshot?.documents else {
        print("No message")
        return
      }
      self.message = recievedMessage.first!.data().first!.key
    })
  }
}
