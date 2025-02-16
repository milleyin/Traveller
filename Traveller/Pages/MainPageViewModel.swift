//
//  MainPageViewModel.swift
//  Traveller
//
//  Created by Mille Yin on 2025/2/7.
//

import Foundation
import MapKit
import SwiftUI
import Combine

class MainPageViewModel: ObservableObject {
    
    
    @Published var position: MapCameraPosition = .automatic
    
    var subscriptions: Set<AnyCancellable> = .init()
    
    deinit {
        self.subscriptions.forEach { $0.cancel() }
    }
    
    init() {
        self.getLocation()
    }
    
    private func getLocation() {
        LocationService.shared.$location
            .receive(on: RunLoop.main)
            .compactMap({$0})
            .first()
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("成功")
                }
            } receiveValue: { location in
                self.position = .camera(MapCamera(centerCoordinate: location.coordinate, distance: 5000, heading: 0, pitch: 89))
            }.store(in: &subscriptions)

    }
}
