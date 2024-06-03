//
//  DodoSwiftUITestAppApp.swift
//  DodoSwiftUITestApp
//
//  Created by Dev on 23/05/2024.
//

import SwiftUI

@main
struct DodoSwiftUITestAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            SplashView(showHomeView: false)
        }
    }
}
