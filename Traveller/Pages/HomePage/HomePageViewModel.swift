//
//  HomePageViewModel.swift
//  Traveller
//
//  Created by Mille Yin on 2025/2/24.
//

import Foundation
import Combine

class HomePageViewModel: ObservableObject {
    
    @Published var isBackToUserLocation: Bool = false
    
    var subscriptions: Set<AnyCancellable> = .init()
    
    deinit {
        self.subscriptions.forEach { $0.cancel() }
    }
    
    init() {
        
    }
}
