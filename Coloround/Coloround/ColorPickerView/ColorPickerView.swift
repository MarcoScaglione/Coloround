//
//  ColorPickerView.swift
//  Coloround
//
//  Created by Roman Simenok on 21.11.2021.
//

import SwiftUI

// RS
struct ColorPickerView: View {
    let imageName: String = "monaLisa" // input parateter, remove value and delete file from the project
    
    @State private var color = Color.white
    @State private var pickerPoint: CGPoint? = nil
    
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
                        ) = RGBColor.hzFrom(
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
                
                Button("▶️ Play") {
                    // Play sound
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
            ColorPickerView()
                .previewDevice("iPhone 13")
        }
    }
}
