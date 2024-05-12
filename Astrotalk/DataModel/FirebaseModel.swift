//
//  FirebaseModel.swift
//  Astrotalk
//
//  Created by Mac on 03/05/2024.
//

import UIKit
import FirebaseFirestore
import FirebaseDatabase

//MARK: - Firebase HomeViewController Data Model -

struct DailyHoroscopeModel:  Codable
{
    let dailyHoroscope: String
    let freeKundli: String
    let kundliMatching: String
    let freeChatting: String
    
    init(document: DocumentSnapshot) {
        self.dailyHoroscope = document.get("title1") as? String ?? ""
        self.freeKundli = document.get("title2") as? String ?? ""
        self.kundliMatching = document.get("title3") as? String ?? ""
        self.freeChatting = document.get("title4") as? String ?? ""
    }
}

struct FreeChatModel:  Codable{
    let imageUrl: String
    let title: String
    
    init(imageUrl: String, title: String) {
        self.imageUrl = imageUrl
        self.title = title
    }
}

struct LiveAstrologersModel: Codable{
    var fields: [String: String]
    init(fields: [String : String]) {
        self.fields = fields
    }
}

struct AstrologersModel: Codable{
    var fields: [String: String]
    init(fields: [String : String]) {
        self.fields = fields
    }
}

struct LatestBlogModel: Codable{
    var fields: [String: String]
    init(fields: [String : String]) {
        self.fields = fields
    }
}

struct AstroMallShopModel: Codable{
    var fields: [String: String]
    init(fields: [String : String]) {
        self.fields = fields
    }
}

struct AstroTalkModel {
    var fields: [String: String]
    init(fields: [String : String]) {
        self.fields = fields
    }
}

//MARK: - Registered users model
struct RegisteredUsersModel {
    let email: String
}
