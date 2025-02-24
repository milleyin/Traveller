//
//  HomePage.swift
//  Traveller
//
//  Created by Mille Yin on 2025/2/24.
//

import SwiftUI

struct HomePage: View {
    
    
    @EnvironmentObject var location: LocationService
    @EnvironmentObject var route: NavigationRouter
    
    @StateObject var viewModel: HomePageViewModel = .init()
    
    var body: some View {
        NavigationStack(path: $route.path) {
            ZStack {
                AppleMap(isBackToUserLocation: viewModel.isBackToUserLocation)

            }
        }
        
    }
}

#Preview {
    HomePage()
        .environmentObject(LocationService.shared)
        .environmentObject(NavigationRouter.shared)
}
