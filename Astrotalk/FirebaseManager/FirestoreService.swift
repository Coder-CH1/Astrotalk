//
//  DataFetching.swift
//  Astrotalk
//
//  Created by Mac on 04/05/2024.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage

class FirestoreService {
    
    static let shared = FirestoreService()
    
    private init() {}
    
    func fetchDataForFreeChat(completion: @escaping ([FreeChatModel], Error?) -> Void) {
        let database = Firestore.firestore()
        let query = database.collection("section1")
        query.getDocuments { querySnapshot, error in
            if let error = error {
                print("Error fetching free chat: \(error.localizedDescription)")
                completion([], error)
                return
            }
            guard let snapshot = querySnapshot else {
                print("No documents found for free chat")
                completion([], error)
                return
            }
            if snapshot.isEmpty {
                print("No documents found for free chat")
                completion([], error)
                return
            }
            
            var data: [FreeChatModel] = []
            for document in snapshot.documents {
                let imageUrl = document.get("imageUrl") as? String ?? ""
                let label = document.get("section1Title") as? String ?? ""
                let model = FreeChatModel(imageUrl: imageUrl, title: label)
                data.append(model)
            }
            
            completion(data, nil)
        }
    }
    
    func fetchDataForLiveAstrologers(completion: @escaping ([LiveAstrologersModel], Error?) -> Void) {
        let database = Firestore.firestore()
        let query = database.collection("section2")
        query.getDocuments { querySnapshot, error in
            if let error = error {
                print("Error fetching liveAstrologer: \(error.localizedDescription)")
                completion([], error)
                return
            }
            
            guard let snapshot = querySnapshot else {
                print("No documents found for liveAstrologer")
                completion([], error)
                return
            }
            
            if snapshot.isEmpty {
                print("No documents found for liveAstrologer")
                completion([], error)
                return
            }
            let liveAstrologerModels = snapshot.documents.compactMap { document in
                var fields: [String: String] = [:]
                document.data().forEach { key, value in
                    fields[key] = "\(value)"
                }
                return
                LiveAstrologersModel(fields: fields)
            }
            completion(liveAstrologerModels, nil)
        }
    }
    
    func fetchDataForAstrologers(completion: @escaping ([AstrologersModel], Error?) -> Void) {
        let database = Firestore.firestore()
        let query = database.collection("section3")
        
        query.getDocuments { querySnapshot, error in
            if let error = error {
                print("Error fetching liveAstrologer: \(error.localizedDescription)")
                completion([], error)
                return
            }
            
            guard let snapshot = querySnapshot else {
                print("No documents found for liveAstrologer")
                completion([], error)
                return
            }
            
            if snapshot.isEmpty {
                print("No documents found for liveAstrologer")
                completion([], error)
                return
            }
            
            let astrologerModels = snapshot.documents.compactMap { document in
                var fields: [String: String] = [:]
                document.data().forEach { key, value in
                    fields[key] = "\(value)"
                }
                return
                AstrologersModel(fields: fields)
            }
            completion(astrologerModels, nil)
        }
    }
    
    func fetchDataForLatestBlog(completion: @escaping ([LatestBlogModel], Error?) -> Void) {
        let database = Firestore.firestore()
        let query = database.collection("section6")
        
        query.getDocuments { querySnapshot, error in
            if let error = error {
                print("Error fetching astrotalkNews: \(error.localizedDescription)")
                completion([], error)
                return
            }
            
            guard let snapshot = querySnapshot else {
                print("No documents found for astrotalkNews")
                completion([], error)
                return
            }
            
            let latestBlogModels = snapshot.documents.compactMap { document in
                var fields: [String: String] = [:]
                document.data().forEach { key, value in
                    fields[key] = "\(value)"
                }
                return LatestBlogModel(fields: fields)
            }
            
            completion(latestBlogModels, nil)
        }
    }
    
    func fetchDataForAstroMallShop(completion: @escaping ([AstroMallShopModel], Error?) -> Void) {
        let database = Firestore.firestore()
        let query = database.collection("section5")
        query.getDocuments { querySnapshot, error in
            if let error = error {
                print("Error fetching astroMallShop: \(error.localizedDescription)")
                completion([], error)
                return
            }
            
            guard let snapshot = querySnapshot else {
                print("No documents found for astroMallShop")
                completion([], error)
                return
            }
            
            if snapshot.isEmpty {
                print("No documents found for astroMallShop")
                completion([], error)
                return
            }
            
            let astroMallShopModel = snapshot.documents.compactMap { document in
                var fields: [String: String] = [:]
                document.data().forEach { key, value in
                    fields[key] = "\(value)"
                }
                return
                AstroMallShopModel(fields: fields)
            }
            completion(astroMallShopModel, nil)
        }
    }
    
    func fetchDataForAstroTalkNews(completion: @escaping ([AstroTalkModel], Error?) -> Void) {
        let database = Firestore.firestore()
        let query = database.collection("section6")
        
        query.getDocuments { querySnapshot, error in
            if let error = error {
                print("Error fetching astrotalkNews: \(error.localizedDescription)")
                completion([], error)
                return
            }
            
            guard let snapshot = querySnapshot else {
                print("No documents found for astrotalkNews")
                completion([], error)
                return
            }
            
            let astroTalkModels = snapshot.documents.compactMap { document in
                var fields: [String: String] = [:]
                document.data().forEach { key, value in
                    fields[key] = "\(value)"
                }
                return AstroTalkModel(fields: fields)
            }
            completion(astroTalkModels, nil)
        }
    }
}

