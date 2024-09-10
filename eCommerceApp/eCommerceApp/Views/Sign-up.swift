//
//  Sign-up.swift
//  eCommerceApp
//
//  Created by Kaan Yalçınkaya on 27.08.2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

struct Sign_up: View {
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoading = false
    @State private var isSigned = false
    
    @Environment(\.presentationMode) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 40) {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss.wrappedValue.dismiss()
                    }
                
                VStack(alignment: .leading, spacing: 15,content: {
                    Text("Sign-up")
                        .font(.title)
                    
                    Text("Enter your email address and password and continue shopping.")
                        .font(.callout)
                })
                
                
                
                VStack(alignment: .leading) {
                    TextField("User name", text: $username)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .overlay {
                            Capsule()
                                .stroke(Color.gray.opacity(0.8), lineWidth: 0.5)
                        }
                    
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
                
                //Login Button
                VStack(spacing: 15) {
                    
                    Button {
                        isLoading.toggle()
                        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                            
                            if error != nil {
                                print(error?.localizedDescription ?? "")
                                withAnimation {
                                    isLoading.toggle()
                                }
                            } else {
                                let db = Firestore.firestore()
                                let data: [String: Any] = [
                                    "User Name": username,
                                    "Email": email,
 
                                ]
                                
                                UserDefaults.standard.setValue(result?.user.uid, forKey: "UID")
                                UserDefaults.standard.setValue(username, forKey: "NAME")
                                UserDefaults.standard.setValue(email, forKey: "EMAIL")

                                db.collection("USERS").addDocument(data: data)
                                isLoading.toggle()
                                
                                isSigned = true

                            }
                        }
                    }label: {
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
                    .navigationDestination(isPresented: $isSigned) {
                        ContentView()
                    }
                    
                    NavigationLink {
                        Sign_in()
                    }label: {
                        Text("Already have an account? **Sign-in**")
                            .frame(maxWidth: .infinity)
                    }
                    .foregroundColor(.white)
                   
                }
                
                
            }
            .padding()
            .preferredColorScheme(.dark)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    Sign_up()
}
