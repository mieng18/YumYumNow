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
    static let radient1 = Color(0x644AB5)
    static let radient2 = Color(0x482D9E)
    static let grayEFEEEE = Color(0xEFEEEE)
    static let black101010 = Color(0x101010)
    static let lightPurpleRadient1 = Color(0xA085F7)
    static let lightPurpleRadient2 = Color(0x9577F2)
    static let neutralRadient1 = Color(0xEBE8E8)
    static let neutralRadient2 = Color(0xEFEEEE)
    static let yellowTextC9AA05 = Color(0xC9AA05)
    static let grayText868585 = Color(0x868585)
    static let grayText595959 = Color(0x595959)
    static let black373737 = Color(0x373737)
    static let black303030 = Color(0x303030)
    static let gray6F6D6D = Color(0x6F6D6D)






}

