//
//  View+Extensions.swift
//  YumYumNow
//
//  Created by mai nguyen on 7/10/23.
//

import SwiftUI

extension View{
    // Global View Access For Show/Hide Tab Bar
    func showTabBar(){
        NotificationCenter.default.post(name: NSNotification.Name("SHOWTABBAR"), object: nil)
    }
    
    func hideTabBar(){
        NotificationCenter.default.post(name: NSNotification.Name("HIDETABBAR"), object: nil)
    }
    
    @ViewBuilder
    func setCustomTabBarBackground(color: Color)->some View{
        self
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background {
                color
                    .ignoresSafeArea()
            }
    }
}
