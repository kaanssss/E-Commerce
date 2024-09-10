//
//  HomeVM.swift
//  eCommerceApp
//
//  Created by Kaan Yalçınkaya on 6.09.2024.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var productsList = [ProductsModel]()
    var originalProductList = [ProductsModel]()

    @Published var currentCategory: String = "All"
    @Published var selectedProduct: ProductsModel? = nil
    @Published var showProductDetails: Bool = false

    private let databaseService: DatabaseService

    init(databaseService: DatabaseService = FirestoreDatabaseService()) {
        self.databaseService = databaseService
        fetchProducts()
    }

    // Fetch and set product lists.
    func fetchProducts() {
        databaseService.fetchProducts { [weak self] result in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    self?.originalProductList = products
                    self?.productsList = products
                }
            case .failure(let error):
                print("Error fetching products: \(error.localizedDescription)")
            }
        }
    }

    // Filter products based on the selected category.
    func filterProducts(by category: String) {
        print("Filtre uygulanıyor: \(category)")
        
        if category == "All" {
            DispatchQueue.main.async {
                self.productsList = self.originalProductList
                print("Displaying all products. Total count: \(self.productsList.count)")
            }
        } else {
            DispatchQueue.main.async {
                self.productsList = self.originalProductList.filter { $0.brand.lowercased() == category.lowercased() }
                print("Filtered by \(category). Product count: \(self.productsList.count)")
            }
        }
    }


    func selectProduct(_ product: ProductsModel) {
        selectedProduct = product
        showProductDetails = true
    }
}




