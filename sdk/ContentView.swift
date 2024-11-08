//
//  ContentView.swift
//  sdk
//
//  Created by Hualiteq International on 2024/11/7.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var domain: String = ""
    @State private var proxy: String = ""
    @State private var loggedIn: Bool = false  // Manages login state

    // Initialize the ViewModel
    @ObservedObject private var authViewModel = AuthViewModel()
    
    // Here is the bodyview
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.brown)
            
            Text("Welcome Hualiteq Company")
                .foregroundStyle(.brown)
                .padding()
                .padding()
            
            Group {
                TextField("Enter username", text: $username)
                TextField("Enter password", text: $password)
                TextField("Enter domain", text: $domain)
                TextField("Enter proxy", text: $proxy)
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            
            Button(action: {
                saveUserData()
            }) {
                Text("Log In")
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(15)
            }
        }
        .padding()
    }
    // ReadTheDescription: Open the page as the vibe it should be.
    private func addUpThedata() {
        authViewModel.loginToServer(transport: .TCP)
        authViewModel.saveLoginData(username: "UserA", password: "abcdef", domain: "666.7.oracle.com", proxy: "oracle.com")
    }
    
    // MARK: - Private Methods
    private func saveUserData() {
        authViewModel.saveLoginData(username: username, password: password, domain: domain, proxy: proxy)
        print("UserData updated with viewModel")
        loggedIn.toggle() // Toggles the login state when the button is pressed
    }
}

// TODO: - 1. Pass and save data correctly within the SDK
// TODO: - 2. Make SDK listen to state changes
// TODO: - 3. Define necessary protocols

#Preview {
    ContentView()
}
