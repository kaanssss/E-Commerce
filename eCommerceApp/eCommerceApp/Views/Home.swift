//
//  Home.swift
//  eCommerceApp
//
//  Created by Kaan Yalçınkaya on 5.09.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var currentCategory = "All"
    @State private var sampleBrands: [BrandsModel] = [
        .init(title: "All", icon: ""),
        .init(title: "Nike", icon: "nike"),
        .init(title: "Adidas", icon: "adidas"),
        .init(title: "Puma", icon: "puma")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    categoriesView
                    productsListView
                }
                .padding()
                // Fetch products on app launch.
                .onAppear {
                    viewModel.fetchProducts()
                }
            }
            .scrollIndicators(.hidden)
            // Navigation Bar
            .navigationTitle("Shoes Collections")
            // Right icon
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Notification button clicked")
                    }) {
                        Image(systemName: "bell")
                            .imageScale(.large)
                    }
                }
            }
            .fullScreenCover(isPresented: $viewModel.showProductDetails) {
                if let selectedProduct = viewModel.selectedProduct {
                    // Display selected product.
                    Product(data: selectedProduct)
                }
            }
        }
    }

    //MARK: - CategoriesView
    
    var categoriesView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(sampleBrands, id: \.id) { item in
                    HStack {
                        if !item.icon.isEmpty {
                            Image(item.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 26, height: 26)
                        }
                        
                        if currentCategory.lowercased() == item.title.lowercased() || item.title == "All" {
                            Text(item.title)
                        }
                    }
                    .foregroundStyle(currentCategory == item.title ? .white : .black)
                    .padding()
                    .background(currentCategory == item.title ? .black : .gray.opacity(0.08))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation {
                            currentCategory = item.title
                            print("Current Category: \(currentCategory)")
                            
                            if item.title == "All" {
                                viewModel.productsList = viewModel.originalProductList
                            } else {
                                viewModel.filterProducts(by: item.title)
                            }
                        }
                    }
                    .zIndex(2)
                }
            }
        }
        .zIndex(1)
        .scrollIndicators(.hidden)
    }

    //MARK: - Product listing section
    
    var productsListView: some View {
        VStack {
            if viewModel.productsList.isEmpty {
                Text("No products found in this category.")
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding()
            } else {
                ForEach(viewModel.productsList, id: \.id) { item in
                    VStack {
                        AsyncImage(url: URL(string: item.images[0])) { img in
                            img.resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: UIScreen.main.bounds.width - 40, height: 200)
                        .clipShape(Rectangle())
                        
                        Text(item.title)
                            .font(.headline.bold())
                        
                        Text("$\(item.price)")
                            .font(.callout)
                    }
                    .padding(.bottom)
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    // Go to product detail.
                    .onTapGesture {
                        viewModel.selectProduct(item)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}


