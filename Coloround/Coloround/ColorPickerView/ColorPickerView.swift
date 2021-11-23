//
//  ColorPickerView.swift
//  Coloround
//
//  Created by Daniel Makhovskyi on 21.11.2021.
//

import SwiftUI

// RS
struct ColorPickerView: View {
<<<<<<< HEAD
<<<<<<< HEAD
    @State private var image: UIImage?
=======
    let imageName: String = "monaLisa" // input parateter, remove value and delete file from the project
   
>>>>>>> parent of 2e8a389 (Settings connected, freq showed bug solved, god bless your  RS friend)
=======
    let imageName: String = "monaLisa" // input parateter, remove value and delete file from the project
<<<<<<< HEAD
    
    @StateObject var Settings = SettingsObject()
    
=======
   
>>>>>>> parent of f75b9b3 (colorpickerview page with camera changes)
>>>>>>> parent of 82493dc (daniel changes)
    @State private var color = Color.white
    @State private var pickerPoint: CGPoint? = nil
    @State private var Selected = 1// Ask why on iphone crashes if added
    let myUnit = ToneOutputUnit()
<<<<<<< HEAD
    
    
    
=======
    
    
    
>>>>>>> parent of f75b9b3 (colorpickerview page with camera changes)
    func PlayFrequency(){
        let rgbHz: (
            red: String,
            green: String,
            blue: String
        ) = RGBColorFreq.hzFrom(S: Settings,
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
            myUnit.setToneTime(t: Settings.duration)
            
        case 3:
            myUnit.setFrequency(freq: Double(rgbHz.blue)!)
            myUnit.setToneVolume(vol: 0.5)
            myUnit.enableSpeaker()
            myUnit.setToneTime(t: Settings.duration)
            
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
<<<<<<< HEAD
<<<<<<< HEAD
                VStack {
                    Text("Hz")
                    Text("Hz")
                    Text("Hz")
=======
=======
>>>>>>> parent of 82493dc (daniel changes)
                
                Spacer()
                
                HStack {
                    VStack {
                        let rgbHz: (
                            red: String,
                            green: String,
                            blue: String
<<<<<<< HEAD
                        ) = RGBColor.hzFrom(
=======
<<<<<<< HEAD
                        ) = RGBColorFreq.hzFrom(S: Settings,
=======
                        ) = RGBColor.hzFrom(
>>>>>>> parent of f75b9b3 (colorpickerview page with camera changes)
>>>>>>> parent of 82493dc (daniel changes)
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
<<<<<<< HEAD
>>>>>>> parent of 2e8a389 (Settings connected, freq showed bug solved, god bless your  RS friend)
=======
>>>>>>> parent of 82493dc (daniel changes)
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
