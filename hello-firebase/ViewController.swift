//
//  ViewController.swift
//  hello-firebase
//
//  Created by Matt Kern on 11/10/20.
//

import Foundation
import Firebase
import FirebaseDatabase

class ViewController {
  
  let dg = DispatchGroup()
  var message = "placeholder text"
  
  var ref = Database.database().reference()
  
  func fetchData() -> String {
    print("fetching value")
    self.dg.enter()
    DispatchQueue.main.async {
      self.ref.child("hello").observeSingleEvent(of: .value, with: { (snapshot) in
        self.message = snapshot.value as! String
      }) { (error) in
        print(error.localizedDescription)
      }
    }
    dg.wait(timeout: .now() + 2.0)
    print("returning value")
    // this should work but I think that swift is optimizing and not refreshing the
    // value of message?
    return self.message
  }
}
