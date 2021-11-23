//
//  File.swift
//  Coloround
//
//  Created by Marco Scaglione on 19/11/21.
//

import SwiftUI

class RGBColorFreq {
    
    class func hzFrom(S : SettingsObject, r: CGFloat, g: CGFloat, b: CGFloat) -> (String, String, String) {
        
        var redt : CGFloat = 0
        var greent : CGFloat = 0
        var bluet : CGFloat = 0
        
        switch S.selectedTuneRed{
        case 0:
            redt = r * 1.71875 + 440
        case 1:
            redt = r * 2.16797 + 554
        case 2:
            redt = r * 2.57813 + 659
        default:
            redt = r * 1.71875 + 440
        }
        switch S.selectedTuneGreen{
        case 0:
            greent = g * 1.71875 + 440
        case 1:
            greent = g * 2.16797 + 554
        case 2:
            greent = g * 2.57813 + 659
        default:
            greent = g * 1.71875 + 440
        }
        switch S.selectedTuneBlue{
        case 0:
            bluet = b * 1.71875 + 440
        case 1:
            bluet = b * 2.16797 + 554
        case 2:
            bluet = b * 2.57813 + 659
        default:
            bluet = b * 1.71875 + 440
        }
        return(
            red: Int((redt)).description,
            green: Int((greent)).description,
            blue: Int((bluet)).description
        )
    }
}


