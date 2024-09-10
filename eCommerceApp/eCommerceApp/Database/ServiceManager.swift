//
//  ServiceManager.swift
//  eCommerceApp
//
//  Created by Kaan Yalçınkaya on 6.09.2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

// Singleton to manage services such as authentication and database access.
class ServiceManager {
    static let shared = ServiceManager()

    private let authService: AuthService
    private let databaseService: DatabaseService

    // Initialize services with default implementations.
    private init(authService: AuthService = FirebaseAuthService(),
                 databaseService: DatabaseService = FirestoreDatabaseService()) {
        self.authService = authService
        self.databaseService = databaseService
    }

    func initialize() {
        authService.initialize()
        databaseService.initialize()
    }

    func getAuthService() -> AuthService {
        return authService
    }

    func getDatabaseService() -> DatabaseService {
        return databaseService
    }
}

protocol AuthService {
    func initialize()
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    func signOut() throws
}

class FirebaseAuthService: AuthService {
    func initialize() {
        FirebaseApp.configure()
    }

    // Initialize services with default implementations
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else if let user = result?.user {
                completion(.success(user))
            }
        }
    }

    func signOut() throws {
        try Auth.auth().signOut()
    }
}

protocol DatabaseService {
    func initialize()
    func fetchProducts(completion: @escaping (Result<[ProductsModel], Error>) -> Void)
}

class FirestoreDatabaseService: DatabaseService {
    func initialize() {
    }

    // Fetch products from the Firestore database.
    func fetchProducts(completion: @escaping (Result<[ProductsModel], Error>) -> Void) {
        let db = Firestore.firestore()
        db.collection("PRODUCTS").getDocuments { snapshot, error in
            if let error = error {
                completion(.failure(error))
            } else if let documents = snapshot?.documents {
                let products = documents.compactMap { document -> ProductsModel? in
                    guard let sizes = document.get("sizes") as? [Int] else { return nil }
                    return ProductsModel(id: document.documentID,
                                         title: document.get("title") as? String ?? "Unknown",
                                         brand: document.get("brand") as? String ?? "Unknown",
                                         description: document.get("description") as? String ?? "No description",
                                         images: document.get("images") as? [String] ?? [],
                                         sizes: sizes,
                                         reviews: [sampleReview],
                                         price: document.get("price") as? Int ?? 0)
                }
                completion(.success(products))
            }
        }
    }
}



