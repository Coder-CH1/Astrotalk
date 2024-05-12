//
//  FooterHeader.swift
//  Astrotalk
//
//  Created by Mac on 29/04/2024.
//

import UIKit
import Firebase

// MARK: - Reusableview for the section headers
class FooterHeader: UICollectionReusableView, UITextViewDelegate {
    
    //MARK: - Objects initialization
    static let identifier = "FooterHeader"
    
    let feedbackView = CustomView(color: .systemGray5)
    
    let titleFeedbackLbl = Label(label: "Feedback to the CEO office!", textColor: .black, font: UIFont.systemFont(ofSize: 15, weight: .medium))
    
    let subtitleFeedbackLbl = Label(label: "Share your feedback to help us improve the app", textColor: .black, font: UIFont.systemFont(ofSize: 10, weight: .regular))
    
    let isSuccessLabel = Label(label: "Feedback Submitted Successfully", textColor: .systemGreen, font: UIFont.systemFont(ofSize: 14, weight: .regular))
    
    fileprivate lazy var feedbackTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.delegate = self
        textView.text = "Start typing here..."
        textView.textColor = .lightGray
        textView.backgroundColor = .white
        return textView
    }()
    
    let sendfeedbackBtn = Button(image: UIImage(), text: "Send feedback", btnTitleColor: .black, backgroundColor: .systemYellow, radius: 20, imageColor: .clear)
    
    public func configure() {
        addSubview(feedbackView)
        feedbackView.addSubview(isSuccessLabel)
        feedbackView.addSubview(titleFeedbackLbl)
        feedbackView.addSubview(subtitleFeedbackLbl)
        feedbackView.addSubview(feedbackTextView)
        feedbackView.addSubview(sendfeedbackBtn)
    }
    
    //MARK: - Lifecycle -
    override func layoutSubviews() {
        super.layoutSubviews()
        setupSectionFooters()
    }
    
    //MARK: - Subviews and Layout -
    func setupSectionFooters() {
        sendfeedbackBtn.addTarget(self, action: #selector(sendFeedBackAction(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            feedbackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            feedbackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            feedbackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            feedbackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40),
            
            isSuccessLabel.topAnchor.constraint(equalTo: feedbackView.topAnchor, constant: 1),
            isSuccessLabel.leadingAnchor.constraint(equalTo: feedbackView.leadingAnchor, constant: 14),
            
            titleFeedbackLbl.topAnchor.constraint(equalTo: isSuccessLabel.bottomAnchor, constant: 10),
            titleFeedbackLbl.leadingAnchor.constraint(equalTo: feedbackView.leadingAnchor, constant: 14),
            
            subtitleFeedbackLbl.topAnchor.constraint(equalTo: titleFeedbackLbl.bottomAnchor, constant: 3),
            subtitleFeedbackLbl.leadingAnchor.constraint(equalTo: feedbackView.leadingAnchor, constant: 14),
            
            feedbackTextView.topAnchor.constraint(equalTo: subtitleFeedbackLbl.bottomAnchor, constant: 3),
            feedbackTextView.leadingAnchor.constraint(equalTo: feedbackView.leadingAnchor, constant: 14),
            feedbackTextView.trailingAnchor.constraint(equalTo: feedbackView.trailingAnchor, constant: -14),
            feedbackTextView.heightAnchor.constraint(equalToConstant: 100),
            
            sendfeedbackBtn.topAnchor.constraint(equalTo: feedbackTextView.bottomAnchor, constant: 6),
            sendfeedbackBtn.leadingAnchor.constraint(equalTo: feedbackView.leadingAnchor, constant: 40),
            sendfeedbackBtn.trailingAnchor.constraint(equalTo: feedbackView.trailingAnchor, constant: -40),
            sendfeedbackBtn.bottomAnchor.constraint(equalTo: feedbackView.bottomAnchor, constant: -10),
            sendfeedbackBtn.heightAnchor.constraint(equalToConstant: 35),
        ])
        isSuccessLabel.isHidden = true
    }
    
    //MARK: Protocol Delegate
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    @objc func sendFeedBackAction(_ sender: UIButton) {
        guard let feedback = feedbackTextView.text, !feedback.isEmpty else {
            return
        }
        saveFeedBack(name: "", email: "", feedback: feedback)
    }
    
    func saveFeedBack(name: String, email: String, feedback: String) {
        let db = Firestore.firestore()
        let feedBackData: [String: Any] = [
            "name": name,
            "email": email,
            "feedback": feedback,
            "timestamp": Timestamp(date: Date())
        ]
        db.collection("feedback").addDocument(data: feedBackData) { error in
            if let error = error {
                print("\(error)")
            } else {
                print("Feedback added successfully")
                self.clearFormFields()
                self.showIsSuccessLabel()
            }
        }
    }
    
    func clearFormFields() {
        feedbackTextView.text = ""
    }
    
    func showIsSuccessLabel() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.isSuccessLabel.isHidden = false
        }
    }
}
