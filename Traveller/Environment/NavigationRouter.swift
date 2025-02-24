//
//  NavigationRouter.swift
//  Traveller
//
//  Created by Mille Yin on 2025/2/24.
//

import SwiftUI

final class NavigationRouter: ObservableObject {
    
    static let shared = NavigationRouter()
    
    @Published var path = NavigationPath()
    private init() {
        
    }
    
    func reset(){
        self.path = NavigationPath()
    }
}
