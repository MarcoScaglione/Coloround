//
//  ContentView.swift
//  Challenge
//
//  Created by Ilaria Scognamiglio on 15/11/21.
//

import SwiftUI

struct Tutorial: View {
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .blue
    }
    
    var body: some View {
        TabView {
            FirstScreen()
            SecondScreen()
            ThirdScreen()
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}
struct FirstScreen: View {
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        VStack(spacing: 10){
            Text("Welcome to")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 120.0)
                
            Image("sfondop")
                .resizable()
                .aspectRatio(1.7777777778, contentMode: .fill)
                .frame(height: 207)
            Text ("This app is made to help Colorblind people to easily recognize and memorize colors using sounds")
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .padding([.top, .leading, .trailing], 22.0)
                .font(.system(size: 22))
            Text ("Swipe to the left to discover what you can do with it!")
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .padding(.all, 16.0)
                .font(.system(size: 22))
                Button("Skip the tutorial") {
                  dismiss()
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle)
                .padding(80)
            
            Spacer()
      
        } //view
    } //firstscreen
}

struct SecondScreen: View {
    var body: some View {
        
        VStack(spacing: 50){
            
            Text ("Discover the colors of your favourite pics!")
                
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, -100)
                .font(.system(size: 28))
           
            
            HStack{
                Image (systemName: "plus.app")
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                    .padding(.leading, 50.0)
            VStack{
                    Text("Albums or Camera")
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                        .padding(.leading, -110.0)
                
                Text ("Choose your pic from your own album or just take a photo")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                    .padding([.leading, .bottom, .trailing], 13.0)
                    .font(.system(size: 18))
                 
                }
            
                Spacer()
            }
            .padding(.top, 40.0)
            
            HStack{
                Image(systemName: "drop")
                    .padding(.leading, 42.0)
                    .foregroundColor(.blue)
                    .font(.system(size: 40))
                    
                VStack {
                    HStack{
                    Text("Picker")
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                            .padding(.leading, 19.0)
                        Spacer()
                    }
                            
                
                            
                    Text("Move the picker to discover the colors")
                        .fontWeight(.regular)
                        .font(.system(size: 18))
                        .padding(.trailing, 32.0)
                    
                       
                }
            }.padding()
          
        
        }
    }
}



struct ThirdScreen: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack{
            HStack{
                Image(systemName: "music.quarternote.3")
                    .font(.system(size: 20))
            Text("Listen to your colors!")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 10)
                Image(systemName: "music.quarternote.3")
                    .font(.system(size: 20))
            }
            
            Text("Choose one of the RGB axes and click play to listen how your colors sound")
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .padding(.top)
                .font(.system(size: 20))
                
                
            Image("rgbplay")
                .padding(.top, 10.0)
                .scaleEffect()
                .font(.system(size: 70))
            Button("Start"){
                dismiss()
            }
                
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle)
                .padding(.top, 150.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial()
    }
}

