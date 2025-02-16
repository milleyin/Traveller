//
//  LocationService.swift
//  Traveller
//
//  Created by Mille Yin on 2024/11/30.
//

import SwiftUI
import Combine
import CoreLocation
import NavigationKit

class LocationService: ObservableObject {
    
    static let shared = LocationService()
    
    ///当前位置(持续更新)
    @Published var location: CLLocation = .init()
    ///当前位置(单次更新)
    var currentLocation: CLLocation? {
        CoreLocationKit.shared.currentLocation
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
    private init() {
        updateLocation()
    }
    
    private func updateLocation() {
        CoreLocationKit.shared.locationPublisher
            .compactMap({ $0 })
            .receive(on: RunLoop.main)
            .sink { [weak self] location in
                guard let self: LocationService else { return }
                self.location = location
            }.store(in: &self.subscriptions)
    }
    
    deinit {
        self.subscriptions.forEach { $0.cancel() }
    }
}
