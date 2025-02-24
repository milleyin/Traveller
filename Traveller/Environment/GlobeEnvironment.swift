//
//  GlobeEnvironment.swift
//  Traveller
//
//  Created by Mille Yin on 2025/2/24.
//

import Foundation
import UIKit
import CoreLocation
import Network
#if os(iOS)
import SafariServices
import MapKit
#endif


let isPreview: Bool = {
    return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
}()
#if os(iOS)
///打开系统邮箱app
func openMailApp() {
    if let url = URL(string: "message://") {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("无法打开邮件应用")
        }
    }
}
///打开iOS设置内的本app设置
func openAppSettings() {
    if let url = URL(string: UIApplication.openSettingsURLString) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

///打开网页链接
func openWebLink(urlString: String) {
    if let url = URL(string: urlString) {
        // 获取当前活动的窗口场景
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootVC = windowScene.windows.first?.rootViewController else {
            print("无法获取 Root View Controller")
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        rootVC.present(safariVC, animated: true, completion: nil)
    } else {
        print("无效的 URL")
    }
}

///检测设备当前网络环境
func getNetworkType() -> String {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue.global(qos: .background)
    var networkType = "未知"

    monitor.pathUpdateHandler = { path in
        if path.usesInterfaceType(.wifi) {
            networkType = "Wi-Fi"
        } else if path.usesInterfaceType(.cellular) {
            networkType = "蜂窝移动网络"
        } else if path.usesInterfaceType(.wiredEthernet) {
            networkType = "有线网络"
        } else if path.usesInterfaceType(.other) {
            networkType = "其他网络"
        } else {
            networkType = "无网络连接"
        }
        monitor.cancel() // 停止监控
    }
    monitor.start(queue: queue)

    // 等待短时间以确保检测完成
    Thread.sleep(forTimeInterval: 0.1)
    return networkType
}

///跳转Apple Map App开始导航

func openInAppleMaps(start: CLLocationCoordinate2D?, destination: CLLocationCoordinate2D, destinationName: String) {
    // 起点使用"当前位置"，如果提供了具体坐标，则用具体坐标
    let startItem: MKMapItem
    if let start = start {
        let startPlacemark = MKPlacemark(coordinate: start)
        startItem = MKMapItem(placemark: startPlacemark)
        startItem.name = "当前位置"
    } else {
        // 让 Apple Maps 以当前位置为起点
        startItem = MKMapItem.forCurrentLocation()
    }
    
    // 终点地标
    let destinationPlacemark = MKPlacemark(coordinate: destination)
    let destinationItem = MKMapItem(placemark: destinationPlacemark)
    destinationItem.name = destinationName  // 设置终点名称

    let options = [
        MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving // 驾车模式
    ]

    MKMapItem.openMaps(with: [startItem, destinationItem], launchOptions: options)
}


#endif

///软件名称
func getAppName() -> String {
    let appName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ??
    Bundle.main.infoDictionary?["CFBundleName"] as? String ??
    "未知应用"
    return appName
}

///软件版本号
var appVersion: String {
    Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
}

///编译版本号
var buildNumber: String {
    Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown"
}



///邮箱正则
let emailRegexPattern: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
///密码正则
let passWordRegexPattern: String = "^(?=.*[a-zA-Z])[a-zA-Z\\d!@%()_,.\\-]{8,16}$"
