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
            FourthScreen()
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
           
            Text ("You can:")
                .padding(.top)
                .scaleEffect(2)
                .foregroundColor(.secondary)
            
            HStack{
                Image (systemName: "photo.on.rectangle")
                    .scaleEffect(3)
                
                    .padding(.leading, 50.0)
                Text ("Choose your pic from your own album")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 30.0)
                 .scaleEffect(1.0)
            
                Spacer()
            }
            .padding(.top, 40.0)
            HStack{
                Image(systemName: "camera.viewfinder")
                    .padding(.leading, 26)
                    .scaleEffect(3)
                
                Text("Take a photo")
                    .fontWeight(.semibold)
                    .padding(.leading, 60.0)
                    .scaleEffect(1.0)
                    
                Spacer()
            }
            .padding(.top, 40.0)
        
        }
    }
}
struct ThirdScreen: View {
    var body: some View {
        VStack{
            Text("Move the pointer to discover!")
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.bold)
                .padding(.leading, 30.0)
            Image("Flower")
            HStack{
                
                Image("Rosso")
                    .padding(.leading, -14.0)
                    .scaleEffect(2)
                VStack{
                    
                    HStack{
                Text("R")
                    .foregroundColor(.red)
                    .padding(3.0)
                Text ("254")
                    }
                    HStack{
                Text("G")
                            .padding(.trailing, 9.0)
                    .foregroundColor(.green)
                Text ("51")
                    }
                    HStack{
                Text("B")
                            .padding(.top)
                    .foregroundColor(.blue)
                Text("86")
                    }
                }
            }
            
            VStack{
                Text("Once you set the pointer you'll find the details just before")
                    .fontWeight(.bold)
            }
        }
    }
}


struct FourthScreen: View {
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial()
    }
}
}
