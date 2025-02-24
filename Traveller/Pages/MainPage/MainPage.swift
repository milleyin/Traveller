//
//  MainPage.swift
//  Traveller
//
//  Created by Mille Yin on 2024/11/29.
//

import SwiftUI
import MapKit

struct MainPage: View {
    
    @StateObject var viewModel: MainPageViewModel = .init()
    
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    
    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            HomePage()
                .tabItem {
                    Label {
                        Text("路線規劃")
                    } icon: {
                        Image(systemName: "point.topleft.down.to.point.bottomright.curvepath")
                    }
                    
                }
            TravelLogMainPage()
                .tabItem {
                    Label {
                        Text("旅行日誌")
                    } icon: {
                        Image(systemName: "list.bullet.rectangle.portrait.fill")
                    }
                }
            AchievementMainPage()
                .tabItem {
                    Label {
                        Text("成就")
                    } icon: {
                        Image(systemName: "medal.fill")
                    }
                    
                }
            Profile()
                .tabItem {
                    Label {
                        Text("個人資料")
                    } icon: {
                        Image(systemName: "tortoise.fill")
                    }
                    
                }
        }
    }
    ///当已经存在路由值(path)的情况下，点击另一个tab，用init的方式，清空当前存在的路由值
    private func handleTabChange(_ tab: Int) {
        switch tab {
        default:
            NavigationRouter.shared.reset()
        }
    }
}

#Preview {
    MainPage()
        .environmentObject(LocationService.shared)
}
