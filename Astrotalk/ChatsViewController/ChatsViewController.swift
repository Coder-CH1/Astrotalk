
//  MessageViewController.swift
//  Astrotalk
//
//  Created by Mac on 07/05/2024.


import UIKit
import FirebaseAuth
import FirebaseDatabase

//MARK: -
class ChatsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - UI -
    let dbRef = Database.database().reference()
    var messages: [Chats] = []
    var member: Member!
    
    lazy var chatsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(ChatsTableViewCell.self, forCellReuseIdentifier: "ChatsTableViewCell")
        return tableView
    }()
    
    let chatsTextField = TextField(placeholder: "", isSecureTextEntry: false, radius: 10, background: .gray)
    let sendBtn = Button(image: UIImage(systemName: ""), text: "Send", btnTitleColor: .systemYellow, backgroundColor: .clear, radius: 0, imageColor: .clear)
    
    //MARK: - Lifecyle -
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUsersFromDB()
    }
    
    //MARK: - Fetching Multiple Dictionary Registered users from Database -
    func fetchUsersFromDB() {
        dbRef.child("messages").observe(.childAdded, with: { [weak self] (snapshot) in
            guard let self = self else { return }
            if let messageData = snapshot.value as? [String: String],
               let messageText = messageData["message"],
               let sender = messageData["sender"] {
                let chatMessage = Chats(text: messageText, sender: sender)
                self.messages.append(chatMessage)
                self.chatsTableView.reloadData()
            }
        })
        subviewsAndLayout()
    }
}

//MARK: - DataSource, Delegate -
extension ChatsViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatsTableViewCell", for: indexPath) as! ChatsTableViewCell
        let message = messages[indexPath.row]
        let currentUserUID = Auth.auth().currentUser?.uid
        let isCurrentUser = message.sender == currentUserUID
        if isCurrentUser {
            cell.rightAlignedLabel.text = message.text
            cell.rightAlignedLabel.textColor = .lightGray
            cell.rightAlignedLabel.textAlignment = .right
        } else {
            cell.leftAlignedLabel.text = message.text
            cell.leftAlignedLabel.textColor = .systemYellow
            cell.leftAlignedLabel.textAlignment = .left
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
    
    //MARK: Implementation to update and embed the Textfield chats to the TableView -
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
