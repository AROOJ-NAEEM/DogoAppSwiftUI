//
//  DodoSwiftUITestAppApp.swift
//  DodoSwiftUITestApp
//
//  Created by Dev on 23/05/2024.
//

import SwiftUI
import GoogleSignIn

@main
struct DodoSwiftUITestAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            SplashView(showHomeView: false).onOpenURL { url in
                //Handle Google Oauth URL
                GIDSignIn.sharedInstance.handle(url)
            }
        }
    }
}
