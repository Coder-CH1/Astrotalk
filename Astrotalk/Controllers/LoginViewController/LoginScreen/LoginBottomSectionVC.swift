//
//  BottomSectionSignupVC.swift
//  Astrotalk
//
//  Created by Mac on 24/04/2024.
//

import UIKit
import GoogleSignIn
import Firebase

// MARK: -
class LoginBottomSectionVC: UIViewController {
    
    // MARK: - UI -
    
    let bottomView = CustomView(color: .systemYellow)
    
    let signinButton = Button(image: UIImage(named: "google"), text: "Login with Google", btnTitleColor: .red, backgroundColor: .white, radius: 8, imageColor: .clear)
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGidc()
        configureButton()
        setSubviewsAndLayout()
    
        GIDSignIn.sharedInstance.restorePreviousSignIn()
    }
    
    //MARK: -
    func configureGidc() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
    }
    
    //MARK: Customize custom button
    func configureButton() {
        signinButton.titleLabel!.font = customFont(size: 16, font: .PoppinsBold)
        signinButton.addTarget(self, action: #selector(signinBtnPressed), for: .touchUpInside)
        signinButton.translatesAutoresizingMaskIntoConstraints = false
        signinButton.layer.shadowColor = UIColor.lightGray.cgColor
        signinButton.layer.shadowOpacity = 10
        signinButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        signinButton.layer.shadowRadius = 6
        signinButton.layer.masksToBounds = false
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        view.addSubview(bottomView)
        bottomView.addSubview(signinButton)
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: view.frame.size.height/3),
            bottomView.widthAnchor.constraint(equalToConstant: view.frame.width),
            
            signinButton.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 30),
            signinButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            signinButton.heightAnchor.constraint(equalToConstant: 45),
            signinButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}

// MARK: - Extension - Firebase Google Signin Implementation
extension LoginBottomSectionVC {
    @objc func signinBtnPressed() {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [weak self] result, error in
            guard self != nil else {return}
            guard error == nil else {
                print("Google Sign-In error: \(error!.localizedDescription)")
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase Sign-In error: \(error.localizedDescription)")
                    return
                }
                guard let currentUser = Auth.auth().currentUser else { return }
                
                let userEmail = currentUser.email ?? ""
                self?.saveUserEmailToDB(email: userEmail)
                self?.saveAstrologersEmailToDB(email: userEmail)
                self?.dismiss(animated: false)
                self?.navigateToHomeScreen()
            }
        }
    }
    
    //MARK: - Function to check astrologers and users for login flow -
    func navigateToHomeScreen() {
        if Auth.auth().currentUser?.uid == "TbzC8naSFrMRyZbLCgNJUUzxYMJ2" {
            let astrologerVC = AstrologerProfileViewController()
            let astrologerProfileVC = AstrologerProfileViewController()
            self.navigationController?.pushViewController(astrologerProfileVC, animated: false)
        } else {
            let vc = TabBarViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false)
        }
    }
    
    //MARK: - Save users email to Database -
    func saveUserEmailToDB(email: String) {
        guard let user = Auth.auth().currentUser else {return}
        let dbRef = Database.database().reference()
        dbRef.child("users").child(user.uid).child("email").setValue(email) {
            error, ref in
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                print("users saved successfully")
            }
        }
    }
    
    //MARK: - Save users email to Database -
    func saveAstrologersEmailToDB(email: String) {
        guard let user = Auth.auth().currentUser else {return}
        let dbRef = Database.database().reference()
        dbRef.child("astrologers").child(user.uid).child("email").setValue(email) {
            error, ref in
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                print("astrologers saved successfully")
            }
        }
    }
    
    //MARK: -
    func checkIfUserIsAstrologer() -> Bool {
        return false
    }
}
