//
//  ProyectoApp.swift
//  Proyecto
//
//  Created by Derek Cortez Ibarra on 06/02/23.
//

import SwiftUI
import Firebase

@main
struct ProyectoApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            
            SplashScreenView()
            
                
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
