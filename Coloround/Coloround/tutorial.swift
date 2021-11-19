//
//  ContentView.swift
//  Challenge
//
//  Created by Ilaria Scognamiglio on 15/11/21.
//

import SwiftUI

struct Tutorial: View {
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .darkGray
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
                .multilineTextAlignment(.center)
                .padding([.top, .leading, .trailing], 22.0)
                .font(.system(size: 22))
            Text ("Swipe to the left to discover what you can do with it!")
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(.all, 16.0)
                .font(.system(size: 22))
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Skip the tutorial")
            
           
                        .multilineTextAlignment(.center)
                        .padding([.top, .leading, .bottom], 33.0)
//                    NavigationLink(destination:
//                    album()) {
//                    Text("tutorial")
                } // vstack
            
                .padding([.top, .trailing], 50.0)
            Spacer()
      
        } //view
    } //firstscreen
}

struct SecondScreen: View {
    var body: some View {
        
        VStack(spacing: 50){
            
            Text ("Discover colors of your favourite pics!")
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, -100)
                .font(.system(size: 28))
           
            
            HStack{
                Image (systemName: "photo.on.rectangle")
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                    .padding(.leading, 50.0)
            VStack{
                    Text("Albums")
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                        .padding(.leading, -125.0)
                
                Text ("Choose your pic from your own album")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 13.0)
                    .font(.system(size: 18))
                 
                }
            
                Spacer()
            }
            .padding(.top, 40.0)
            HStack{
                Image(systemName: "camera.viewfinder")
                    .padding(.leading, 55)
                    .foregroundColor(.blue)
                    .font(.system(size: 40))
                VStack{
                Text("Camera")
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                        .padding(.leading, -20.0)
                Text("Take a photo")
                    .fontWeight(.regular)
                    .font(.system(size: 18))
                    .padding(.leading, 18.0)
                    
                    
                }
                Spacer()
                
            }
            HStack{
                Image(systemName: "eyedropper")
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
                        .padding(.trailing, 18.0)
                       
                        
                       
                }
            }.padding()
          
        
        }
    }
}



struct ThirdScreen: View {
    var body: some View {
        VStack{
            Text("Listen to colors")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            
            Text("Choose one of the RGB axes or \"A\" (all of them) and click play to listen how your colors sound")
                .multilineTextAlignment(.center)
                .padding(.top)
            Image("rgb")
                .padding(.top, 10.0)
                .scaleEffect()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Start")
                    .padding(.top, 50.0)
                .buttonStyle(.bordered)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial()
    }
}
}
