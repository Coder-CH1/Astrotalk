//
//  SceneDelegate.swift
//  Astrotalk
//
//  Created by Mac on 12/04/2024.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UIGestureRecognizerDelegate {
    
    var window: UIWindow?
    var stickerButtonDelegate: StickerButtonVisibilityDelegate?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        let rootViewController = LoginViewController()
        window?.rootViewController = rootViewController
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

