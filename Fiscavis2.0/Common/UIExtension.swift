//
//  UIExtension.swift
//  Fiscavis2.0
//
//  Created by J. DeWeese on 11/16/23.
//

import SwiftUI

enum Inter: String {
    case regular = "Inter-Regular"
    case medium = "Inter-Medium"
    case semibold = "Inter-SemiBold"
    case bold = "Inter-Bold"
}

extension Font {
    
    static func customfont(_ font: Inter, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
}

extension CGFloat {
    
    static var screenWidth: Double {
        return UIScreen.main.bounds.size.width
    }
    
    static var screenHeight: Double {
        return UIScreen.main.bounds.size.height
    }
    
    static func widthPer(per: Double) -> Double {
        return screenWidth * per
    }
    
    static func heightPer(per: Double) -> Double {
        return screenHeight * per
    }
    
    static var topInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.top
        }
        return 0.0
    }
    
    static var bottomInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.bottom
        }
        return 0.0
    }
    
    static var horizontalInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.left + keyWindow.safeAreaInsets.right
        }
        return 0.0
    }
    
    static var verticalInsets: Double {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets.top + keyWindow.safeAreaInsets.bottom
        }
        return 0.0
    }
    
}

extension Color {
    
    static let theme = ColorTheme( )
    static let launch = LaunchTheme( )
}


struct ColorTheme {
    
    let colorAccent = Color("AccentColor")
    let colorSecondaryText = Color("SecondaryTextColor")
    let colorGreen = Color("ColorGreen")
    let colorRed = Color("ColorRed")
    let colorOrange = Color("ColorOrange")
    let colorBlue = Color("ColorBlue")
    let colorGrey = Color("ColorGrey")
    let colorGray = Color("ColorGray")
    let colorBlack = Color("ColorBlack")
    let colorBackground = Color("ColorBackground")
    
}

struct LaunchTheme {
    
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
    
}


