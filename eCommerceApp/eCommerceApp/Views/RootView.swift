//
//  RootView.swift
//  eCommerceApp
//
//  Created by Kaan Yalçınkaya on 10.09.2024.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        if appState.isUserLoggedIn {
            ContentView()
        } else {
            SplashView()
        }
    }
}
