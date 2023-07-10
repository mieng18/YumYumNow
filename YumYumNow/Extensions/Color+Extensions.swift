//
//  Color+Extensions.swift
//  YumYumNow
//
//  Created by mai nguyen on 7/9/23.
//

import SwiftUI

extension Color {

    init(_ hex: UInt, alpha: Double = 1) {
    self.init(
        .sRGB,
        red: Double((hex >> 16) & 0xFF) / 255,
        green: Double((hex >> 8) & 0xFF) / 255,
        blue: Double(hex & 0xFF) / 255,
        opacity: alpha
    )
    }
}


extension Color {
   
    
    static let purple462B9C = Color(0x462B9C)
    static let whiteFFFEFE = Color(0xFFFEFE)


}

