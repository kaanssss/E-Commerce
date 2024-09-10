//
//  Onboarding.swift
//  eCommerceApp
//
//  Created by Kaan Yalçınkaya on 19.08.2024.
//

import SwiftUI

struct OnboardingView: View {
    @State private var isActive = false
    @State private var isExpanded = false
    @State private var offset = CGSize.zero

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                VStack {
                    Spacer()
                    
                    Circle()
                        .fill(RadialGradient(colors: [Color(#colorLiteral(red: 0.76, green: 0.78, blue: 0.81, alpha: 1)), .clear], center: .center, startRadius: 0, endRadius: UIScreen.main.bounds.width))
                        .scaleEffect(isExpanded ? 20 : 2)
                        .padding(.bottom, -(UIScreen.main.bounds.width / 2))
                }
                .zIndex(isExpanded ? 2 : 0)
                
                VStack(spacing: 15) {
                    Spacer()
                    
                    Image("t-shirt")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Start Journey \nwith NIKE")
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)
                    
                    Text("Smart gorgeous and fashionable collection makes you cool")
                        .multilineTextAlignment(.center)
                        .opacity(0.6)
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "chevron.up")
                        Text("Get Started")
                            .padding(.top)
                    }
                }
                .opacity(isExpanded ? 0 : 1)
                .offset(offset)
                
                NavigationLink(
                    destination: Sign_in(),
                    isActive: $isActive,
                    label: { EmptyView() }
                ).hidden()
            }
            .gesture(DragGesture().onEnded({ value in
                if value.translation.height < 50 {
                    withAnimation(.easeInOut(duration: 2)) {
                        offset = value.translation
                        isExpanded = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }))
            .padding()
            .background(
                Image("onboarding")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
            .preferredColorScheme(.dark)
        }
    }
}
