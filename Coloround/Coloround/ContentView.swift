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
        Image("sfondo")
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
        Text ("You can")
            
            HStack{
             Image (systemName: "camera.viewfinder")
                Text ("Choose your pic from your own album")
                Spacer()
            }
    }
}
}
struct ThirdScreen: View {
    var body: some View {
        Color.blue
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
