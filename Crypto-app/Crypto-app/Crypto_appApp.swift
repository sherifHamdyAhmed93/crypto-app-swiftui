//
//  Crypto_appApp.swift
//  Crypto-app
//
//  Created by Sherif Hamdy on 02/03/2024.
//

import SwiftUI

@main
struct Crypto_appApp: App {
    
    @StateObject private var vm:HomeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .environmentObject(vm)
        }
    }
}
