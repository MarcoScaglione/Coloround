//
//  Color+Extension.swift
//  Coloround
//
//  Created by Roman Simenok on 22.11.2021.
//

import SwiftUI
import UIKit

// RS
extension Color {
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var o: CGFloat = 0

        guard UIColor(self).getRed(&r, green: &g, blue: &b, alpha: &o) else {
            // handle the failure here as we want
            return (0, 0, 0, 0)
        }

        return (r * 255, g * 255, b * 255, o)
    }
}
