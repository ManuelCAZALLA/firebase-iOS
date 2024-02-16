//
//  Tweet+Firebase.swift
//  firebaseios
//
//  Created by Manuel Cazalla Colmenero on 15/2/24.
//

import FirebaseFirestore

extension Tweet {
    
    convenience init?(document: QueryDocumentSnapshot) {
        
        guard let userName = document.get("userName") as? String,
              let typeString = document.get("type") as? String,
              let type = TweetType(rawValue: typeString),
              let message = document.get("message") as? String,
              let timestamp = document.get("timestamp") as? String else {
                  return nil
              }
        
        self.init(id: document.documentID, userName: userName, type: type, message: message, timestamp: timestamp)
        
    }
    
    var dictionary: [String : Any] {
        return [
            "userName": userName,
            "type":type.rawValue,
            "message": message,
            "timestamp": timestamp]
    }
}
