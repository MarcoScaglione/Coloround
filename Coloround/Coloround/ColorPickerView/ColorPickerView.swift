//
//  ColorPickerView.swift
//  Coloround
//
//  Created by Daniel Makhovskyi on 21.11.2021.
//

import SwiftUI

struct ColorPickerView: View {
    @State private var image: UIImage?
    @State private var color = Color.white
    @State private var pickerPoint: CGPoint?
    @State private var Selected = 1
    @State private var showingActionSheet = false
    @State private var showingImagePicker = false
    @State private var showingSheet = true
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @StateObject var Settings = SettingsObject()

    private let myUnit = ToneOutputUnit()
    
    func PlayFrequency() {
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
        
        NavigationView{
            
            VStack {
                GeometryReader { geometry in
                    ZStack {
                        if let image = self.image {
                            // workaraund to get right imageView height
                            let frame = geometry.frame(in: .named("ImageView"))
                            TappableImageView(width: geometry.size.width,
                                              height: geometry.size.height - abs(frame.origin.x),
                                              image: image) { (color, point) in
                                self.color = Color(color)
                                pickerPoint = point
                            }
                        } else {
                            HStack {
                                Spacer()
                                VStack(alignment: .center) {
                                    Spacer()
                                    Text("Please select an image")
                                    Spacer()
                                }
                                Spacer()
                            }
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
                    .coordinateSpace(name: "ImageView")
                }
                
                Spacer()
                bottomView()
                tabBarView()
            }
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                            .dynamicTypeSize(.xLarge)
                    }
                    .padding(1)
                    
                    Button(action: {
                        showingActionSheet = true
                    }, label: {
                        Image(systemName: "plus.app")
                            .dynamicTypeSize(.xxLarge)
                    })
                        .padding(1)
                }
                }
            }.environmentObject(Settings)
            .sheet(isPresented: $showingSheet){
                Tutorial()
            }
        
        .navigationBarTitleDisplayMode(.inline)
        .actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(title: Text("Image soure"), message: Text("Select where to pick an image"), buttons: [
                .default(Text("Camera")) {
                    sourceType = .camera
                    showingImagePicker = true
                },
                .default(Text("Gallery")) {
                    sourceType = .photoLibrary
                    showingImagePicker = true
                },
                .cancel()
            ])
        }
        .sheet(isPresented: self.$showingImagePicker) {
            PhotoPickerView(selectedImage: $image, sourceType: self.sourceType)
        }
    }
    
    @ViewBuilder private func bottomView() -> some View {
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
                        .dynamicTypeSize(.xLarge)
                        .foregroundColor(Color.red)
                        .padding(0.1)
                    Text("G")
                        .dynamicTypeSize(.xLarge)
                        .foregroundColor(Color.green)
                        .padding(0.1)
                    Text("B")
                        .dynamicTypeSize(.xLarge)
                        .foregroundColor(Color.blue)
                }
                VStack {
                    Text(Int(color.components.red).description)
                        .dynamicTypeSize(.xLarge)
                        .padding(0.1)
                    Text(Int(color.components.green).description)
                        .dynamicTypeSize(.xLarge)
                        .padding(0.1)
                    Text(Int(color.components.blue).description)
                        .dynamicTypeSize(.xLarge)
                }
            }
            
            Spacer()
            
            HStack {
                VStack {
                    let rgbHz: (
                        red: String,
                        green: String,
                        blue: String
                    ) = RGBColorFreq.hzFrom(S : Settings,
                                            r: color.components.red,
                                            g: color.components.green,
                                            b: color.components.blue
                    )
                    Text(rgbHz.red)
                        .dynamicTypeSize(.xLarge)
                        .padding(0.1)
                    Text(rgbHz.green)
                        .dynamicTypeSize(.xLarge)
                        .padding(0.1)
                    Text(rgbHz.blue)
                        .dynamicTypeSize(.xLarge)
                }
                VStack {
                    Text("Hz")
                        .dynamicTypeSize(.xLarge)
                        .padding(0.1)
                    Text("Hz")
                        .dynamicTypeSize(.xLarge)
                        .padding(0.1)
                    Text("Hz")
                        .dynamicTypeSize(.xLarge)
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
            }.dynamicTypeSize(.xxLarge)
            
            Spacer()
        }
    }
    
    @ViewBuilder private func tabBarView() -> some View {
        VStack(spacing: 12) {
            Rectangle()
                .foregroundColor(.gray)
                .frame(height: 1)
                .frame(maxWidth: .infinity)
            HStack {
                Spacer()
                Button("R", action: {
                  Selected = 1
                }).dynamicTypeSize(.xxLarge).foregroundColor(Selected == 1 ? .blue : .gray)
                Spacer(minLength: 100)
                Button("G", action: {
                  Selected = 2
                }).dynamicTypeSize(.xxLarge).foregroundColor(Selected == 2 ? .blue : .gray)
                Spacer(minLength: 100)
                Button("B", action: {
                  Selected = 3
                }).dynamicTypeSize(.xxLarge).foregroundColor(Selected == 3 ? .blue : .gray)
                Spacer()
            }
        }
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
