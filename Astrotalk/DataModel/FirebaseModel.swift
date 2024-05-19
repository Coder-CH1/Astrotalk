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

struct FreeChatModel {
    var fields: [String: String]
    init(fields: [String : String]) {
        self.fields = fields
    }
}

struct LiveAstrologersModel {
    var fields: [String: String]
    init(fields: [String : String]) {
        self.fields = fields
    }
}

struct AstrologersModel {
    var fields: [String: String]
    init(fields: [String : String]) {
        self.fields = fields
    }
}

struct LatestBlogModel {
    var fields: [String: String]
    init(fields: [String : String]) {
        self.fields = fields
    }
}

struct AstroMallShopModel {
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

struct CallModel {
    var fields: [String: String]
    init(fields: [String : String]) {
        self.fields = fields
    }
}

struct ProfileAstrologersModel {
    var  fields: [String: String]
    init(fields: [String : String]) {
        self.fields = fields
    }
}

//MARK: - Registered users model
struct RegisteredUsersModel {
    let email: String
}
