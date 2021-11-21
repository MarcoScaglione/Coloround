//
//  File.swift
//  Coloround
//
//  Created by Marco Scaglione on 19/11/21.
//

import SwiftUI

class RGBColor {
   
    
    var redV : Double = 0
    var greenV : Double  = 0
    var blueV : Double = 0
    var redF : Double = 0
    var greenF : Double = 0
    var blueF : Double = 0
    
    func fConv(S : SettingsObject ){
        switch S.selectedTuneRed{
        case 0:
            self.redF = redV * 1.71875 + 440
        case 1:
            self.redF = redV * 2.16797 + 554
        case 2:
            self.redF = redV * 2.57813 + 659
        default:
            self.redF = redV * 1.71875 + 440
        }
        switch S.selectedTuneGreen{
        case 0:
            self.greenF = greenV * 1.71875 + 440
        case 1:
            self.greenF = greenV * 2.16797 + 554
        case 2:
            self.greenF = greenV * 2.57813 + 659
        default:
            self.greenF = greenV * 1.71875 + 440
        }
        switch S.selectedTuneBlue{
        case 0:
            self.blueF = blueV * 1.71875 + 440
        case 1:
            self.blueF = blueV * 2.16797 + 554
        case 2:
            self.blueF = blueV * 2.57813 + 659
        default:
            self.blueF = blueV * 1.71875 + 440
        }
    }
}


