//
//  TravellerApp.swift
//  Traveller
//
//  Created by Mille Yin on 2024/11/29.
//

import SwiftUI

@main
struct TravellerApp: App {
    
    @StateObject var user: User = .shared
    
    var body: some Scene {
        WindowGroup {
            LandingPage()
                .environmentObject(user)
        }
    }
}
