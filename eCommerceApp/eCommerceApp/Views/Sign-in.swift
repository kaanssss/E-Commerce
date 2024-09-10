//
//  Sign-in.swift
//  eCommerceApp
//
//  Created by Kaan Yalçınkaya on 19.08.2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

struct Sign_in: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoading = false
    @EnvironmentObject var appState: AppState
    
    @Environment(\.presentationMode) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 40) {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss.wrappedValue.dismiss()
                    }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Sign-in")
                        .font(.title)
                    
                    Text("Enter your email address and password and continue shopping.")
                        .font(.callout)
                }
                
                VStack(alignment: .leading) {
                    TextField("Email Address", text: $email)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .overlay {
                            Capsule()
                                .stroke(Color.gray.opacity(0.8), lineWidth: 0.5)
                        }
                    
                    SecureField("Password", text: $password)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .overlay {
                            Capsule()
                                .stroke(Color.gray.opacity(0.8), lineWidth: 0.5)
                        }
                }
                
                Spacer()
                
                // Login Button
                VStack(spacing: 15) {
                    
                    Button {
                        isLoading = true
                        Auth.auth().signIn(withEmail: email, password: password) { result, error in
                            if let error = error {
                                print("Error signing in: \(error.localizedDescription)")
                                isLoading = false
                            } else {
                                print("Successfully signed in")
                                withAnimation {
                                    appState.isUserLoggedIn = true
                                }
                                
                                Firestore.firestore()
                                    .collection("USERS")
                                    .document(result?.user.uid ?? "")
                                    .getDocument { document, error in
                                        
                                        if let document = document, document.exists {
                                            let name = document.get("User_Name") as? String ?? ""
                                            let email = document.get("Email") as? String ?? ""
                                            
                                            UserDefaults.standard.set(name, forKey: "NAME")
                                            UserDefaults.standard.set(email, forKey: "EMAIL")
                                            
                                            withAnimation {
                                                isLoading.toggle()
                                            }
                                        } else {
                                            withAnimation {
                                                isLoading.toggle()
                                            }
                                            print("Document does not exist")
                                        }
                                    }
                            }
                        }
                    } label: {
                        if isLoading {
                            ProgressView()
                        } else {
                            Text("Continue")
                                .fontWeight(.semibold)
                        }
                    }

                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.red)
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    
                    NavigationLink {
                        Sign_up()
                    } label: {
                        Text("Not having account? **Signup**")
                            .frame(maxWidth: .infinity)
                    }
                    .foregroundColor(.white)
                }
            }
            .padding()
            .preferredColorScheme(.dark)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    Sign_in()
}


