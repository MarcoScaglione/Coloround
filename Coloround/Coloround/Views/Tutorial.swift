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
                .multilineTextAlignment(.center)
                .padding([.top, .leading, .trailing], 22.0)
                .font(.system(size: 22))
            Text ("Swipe to the left to discover what you can do with it!")
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(.all, 16.0)
                .font(.system(size: 22))
            Button("Skip tutorial") {
                dismiss()
            }

//            NavigationLink(destination: ColorPickerView(), label: {Text("Skip Tutorial")})

//            NavigationLink(destination:
//            ColorPickerView()) {
//                    Text("Skip the tutorial")
//                        .multilineTextAlignment(.center)
//                        .padding([.top, .leading, .bottom], 33.0)
 // vstack




                .padding([.top, .trailing], 50.0)
            Spacer()
        }

        } //view
    } //firstscreen


struct SecondScreen: View {
    var body: some View {

        VStack(spacing: 60){

            Text ("Discover colors of your favourite pics!")
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, -100)
                .font(.system(size: 28))


            HStack {
                Image (systemName: "photo.on.rectangle")
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                    .padding(.leading, 50.0)
            VStack{
                    Text("Albums")
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                        .padding(.leading, -84)

                Text ("Choose your pic from your own album")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 18.5)
                    .font(.system(size: 18))

                }

                Spacer(minLength: 20)
            }
            .offset(x: 30, y: -20)
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

            }
            .offset(x: -60, y:-40)
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
                        Spacer(minLength: 20)
                    }



                    Text("Move the picker to discover the colors")
                        .fontWeight(.regular)
                        .font(.system(size: 18))
                        .padding(.trailing, 18)


                }

            }
            .offset(x: 30, y: -60)
            .padding()


        }
    }
}



struct ThirdScreen: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        
        VStack{
            HStack{
            Image (systemName: "music.quarternote.3")
                    .font(.system(size: 30))
                    .offset(x: 0, y: -120)
            Text("Listen to colors")
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.bold)
                .font(.system(size: 18))
                .offset(x: 0, y: -120)
                Image (systemName: "music.quarternote.3")
                        .font(.system(size: 30))
                        .offset(x: 0, y: -120)





            }



            Text("Choose one of the RGB axes or \"A\" (all of them) and click play to listen how your colors sound")
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .padding([.top, .leading, .trailing], 22.0)
                .font(.system(size: 22))
                .offset(x: 0, y: -30)
            Image("rgb")
                .padding(.top, 10.0)
                .scaleEffect()
                .offset(x: 0, y: 30)
            Button("Start"){
                dismiss()
            }
                .padding(.top, 50.0)
                .buttonStyle(.bordered)
                .offset(x: 0, y: 120)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial()
    }
}
}
