//
//  Model.swift
//  sdk
//
//  Created by Hualiteq International on 2024/11/7.
//

import SwiftUI

protocol UserAuthListener: AnyObject {
    func onLoginSuccess()
    func onLogout()
    func onError(_ message: String)
}

struct UserData {
    var username: String
    var password: String
    var domain: String
    var proxy: String
}

enum PHQSbcTransportType {
    case TCP
    case UDP
    case TLS
}

struct PHQSbc {
    static let domain = "your.domain.com"
    static let proxy = "your.proxy.com"
}

class AuthSDK {
    weak var listener: UserAuthListener?
    private var userData: UserData?
    
    init(listener: UserAuthListener?) {
        self.listener = listener
    }
    
    func saveLoginData(username: String, password: String, domain: String, proxy: String) {
        userData = UserData(username: username, password: password, domain: domain, proxy: proxy)
        print("Login data saved: \(userData!)")
    }
    
    func login(transport: PHQSbcTransportType, addr: String, proxy: String) {
        guard let userData = userData else {
            listener?.onError("No login data found")
            return
        }
        
        if connectToSBC(userData: userData, transport: transport, addr: addr, proxy: proxy) {
            listener?.onLoginSuccess()
        } else {
            listener?.onError("Failed to connect to SBC")
        }
    }
    
    func logout() {
        listener?.onLogout()
        print("Logged out successfully")
    }
    
    private func connectToSBC(userData: UserData, transport: PHQSbcTransportType, addr: String, proxy: String) -> Bool {
        print("Connecting \(userData.username) to SBC using \(transport) at \(addr) with proxy \(proxy)...")
        return true
    }
}
