//
//  Splash.swift
//  eCommerceApp
//
//  Created by Kaan Yalçınkaya on 19.08.2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct SplashView: View {
    @State private var isActive = false
    private let animationDuration: Double = 2.5

    var body: some View {
        VStack {
            if isActive {
                if Auth.auth().currentUser != nil {
                    ContentView()
                } else {
                    OnboardingView()
                }
            } else {
                Text("NIKE")
                    .font(.largeTitle.bold())
            }
        }
        .onAppear {
            startSplashAnimation()
        }
    }

    private func startSplashAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
            withAnimation {
                isActive = true
            }
        }
    }
}
