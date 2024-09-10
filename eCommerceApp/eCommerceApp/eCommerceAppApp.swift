//
//  eCommerceAppApp.swift
//  eCommerceApp
//
//  Created by Kaan Yalçınkaya on 19.08.2024.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AppState: ObservableObject {
    @Published var isUserLoggedIn: Bool = Auth.auth().currentUser != nil
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        return true
    }
}


@main
struct eCommerceApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    // Global state
    @StateObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
                RootView()
            .environmentObject(appState)
        }
    }
}

