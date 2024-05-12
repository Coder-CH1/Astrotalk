//
//  DataModel.swift
//  Astrotalk
//
//  Created by Mac on 24/04/2024.
//

import UIKit
import MessageKit
import FirebaseDatabase

//MARK: - SideBarViewController Data Model -
struct User {
    var icon: UIImage?
    var label: String
}

struct Home {
    var icon: UIImage?
    var label: String
}

struct Pooja {
    var icon: UIImage?
    var label: String
}

struct Order {
    var icon: UIImage?
    var label: String
}

struct Shop {
    var icon: UIImage?
    var label: String
}

struct Blog {
    var icon: UIImage?
    var label: String
}

struct Chat {
    var icon: UIImage?
    var label: String
}

struct Settings {
    var icon: UIImage?
    var label: String
}

struct Login {
    var icon: UIImage?
    var label: String
}

struct SideBarItem {
    enum ItemType {
        case user(User)
        case home(Home)
        case pooja(Pooja)
        case order(Order)
        case shop(Shop)
        case blog(Blog)
        case chat(Chat)
        case settings(Settings)
        case login(Login)
    }
    let type: ItemType
}

/// Data Initialization
let userItem = SideBarItem(type: .user(User(icon: UIImage(systemName: "person.circle"), label: "User")))
let homeItem = SideBarItem(type: .home(Home(icon: UIImage(systemName: "house.fill"), label: "Home")))
let poojaItem = SideBarItem(type: .pooja(Pooja(icon: UIImage(systemName: "flame"), label: "Book a Pooja")))
let orderItem = SideBarItem(type: .order(Order(icon: UIImage(systemName: "clock.arrow.circlepath"), label: "Order History")))
let shopItem = SideBarItem(type: .shop(Shop(icon: UIImage(systemName: "bag.circle.fill"), label: "Shop at Astromall")))
let blogItem = SideBarItem(type: .blog(Blog(icon: UIImage(systemName: "person.bust.fill"), label: "Astrology Blog")))
let chatItem = SideBarItem(type: .chat(Chat(icon: UIImage(systemName: "message.fill"), label: "Chat with Astrologers")))
let settingsItem = SideBarItem(type: .settings(Settings(icon: UIImage(systemName: "gearshape.fill"), label: "Settings")))
let loginItem = SideBarItem(type: .login(Login(icon: UIImage(systemName: "arrow.forward.circle.fill"), label: "Login")))


//MARK: - Segmented Control Data Model -
struct SegmentedControlData{
    var icon: UIImage?
    var label: String
}

/// Data Initialization
var segmentedArray = [
    SegmentedControlData(icon: UIImage(systemName: "square.grid.2x2"),label: "All"),
    SegmentedControlData(icon: UIImage(systemName: "suit.heart.fill"),label: "Love"),
    SegmentedControlData(icon: UIImage(systemName: "graduationcap.fill"),label: "Education"),
    SegmentedControlData(icon: UIImage(systemName: "briefcase.fill"),label: "Career"),
    SegmentedControlData(icon: UIImage(systemName: "circlebadge.2"),label: "Marriage"),
    SegmentedControlData(icon: UIImage(systemName: "cross.case.fill"),label: "Health"),
    SegmentedControlData(icon: UIImage(systemName: "folder.fill"),label: "Wealth"),
    SegmentedControlData(icon: UIImage(systemName: "mail.fill"),label: "Finance"),
    SegmentedControlData(icon: UIImage(systemName: "face.smiling.inverse"),label: "Kids"),
]

//MARK: - Horoscope Data Model -
struct Horoscope {
    var img: UIImage?
    var label: String
}

let horoscopeArray = [
            Horoscope(img: UIImage(systemName: "sun.and.horizon"), label: "Daily Horoscope"),
            Horoscope(img: UIImage(systemName: "trapezoid.and.line.vertical"), label: "FREE KUNDLI"),
            Horoscope(img: UIImage(systemName: "circlebadge.2"), label: "KUNDLI MATCHING"),
            Horoscope(img: UIImage(systemName: "staroflife.fill"), label: "FREE CHAT")]

struct Member {
    var name: String
    var color: UIColor
}

struct Chats {
    let text: String
    let sender: String
}

