//
//  ChatsVC.swift
//  Astrotalk
//
//  Created by Mac on 07/05/2024.
//

import UIKit
import Firebase

//MARK: -
class MessageViewController: UIViewController {
    
    //MARK: - UI -
    var usersModel: [RegisteredUsersModel] = []
    let dbRef = Database.database().reference().child("users")
    
    lazy var chatsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MessagesCell.self, forCellReuseIdentifier: "MessagesCell")
        return tableView
    }()
    
    //MARK: - Lifecyle -
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Messages"
        setSubviewsAndLayout()
        fetchUsersFromDB()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        view.addSubview(chatsTableView)
        NSLayoutConstraint.activate([
            chatsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            chatsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            chatsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            chatsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
    }
}

//MARK: - Extension - DataSource, Delegate
extension MessageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessagesCell", for: indexPath) as! MessagesCell
        cell.backgroundColor = .systemBlue
        cell.accessoryType = .disclosureIndicator
        let user = usersModel[indexPath.row]
        cell.textLabel?.text = user.email
        cell.textLabel?.textColor = .blue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chatsTableView.deselectRow(at: indexPath, animated: true)
        let selectedUser = usersModel[indexPath.row]
        let chatsKitVC = ChatsViewController()
        chatsKitVC.title = "Chat with \(selectedUser.email)"
        navigationController?.pushViewController(chatsKitVC, animated: false)
    }
    
    //MARK: - Fetch registered users from Database -
    func fetchUsersFromDB() {
        dbRef.observe(.childAdded) { snapshot,_ in
            if let dict = snapshot.value as? [String: Any] {
                guard let email = dict["email"] as? String else {
                    print("Error: Email not found in user data")
                    return
                }
                let user = RegisteredUsersModel(email: email)
                self.usersModel.append(user)
                print("\(user.email)")
                DispatchQueue.main.async {
                    self.chatsTableView.reloadData()
                }
            }
        }
    }
}

