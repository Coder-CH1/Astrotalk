//
//  AstrologerProfileViewController.swift
//  Astrotalk
//
//  Created by Mac on 03/05/2024.
//

import UIKit
import FirebaseStorage
import Kingfisher

//MARK: -
class AstrologerProfileViewController: UIViewController {
    
    //MARK: - UI -
    let topView = TopView(color: .systemYellow)
    let profileImage = ImageView(image: UIImage(systemName: "person.circle"))
    let profileName = Label(label: "Aman Preet", textColor: .black, font: UIFont.systemFont(ofSize: 14, weight: .regular))
    let profileEmail = Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 14, weight: .bold))
    let expYrs = Label(label: "Exp: 8years", textColor: .gray, font: UIFont.systemFont(ofSize: 14, weight: .bold))
    let lineView = CustomView(color: .lightGray)
    let dividerView = CustomView(color: .lightGray)
    let chatButton = Button(image: UIImage(systemName: "ellipsis.message.fill"), text: "", btnTitleColor: .black, backgroundColor: .clear, radius: 0, imageColor: .gray)
    let callButton = Button(image: UIImage(systemName: "phone.fill"), text: "", btnTitleColor: .black, backgroundColor: .clear, radius: 0, imageColor: .gray)
    
    //MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviewsAndLayout()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        chatButton.addTarget(self, action: #selector(chatBtnTapped), for: .touchUpInside)
        callButton.addTarget(self, action: #selector(callBtnTapped), for: .touchUpInside)
        let subviews = [topView, profileImage, profileEmail, profileName, expYrs, lineView, chatButton, dividerView, callButton]
        for subview in subviews {
            view.addSubview(subview)
        }
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.widthAnchor.constraint(equalToConstant: view.frame.width),
            topView.heightAnchor.constraint(equalToConstant: 155),
            
            profileImage.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profileImage.widthAnchor.constraint(equalToConstant: 70),
            profileImage.heightAnchor.constraint(equalToConstant: 70),
            
            profileName.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 30),
            profileName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
            
            profileEmail.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 5),
            profileEmail.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
            
            expYrs.topAnchor.constraint(equalTo: profileEmail.bottomAnchor, constant: 5),
            expYrs.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
            
            lineView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 50),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            
            dividerView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 3),
            dividerView.leadingAnchor.constraint(equalTo: chatButton.trailingAnchor, constant: 80),
            dividerView.widthAnchor.constraint(equalToConstant: 1),
            dividerView.heightAnchor.constraint(equalToConstant: 20),
            
            chatButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 5),
            chatButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            
            callButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 5),
            callButton.leadingAnchor.constraint(equalTo: dividerView.trailingAnchor, constant: 90),
        ])
        updateViews()
    }
    
    //MARK: -
    @objc func chatBtnTapped() {
        let vc = MessageViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc func callBtnTapped() {
        let vc = CallsViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func updateViews() {
        FirestoreService.shared.fetchDataForProfileAstrologers {[weak self] profileAstrologers, error in
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                DispatchQueue.main.async{
                    for profile in profileAstrologers {
                        if let imageUrl = profile.fields["image"] {
                            let url = URL(string: imageUrl)
                            self?.profileImage.kf.setImage(with: url)
                        }
                        if let name = profile.fields["name"] {
                            self?.profileName.text = name
                        }
                        if let email = profile.fields["email"] {
                            self?.profileEmail.text = email
                        }
                        if let expr = profile.fields["expr"] {
                            self?.expYrs.text = expr
                        }
                    }
                }
            }
        }
    }
}

//MARK: - Protocol Delegate of the Image Picker and Navigation Control Delegate -
extension AstrologerProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImage.image = selectedImage
            uploadImageToFirebase(img: selectedImage)
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    //MARK: - Function to upload the image to Firebase -
    func uploadImageToFirebase(img: UIImage) {
        guard let imageData = img.jpegData(compressionQuality: 0.5) else { return}
        let storageReference = Storage.storage().reference().child("profile_images").child("user_profile.jpg")
        storageReference.putData(imageData, metadata: nil) { metaData, error in
            if let error = error {
                print("\(error.localizedDescription)")
                return
            }
        }
    }
}
