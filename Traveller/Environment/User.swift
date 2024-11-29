//
//  User.swift
//  Traveller
//
//  Created by Mille Yin on 2024/11/29.
//

import Foundation

class User: ObservableObject {
    
    static let shared = User()
    
    ///用户登入token
    @Published var accessToken: String = ""
    
    private init() {
        
    }
    
}
