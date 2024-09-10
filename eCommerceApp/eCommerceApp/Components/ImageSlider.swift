//
//  ImageSlider.swift
//  eCommerceApp
//
//  Created by Kaan Yalçınkaya on 6.09.2024.
//

import SwiftUI

struct ImageSlider: View {
    var images: [String]
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { img in
                AsyncImage(url: URL(string: img)) { image in
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .onAppear {
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}



