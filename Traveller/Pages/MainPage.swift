//
//  MainPage.swift
//  Traveller
//
//  Created by Mille Yin on 2024/11/29.
//

import SwiftUI

struct MainPage: View {
    
    @EnvironmentObject var location: LocationService
    
    var body: some View {
        Text("Hello, MainPage!")
        Text("\(location.currentLocation)")
    }
}

#Preview {
    MainPage()
        .environmentObject(LocationService.shared)
}
