////
////  TopSectionSignupVC.swift
////  Astrotalk
////
////  Created by Mac on 24/04/2024.
////
//
import UIKit

// MARK: -
class LoginTopSectionVC: UIViewController {
    
    // MARK: - UI -
    let topView = CustomView(color: .clear)
    
    fileprivate lazy var skipButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Skip", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    let topImageView = ImageView(image: UIImage(named: "logoApp2"))
    
    let appNamedLabel = Label(label: "Astrotalk", textColor: .black, font: customFont(size: 18, font: .PoppinsMedium))
    
    let textLbl = Label(label: "Chat with Astrologer", textColor: .gray, font: customFont(size: 16, font: .PoppinsMedium))
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviewsAndLayout()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        skipButton.underlineText()
        view.addSubview(topView)
        let subviews = [skipButton, topImageView, appNamedLabel, textLbl]
        for subview in subviews {
            topView.addSubview(subview)
        }
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            
            skipButton.topAnchor.constraint(equalTo: topView.topAnchor, constant: 100),
            skipButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -14),
            
            topImageView.topAnchor.constraint(equalTo: skipButton.bottomAnchor, constant: 20),
            topImageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            //topImageView.widthAnchor.constraint(equalToConstant: 300),
            topImageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 60),
            topImageView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -60),
            topImageView.heightAnchor.constraint(equalToConstant: 300),
            
            appNamedLabel.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: 20),
            appNamedLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            
            textLbl.topAnchor.constraint(equalTo: appNamedLabel.bottomAnchor, constant: 10),
            textLbl.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
        ])
    }
    
    //MARK: - Action button tapped to open Settings ViewController -
    @objc func skipButtonTapped() {
        let secondViewController = SettingsViewController()
        navigationController?.pushViewController(secondViewController, animated: false)
    }
}
