//
//  ProductsModel.swift
//  eCommerceApp
//
//  Created by Kaan Yalçınkaya on 5.09.2024.
//

import SwiftUI

struct ProductsModel: Identifiable, Hashable {
    
    var id: String
    var title: String
    var brand: String
    var description: String
    var images: [String]
    var sizes: [Int]
    var reviews: [ReviewModel]
    var price: Int
}

struct ReviewModel: Identifiable, Hashable {
    var id: String
    var userName: String
    var image: String
    var review: String
    var rating: Int
    
}

var sampleProducts: [ProductsModel] = [
    
    .init(id: "a",
          title: "PALERMO",
          brand: "Puma",
          description: "Elegant. Mellow. Eternal. Reminiscent of smouldering embers and weathered stones. A muted spectrum that exists between light and shadow. A sophisticated reflection that allures and ages gracefully. ASH strikes a subtle balance between grey and blue contrasts and is a statement of unmatched simplicity.",
          images: [
            "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,e_sharpen/global/396464/03/sv01/fnd/TUR/w/2000/h/2000/fmt/png",
            "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,e_sharpen/global/396464/03/bv/fnd/TUR/w/2000/h/2000/fmt/png",
            "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,e_sharpen/global/396464/03/sv04/fnd/TUR/w/2000/h/2000/fmt/png",
          ],
          sizes: [40, 41, 42, 43, 44],
          reviews: [sampleReview, sampleReview],
          price: 4689),
    
        .init(id: "b",
              title: "REBOUND",
              brand: "Puma",
              description: "Elegant. Mellow. Eternal. Reminiscent of smouldering embers and weathered stones. A muted spectrum that exists between light and shadow. A sophisticated reflection that allures and ages gracefully. ASH strikes a subtle balance between grey and blue contrasts and is a statement of unmatched simplicity.",
              images: [
                "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,e_sharpen/global/392326/03/sv01/fnd/TUR/w/2000/h/2000/fmt/png",
                "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,e_sharpen/global/392326/03/fnd/TUR/w/2000/h/2000/fmt/png",
                "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,e_sharpen/global/392326/03/sv04/fnd/TUR/w/2000/h/2000/fmt/png",
              ],
              sizes: [40, 41, 42, 43, 44],
              reviews: [sampleReview, sampleReview],
              price: 4689),
    
        .init(id: "c",
              title: "SUEDE",
              brand: "Puma",
              description: "Elegant. Mellow. Eternal. Reminiscent of smouldering embers and weathered stones. A muted spectrum that exists between light and shadow. A sophisticated reflection that allures and ages gracefully. ASH strikes a subtle balance between grey and blue contrasts and is a statement of unmatched simplicity.",
              images: [
                "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,e_sharpen/global/395205/01/sv01/fnd/TUR/w/2000/h/2000/fmt/png",
                "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,e_sharpen/global/395205/01/fnd/TUR/w/2000/h/2000/fmt/png",
                "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,e_sharpen/global/395205/01/sv04/fnd/TUR/w/2000/h/2000/fmt/png",
              ],
              sizes: [40, 41, 42, 43, 44],
              reviews: [sampleReview, sampleReview],
              price: 6589),
    
        .init(id: "d",
              title: "Air Jordan 1 Mid",
              brand: "Nike",
              description: "Elegant. Mellow. Eternal. Reminiscent of smouldering embers and weathered stones. A muted spectrum that exists between light and shadow. A sophisticated reflection that allures and ages gracefully. ASH strikes a subtle balance between grey and blue contrasts and is a statement of unmatched simplicity.",
              images: [
                "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/4f864b95-0da2-4f66-b1c7-2cfb6e655bc6/AIR+JORDAN+1+MID.png",
                "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/b497aee0-09c5-413e-9f79-df4d2ed999c3/AIR+JORDAN+1+MID.png",
                "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/19b8a9f2-d38d-48c2-8c6e-de4be56a47db/AIR+JORDAN+1+MID.png",
              ],
              sizes: [40, 41, 42, 43, 44],
              reviews: [sampleReview, sampleReview],
              price: 2547),
    
        .init(id: "e",
              title: "Nike Dunk Low",
              brand: "Nike",
              description: "Elegant. Mellow. Eternal. Reminiscent of smouldering embers and weathered stones. A muted spectrum that exists between light and shadow. A sophisticated reflection that allures and ages gracefully. ASH strikes a subtle balance between grey and blue contrasts and is a statement of unmatched simplicity.",
              images: [
                "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/52084f93-98d3-4d52-9b57-3f9a7061bb7f/NIKE+DUNK+LOW+NN.png",
                "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/97bce0e9-749f-4a2d-a7b8-b847d83346ed/NIKE+DUNK+LOW+NN.png",
                "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/5453c84e-3097-4e2f-b8c4-546ddf9c7752/NIKE+DUNK+LOW+NN.png",
              ],
              sizes: [40, 41, 42, 43, 44],
              reviews: [sampleReview, sampleReview],
              price: 9852),
    
        .init(id: "f",
              title: "Air Jordan 1 Low",
              brand: "Nike",
              description: "Elegant. Mellow. Eternal. Reminiscent of smouldering embers and weathered stones. A muted spectrum that exists between light and shadow. A sophisticated reflection that allures and ages gracefully. ASH strikes a subtle balance between grey and blue contrasts and is a statement of unmatched simplicity.",
              images: [
                "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/cd83452d-3a6c-4742-9129-3693e06a26e2/AIR+JORDAN+1+LOW.png",
                "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/bab7e64d-7078-442d-97f9-90934bd9d37b/AIR+JORDAN+1+LOW.png",
                "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/61bd4d3e-0b50-4028-bf15-ef588d13a013/AIR+JORDAN+1+LOW.png",
              ],
              sizes: [40, 41, 42, 43, 44],
              reviews: [sampleReview, sampleReview],
              price: 4689),
    
        .init(id: "g",
              title: "Nike Court Vision Low",
              brand: "Nike",
              description: "Elegant. Mellow. Eternal. Reminiscent of smouldering embers and weathered stones. A muted spectrum that exists between light and shadow. A sophisticated reflection that allures and ages gracefully. ASH strikes a subtle balance between grey and blue contrasts and is a statement of unmatched simplicity.",
              images: [
                "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/3a02659d-bad9-4eab-a64c-ec2b731b70c3/NIKE+COURT+VISION+LO.png",
                "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/2e4d3a72-596d-484f-823f-524b72d150ab/NIKE+COURT+VISION+LO.png",
                "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/cf440626-b074-4a12-9e83-ebefbc5a9c1d/NIKE+COURT+VISION+LO.png",
              ],
              sizes: [40, 41, 42, 43, 44],
              reviews: [sampleReview, sampleReview],
              price: 4689),
    
        .init(id: "h",
              title: "Air Jordan 1 Mid SE",
              brand: "Nike",
              description: "Elegant. Mellow. Eternal. Reminiscent of smouldering embers and weathered stones. A muted spectrum that exists between light and shadow. A sophisticated reflection that allures and ages gracefully. ASH strikes a subtle balance between grey and blue contrasts and is a statement of unmatched simplicity.",
              images: [
                "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/aewirmmftxbipywxwdkj/AIR+JORDAN+1+MID+SE.png",
                "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/b7wsfbs1pmi3gc41ar9m/AIR+JORDAN+1+MID+SE.png",
                "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/g9fhsj11zu3th0kvutdl/AIR+JORDAN+1+MID+SE.png",
              ],
              sizes: [40, 41, 42, 43, 44],
              reviews: [sampleReview, sampleReview],
              price: 6589),
    
        .init(id: "i",
              title: "SAMBA OG W",
              brand: "Adidas",
              description: "Elegant. Mellow. Eternal. Reminiscent of smouldering embers and weathered stones. A muted spectrum that exists between light and shadow. A sophisticated reflection that allures and ages gracefully. ASH strikes a subtle balance between grey and blue contrasts and is a statement of unmatched simplicity.",
              images: [
                "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/afe38e400d564fea91f875ba5f34f4bd_9366/SAMBA_OG_W_Beyaz_IG9030_06_standard.jpg",
                "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/6e2884880e504b06ba53d241cf720a4f_9366/SAMBA_OG_W_Beyaz_IG9030_04_standard.jpg",
                "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/1684a0420ac541bdbf3b3b69dc190ac7_9366/SAMBA_OG_W_Beyaz_IG9030_42_detail.jpg",
              ],
              sizes: [40, 41, 42, 43, 44],
              reviews: [sampleReview, sampleReview],
              price: 2547),
    
        .init(id: "j",
              title: "CAMPUS 00S",
              brand: "Adidas",
              description: "Elegant. Mellow. Eternal. Reminiscent of smouldering embers and weathered stones. A muted spectrum that exists between light and shadow. A sophisticated reflection that allures and ages gracefully. ASH strikes a subtle balance between grey and blue contrasts and is a statement of unmatched simplicity.",
              images: [
                "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/a76716648b634481ba31af500104ce25_9366/Campus_00s_Ayakkabi_Siyah_HQ8708_06_standard.jpg",
                "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/506681c25cee4ece9a6aaf500104dbb2_9366/Campus_00s_Ayakkabi_Siyah_HQ8708_02_standard.jpg",
                "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/a93a651339a34d269115af500104f641_9366/Campus_00s_Ayakkabi_Siyah_HQ8708_04_standard.jpg",
              ],
              sizes: [40, 41, 42, 43, 44],
              reviews: [sampleReview, sampleReview],
              price: 9852),
    
        .init(id: "k",
              title: "HANDBALL SPEZIAL",
              brand: "Adidas",
              description: "Elegant. Mellow. Eternal. Reminiscent of smouldering embers and weathered stones. A muted spectrum that exists between light and shadow. A sophisticated reflection that allures and ages gracefully. ASH strikes a subtle balance between grey and blue contrasts and is a statement of unmatched simplicity.",
              images: [
                "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b4ce666587774fe2a36a530feea3231e_9366/HANDBALL_SPEZIAL_Bej_JH7557_06_standard.jpg",
                "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/329801f8f56e4c5180ae013f75062d8b_9366/HANDBALL_SPEZIAL_Bej_JH7557_04_standard.jpg",
                "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8347d34da8c04979922202406a040297_9366/HANDBALL_SPEZIAL_Bej_JH7557_42_detail.jpg",
              ],
              sizes: [40, 41, 42, 43, 44],
              reviews: [sampleReview, sampleReview],
              price: 2547),
    
        .init(id: "l",
              title: "SAMBA OG",
              brand: "Adidas",
              description: "Elegant. Mellow. Eternal. Reminiscent of smouldering embers and weathered stones. A muted spectrum that exists between light and shadow. A sophisticated reflection that allures and ages gracefully. ASH strikes a subtle balance between grey and blue contrasts and is a statement of unmatched simplicity.",
              images: [
                "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/5a68fc4c3622494c9806cd2472df9b42_9366/Samba_OG_Ayakkabi_Beyaz_ID1479_06_standard.jpg",
                "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/e09ac3efce684a22975602c6de1d9042_9366/Samba_OG_Ayakkabi_Beyaz_ID1479_02_standard_hover.jpg",
                "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3118fac3c07c42bbac77214951442d8e_9366/Samba_OG_Ayakkabi_Beyaz_ID1479_42_detail.jpg",
              ],
              sizes: [40, 41, 42, 43, 44],
              reviews: [sampleReview, sampleReview],
              price: 9852)
    
    
    
]

let sampleReview = ReviewModel(
    id: "abc",
    userName: "Kaan",
    image: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2015/06/06/Chris-Pratt.jpg",
    review: "Amazing sneakers with best quality...❤️🔥",
    rating: 4)
