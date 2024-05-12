//
//  DatabaseService.swift
//  Astrotalk
//
//  Created by Mac on 07/05/2024.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

//MARK: - A Database Singleton to be shared to viewcontrollers -
class ChatManager {
    static let shared = ChatManager()
    private let dbRef = Database.database().reference().child("chatRooms")
    
    private init() {}
    
    //MARK: Sends dictionary of message to the node tree in Database =
    func sendMessage(_ message: String) {
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        let messageNode = dbRef.child("messages").childByAutoId()
        messageNode.setValue([
            "text": message,
            "from": currentUserID,
            "timestamp": ServerValue.timestamp()
        
        ])
    }
    
    //MARK: - 
    func receiveMessage(from astrologerUID: String) {
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        dbRef.child("messages").queryOrdered(byChild: "to").queryEqual(toValue: currentUserID).observe(.value) { snapshot in
            snapshot.children.forEach { child in
                guard let messageData = child as? DataSnapshot else { return }
                guard let message = messageData.value as? [String: Any] else {return}
            }
        }
    }
}

