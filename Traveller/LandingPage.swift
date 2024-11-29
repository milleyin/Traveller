//
//  LandingPage.swift
//  Traveller
//
//  Created by Mille Yin on 2024/11/29.
//

import SwiftUI

struct LandingPage: View {
    
    
    var body: some View {
        if User.shared.accessToken.isEmpty {
            LoginPage()
            
        }else {
            MainPage()
        }
    }
}

#Preview {
    LandingPage()
}
