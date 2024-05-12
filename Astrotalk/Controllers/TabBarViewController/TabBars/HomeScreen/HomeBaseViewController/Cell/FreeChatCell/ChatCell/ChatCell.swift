//
//  ChatCell.swift
//  Astrotalk
//
//  Created by Mac on 29/04/2024.
//

import UIKit
import Kingfisher

//MARK: - Cell -
class ChatCell: UICollectionViewCell {
    
    //MARK: - UI -
    let identifier = "ChatCell"
    let containerView = CustomView(color: .white)
    let img = ImageView(image: UIImage(systemName: ""))
    let label = Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 12, weight: .medium))
    
    //MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviewsAndLayout()
    }
    
    // MARK: - Subviews and Layout -
    func setSubviewsAndLayout() {
        addSubview(containerView)
        containerView.addSubview(img)
        containerView.addSubview(label)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            img.topAnchor.constraint(equalTo: containerView.topAnchor),
            img.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            img.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            img.widthAnchor.constraint(equalToConstant: 50),
            img.heightAnchor.constraint(equalToConstant: 50),
            
            label.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -50)
        ])
        animateLabel()
    }
    
    func applyCADisplayOnLabel() {
        let displayLink = CADisplayLink(target: self, selector: #selector(animateLabel))
        displayLink.add(to: .main, forMode: .default)
    }
    
    @objc func animateLabel() {
        UIView.animate(withDuration: 2.0, delay: 0, options: [.repeat, .autoreverse],
                       animations: {
            self.label.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
        )}
    
    func configure(model: FreeChatModel) {
        print("configuring model for free chat: \(model)")
        let url = URL(string: model.imageUrl)
        img.kf.setImage(with: url)
        label.text = model.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}