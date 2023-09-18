//
//  SceneDelegate.swift
//  BookReview
//
//  Created by terry on 2023/09/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        window?.backgroundColor = .systemBackground
        window?.rootViewController = UINavigationController(rootViewController:  ReviewListBookController())
        window?.makeKeyAndVisible()
    }
}

//MVVM                      MVP
/**
 Book ReviewViewModel           ->      BookReviewPresenter
 Book ReviewViewController
 */
