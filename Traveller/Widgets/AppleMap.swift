//
//  AppleMap.swift
//  Traveller
//
//  Created by Mille Yin on 2025/2/17.
//

import SwiftUI
import MapKit
import AppleMapKit

struct AppleMap: UIViewRepresentable {
    
    @EnvironmentObject var location: LocationService
    
    let appleMap = AppleMapKit()
    
    ///万能回调，用于外部传入自定义的地图操作
    var mapCallBack: ((MKMapView) -> Void)?
    ///返回用户位置
    var isBackToUserLocation: Bool
    
    func makeUIView(context: Context) -> MKMapView {
        
        if let userLocation = location.currentLocation?.coordinate {
            appleMap.mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.latitude, longitude: userLocation.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
        }
        
        return appleMap.mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        if appleMap.mapView.userTrackingMode == .follow {
            appleMap.mapView.setCenter(appleMap.mapView.userLocation.coordinate, animated: true)
        }
        // 可在这里更新地图上的内容
    }
}
