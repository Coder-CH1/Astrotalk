
//  MessageViewController.swift
//  Astrotalk
//
//  Created by Mac on 07/05/2024.


import UIKit
//import MessageKit
//import InputBarAccessoryView
import FirebaseDatabase

class ChatsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let dbRef = Database.database().reference()
    let currentUser = Member(name: "bbbbbb", color: .red)
    let otherUser = Member(name: "cccccc", color: .green)
    var messages: [Chats] = []
    var member: Member!
    
    lazy var chatsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.backgroundColor = .lightGray
        tableView.register(ChatsTableViewCell.self, forCellReuseIdentifier: "ChatsTableViewCell")
        return tableView
    }()
    
    let chatsTextField = TextField(placeholder: "", isSecureTextEntry: false, radius: 10, background: .gray)
    let sendBtn = Button(image: UIImage(systemName: ""), text: "Send", btnTitleColor: .systemYellow, backgroundColor: .clear, radius: 0, imageColor: .clear)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subviewsAndLayout()
        dbRef.child("messages").observe(.childAdded, with: { [weak self] (snapshot) in
            guard let self = self else { return }
            if let messageData = snapshot.value as? [String: String],
               let messageText = messageData["message"],
               let sender = messageData["sender"] {
                // Create a Chats instance from the received message data
                let chatMessage = Chats(text: messageText, sender: sender)
                // Append the received chat message to the local array
                self.messages.append(chatMessage)
                // Reload the table view to reflect the new message
                self.chatsTableView.reloadData()
            }
        })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatsTableViewCell", for: indexPath) as! ChatsTableViewCell
        let message = messages[indexPath.row]
        let isCurrentUser = message.sender == ""
        cell.textLabel?.textAlignment = isCurrentUser ? .right : .left
        cell.textLabel?.backgroundColor = .systemYellow
        return cell
    }
    
    // MARK: - Subviews and Layout -
    func subviewsAndLayout() {
        view.addSubview(chatsTableView)
        view.addSubview(chatsTextField)
        view.addSubview(sendBtn)
        NSLayoutConstraint.activate([
            chatsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            chatsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            chatsTextField.bottomAnchor.constraint(equalTo: chatsTableView.bottomAnchor, constant: -100),
            chatsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            chatsTextField.widthAnchor.constraint(equalToConstant: 300),
            chatsTextField.heightAnchor.constraint(equalToConstant: 50),
            
            sendBtn.bottomAnchor.constraint(equalTo: chatsTableView.bottomAnchor, constant: -110),
            sendBtn.leadingAnchor.constraint(equalTo: chatsTextField.trailingAnchor, constant: 20),
        ])
        chatsTextField.backgroundColor = .systemGray6
        chatsTextField.layer.borderWidth = 2
        chatsTextField.layer.borderColor = UIColor.gray.cgColor
        chatsTextField.layer.cornerRadius = 20
        sendBtn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
    }
    
    @objc func btnTapped() {
        if let message = chatsTextField.text, !message.isEmpty {
            let messageData = [
                "message": message,
                "sender": "Your sender identifier"
            ]
            dbRef.child("messages").childByAutoId().setValue(messageData)
            chatsTextField.text = ""
        }
    }
}

