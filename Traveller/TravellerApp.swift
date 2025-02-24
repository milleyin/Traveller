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
    @StateObject var route: NavigationRouter = .shared
    @StateObject var location: LocationService = .shared
    
    var body: some Scene {
        WindowGroup {
            LandingPage()
                .environmentObject(user)
                .environmentObject(location)
                .environmentObject(route)
        }
    }
}
