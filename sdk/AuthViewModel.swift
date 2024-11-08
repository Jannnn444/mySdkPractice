//
//  AuthViewModel.swift
//  sdk
//
//  Created by Hualiteq International on 2024/11/7.
//

import Foundation

class AuthViewModel: ObservableObject {
    private let authSDK: AuthSDK
    
    init() {
        self.authSDK = AuthSDK(listener: nil) // Listener can be passed if needed
    }
    
    func saveLoginData(username: String, password: String, domain: String, proxy: String) {
        authSDK.saveLoginData(username: username, password: password, domain: domain, proxy: proxy)
        print("User data saved: \(username), \(domain), \(proxy)")
    }
    
    func loginToServer(transport: PHQSbcTransportType) {
        authSDK.login(transport: transport, addr: PHQSbc.domain, proxy: PHQSbc.proxy)
    }
    
}
