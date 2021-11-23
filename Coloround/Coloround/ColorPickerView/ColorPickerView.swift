//
//  ColorPickerView.swift
//  Coloround
//
//  Created by Daniel Makhovskyi on 21.11.2021.
//

import SwiftUI

// RS
struct ColorPickerView: View {
    let imageName: String = "monaLisa" // input parateter, remove value and delete file from the project
   
    @StateObject var Settings = SettingsObject()

    @State private var color = Color.white
    @State private var pickerPoint: CGPoint? = nil
    @State private var Selected = 1// Ask why on iphone crashes if added
    let myUnit = ToneOutputUnit()
    
    
    
    func PlayFrequency(){
        let rgbHz: (
            red: String,
            green: String,
            blue: String
        ) = RGBColorFreq.hzFrom(S : Settings,
            r: color.components.red,
            g: color.components.green,
            b: color.components.blue
        )
        switch Selected {
        case 1 :
            myUnit.setFrequency(freq: Double(rgbHz.red)!)
            myUnit.setToneVolume(vol: 0.5)
            myUnit.enableSpeaker()
            myUnit.setToneTime(t: Settings.duration)
        case 2:
            myUnit.setFrequency(freq: Double(rgbHz.green)!)
            myUnit.setToneVolume(vol: 0.5)
            myUnit.enableSpeaker()
            myUnit.setToneTime(t:  Settings.duration)
            
        case 3:
            myUnit.setFrequency(freq: Double(rgbHz.blue)!)
            myUnit.setToneVolume(vol: 0.5)
            myUnit.enableSpeaker()
            myUnit.setToneTime(t:  Settings.duration)
            
        default: break
        }
    }

    var body: some View {
        VStack {
            ZStack {
                GeometryReader { geometry in
                    TappableImageView(width: geometry.size.width, name: imageName) { (color, point) in
                        self.color = Color(color)
                        pickerPoint = point
                    }
                
                // Configure colors as you prefer
                if let point = pickerPoint {
                    Circle()
                        .strokeBorder(Color.gray.opacity(0.3), lineWidth: 1)
                        .background(Circle().fill(Color.white.opacity(0.6)))
                        .frame(width: 16, height: 16)
                        .position(x: point.x, y: point.y)
                }
                }
            }
            
            Spacer()
            
            HStack(spacing: 8) {
                Rectangle()
                    .fill(color)
                    .cornerRadius(8)
                    .frame(width: 100, height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding()
                HStack {
                    VStack {
                        Text("R")
                            .foregroundColor(Color.red)
                        Text("G")
                            .foregroundColor(Color.green)
                        Text("B")
                            .foregroundColor(Color.blue)
                    }
                    VStack {
                        Text(Int(color.components.red).description)
                        Text(Int(color.components.green).description)
                        Text(Int(color.components.blue).description)
                    }
                }
                
                Spacer()
                
                HStack {
                    VStack {
                        let rgbHz: (
                            red: String,
                            green: String,
                            blue: String
                        ) = RGBColorFreq.hzFrom( S : Settings,
                            r: color.components.red,
                            g: color.components.green,
                            b: color.components.blue
                        )
                        Text(rgbHz.red)
                        Text(rgbHz.green)
                        Text(rgbHz.blue)
                    }
                    VStack {
                        Text("Hz")
                        Text("Hz")
                        Text("Hz")
                    }
                }
                
                Spacer()
                
                Button(action: PlayFrequency) {
                    
                    VStack(spacing : 3){
                        
                        Image(systemName: "play.fill")
                        .dynamicTypeSize(.accessibility3)
                        Text("Play")
                    }
                    .padding(.horizontal, 5.0)
                }
                
                Spacer()
            }
        }
        .navigationBarItems(trailing:
            Button(action: {
                print("favorites button pressed")
            }) {
                Image("suit.heart")
            }
        )
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ColorPickerView()
                .previewDevice("iPhone 11")
        }
    }
}
