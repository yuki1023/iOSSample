//
//  AppDelegate.swift
//  original
//
//  Created by 黒部麻由子 on 2020/09/07.
//  Copyright © 2020 mayukokurobe. All rights reserved.
//

import UIKit
import NCMB

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        NCMB.setApplicationKey("140922f4a861e5082d5e1e28e42d6c5741bc67817826826c270a848c858b947e", clientKey: "df9586548e868d7435931e0a1648aa156b4843fc2b77e144d77a6c487ca0dcc9")
        
        //匿名ログイン
        let ud = UserDefaults.standard
        if ud.object(forKey: "userName") == nil {
            NCMBUser.enableAutomaticUser()
            NCMBUser.automaticCurrentUser { (user, error) in
                if error != nil {
                    print(error)
                } else {
                    ud.set(user?.objectId, forKey: "userName")
                    print(ud.object(forKey: "userName"))
                }
            }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

