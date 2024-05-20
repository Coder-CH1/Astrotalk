
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
    var messages = [Chats]()
    
    lazy var chatsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(ChatsTableViewCell.self, forCellReuseIdentifier: "ChatsTableViewCell")
        return tableView
    }()
    
    let textfieldView = CustomView(color: .systemYellow)
    
    let chatsTextField = TextField(placeholder: "", isSecureTextEntry: false, radius: 10, background: .white)
    let sendBtn = Button(image: UIImage(systemName: ""), text: "Send", btnTitleColor: .black, backgroundColor: .clear, radius: 0, imageColor: .clear)
    
    //MARK: - Lifecyle -
    override func viewDidLoad() {
        super.viewDidLoad()
        getMessages()
    }
    
    //MARK: - Fetching Multiple Dictionary Registered users from Database -
    func getMessages() {
        let msgDB = Database.database().reference().child("Messages")
        msgDB.observe(.childAdded) {  [weak self] (snapshot: DataSnapshot) -> Void in
            let value = snapshot.value as! Dictionary<String,String>
            let text = value["MessageBody"]!
            let sender = value["Sender"]!
            var msg = Chats()
            msg.msgBody = text
            msg.sender = sender
            self?.messages.append(msg)
            print("\(String(describing: self?.messages.count))")
            self?.chatsTableView.reloadData()
        }
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
        cell.userNameLabel.text = messages[indexPath.row].sender
        cell.chatsLabel.text = messages[indexPath.row].msgBody
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    // MARK: - Subviews and Layout -
    func subviewsAndLayout() {
        view.addSubview(chatsTableView)
        view.addSubview(textfieldView)
        textfieldView.addSubview(chatsTextField)
        textfieldView.addSubview(sendBtn)
        NSLayoutConstraint.activate([
            chatsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            chatsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160),
            
            textfieldView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            textfieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textfieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textfieldView.heightAnchor.constraint(equalToConstant: 80),
            
            chatsTextField.topAnchor.constraint(equalTo: textfieldView.topAnchor, constant: 15),
            chatsTextField.leadingAnchor.constraint(equalTo: textfieldView.leadingAnchor, constant: 10),
            chatsTextField.widthAnchor.constraint(equalToConstant: 250),
            chatsTextField.heightAnchor.constraint(equalToConstant: 45),
            
            sendBtn.topAnchor.constraint(equalTo: textfieldView.topAnchor, constant: 25),
            sendBtn.leadingAnchor.constraint(equalTo: chatsTextField.trailingAnchor, constant: 20),
        ])
        sendBtn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        configureTextField()
    }
    
    func configureTextField() {
        chatsTextField.backgroundColor = .white
        chatsTextField.layer.borderWidth = 1
        chatsTextField.layer.borderColor = UIColor.black.cgColor
        chatsTextField.layer.cornerRadius = 10
        chatsTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: view.frame.height))
        chatsTextField.leftViewMode = .always
        chatsTextField.attributedPlaceholder = NSAttributedString(string: "Enter your message", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
    
    //MARK: Implementation to update and embed the Textfield chats to the TableView -
    @objc func btnTapped() {
        chatsTextField.endEditing(true)
        chatsTextField.isEnabled = false
        sendBtn.isEnabled = false
        let msgDB = Database.database().reference().child("Messages")
        let msgDict = ["Sender" : Auth.auth().currentUser?.email, "MessageBody" : chatsTextField.text!]
        msgDB.childByAutoId().setValue(msgDict){(error,ref) in
            if(error != nil){
                print("\(String(describing: error?.localizedDescription))")
            }else{
                debugPrint("Msg saved successfully")
                self.chatsTextField.isEnabled = true
                self.sendBtn.isEnabled = true
                self.chatsTextField.text = nil
            }
        }
    }
}
