//
//  SceneDelegate.swift
//  viperexample
//
//  Created by Victor Manuel Lagunas on 2024/04/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let userRouter = UserRouter.start()
        
        let initialVC = userRouter.entry
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = initialVC
        
        self.window = window
        window.makeKeyAndVisible()
    }


}

