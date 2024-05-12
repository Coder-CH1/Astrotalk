//
//  PofileViewController.swift
//  Astrotalk
//
//  Created by Mac on 02/05/2024.
//

import UIKit
import Firebase
import FirebaseStorage
import GoogleSignIn

//MARK: -
class UserProfileViewController: UIViewController {
    
    //MARK: - UI -
    let topView = TopView(color: .systemYellow)
    let profileImage = ImageView(image: UIImage(systemName: ""))
    
    let profileUser = Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 14, weight: .regular))
    
    let userTextField = TextField(placeholder: "Enter name", isSecureTextEntry: false, radius: 0, background: .clear)
    
    let userView = CustomTextFieldView(color: .systemYellow)
    
    let currentAddressLabel = Label(label: "Current Address", textColor: .black, font: UIFont.systemFont(ofSize: 14, weight: .regular))
    
    let currentAddressTextField = TextField(placeholder: "Enter Flat, House no, Building, Apartment", isSecureTextEntry: false, radius: 0, background: .clear)
    
    let currentAddressView = CustomTextFieldView(color: .systemYellow)
    
    //MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        saveEmailToProfile()
    }
    
    //MARK: - Saving users email address to their profile -
    func saveEmailToProfile() {
        if let currentUser = Auth.auth().currentUser {
            profileUser.text = currentUser.email
            userTextField.isHidden = false
            currentAddressTextField.isHidden = false
        } else {
            profileUser.isHidden = true
            userTextField.isHidden = true
            currentAddressTextField.isHidden = true
        }
        tapGesture()
    }
    
    //MARK: - Tap gesture action on an image -
    func tapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileUserImageTapped))
        profileImage.addGestureRecognizer(tapGesture)
        configureImage()
    }
    
    //MARK: - Customizing the image -
    func configureImage() {
        profileImage.layer.cornerRadius = 35
        profileImage.clipsToBounds = true
        setSubviewsAndLayout()
    }
    
    //MARK: - Function to tap open the image library -
    @objc func profileUserImageTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        let subviews = [topView, profileImage, profileUser, userTextField, userView, currentAddressLabel, currentAddressTextField, currentAddressView]
        for subview in subviews {
            view.addSubview(subview)
        }
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.widthAnchor.constraint(equalToConstant: view.frame.width),
            topView.heightAnchor.constraint(equalToConstant: 155),
            
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 70),
            profileImage.heightAnchor.constraint(equalToConstant: 70),
            
            profileUser.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20),
            profileUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            
            userTextField.topAnchor.constraint(equalTo: profileUser.bottomAnchor, constant: 20),
            userTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            userTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            userView.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 8),
            userView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            userView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            
            currentAddressLabel.topAnchor.constraint(equalTo: userView.bottomAnchor, constant: 30),
            currentAddressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            
            currentAddressTextField.topAnchor.constraint(equalTo: currentAddressLabel.bottomAnchor, constant: 20),
            currentAddressTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            currentAddressTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            currentAddressView.topAnchor.constraint(equalTo: currentAddressTextField.bottomAnchor, constant: 8),
            currentAddressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            currentAddressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
        ])
    }
}

//MARK: - Protocol Delegate of the Image Picker and Navigation Control Delegate -
extension UserProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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

