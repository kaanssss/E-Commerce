//
//  BrandsModel.swift
//  eCommerceApp
//
//  Created by Kaan Yalçınkaya on 5.09.2024.
//

import SwiftUI

struct BrandsModel: Identifiable, Hashable {
    
    var id: UUID = .init()
    var title: String
    var icon: String
}

var sampleBrands: [BrandsModel] = [
    .init(title: "All", icon: ""),
    .init(title: "Nike", icon: "nike"),
    .init(title: "Adidas", icon: "adidas"),
    .init(title: "Puma", icon: "puma")

]
    
