//
//  MainPage.swift
//  Traveller
//
//  Created by Mille Yin on 2024/11/29.
//

import SwiftUI
import MapKit

struct MainPage: View {
    
    @EnvironmentObject var location: LocationService
    
    @StateObject var viewModel: MainPageViewModel = .init()
    
    var body: some View {
        ZStack {
            Map(position: $viewModel.position)

        }
    }
    
    
}

#Preview {
    MainPage()
        .environmentObject(LocationService.shared)
}
