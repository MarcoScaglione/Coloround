//
//  ContentView.swift
//  Challenge
//
//  Created by Ilaria Scognamiglio on 15/11/21.
//

import SwiftUI

struct ContentView: View {
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
        VStack {
            Text("Welcome to")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 150.0)
            Image("sfondop")
                .resizable()
                .aspectRatio(1.7777777778, contentMode: .fill)
                .frame(height: 207)
            Text ("This app is made to help Colorblind people to easily recognize and memorize colors using sounds")
                .fontWeight(.bold)
                .padding(.top, 50.0)
            Text ("Swipe to the left to discover what you can do with it!")
                .fontWeight(.bold)
                .padding(.top, 50.0)
            Spacer()
        }
    }
}

struct SecondScreen: View {
    var body: some View {
        VStack{
            
            Text ("Discover colors of your favourite pics!")
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, -100)
            
            Text ("You can:")
                .padding(.top, 10.0)
            
            HStack{
                Image (systemName: "camera.viewfinder")
                
                    .padding(.leading, 50.0)
                Text ("Choose your pic from your own album")
                    .padding(.leading, 50.0)
                Spacer()
            }
            .padding(.top, 40.0)
            HStack{
                Image(systemName: "camera.viewfinder")
                    .padding(.leading, 50.0)
                Text("Take a photo")
                    .padding(.leading, 50.0)
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
                Text("R")
                    .foregroundColor(.red)
                    .padding(15.0)
                Text ("254")
            }
            HStack{
                Text("G")
                    .padding(15.0)
                    .foregroundColor(.green)
                Text ("51")
                
            }
            HStack{
                Text("B")
                    .padding()
                    .foregroundColor(.blue)
                Text("86")
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
            Text("Listen to the colors")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
