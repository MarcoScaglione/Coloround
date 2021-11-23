//
//  MainPage.swift
//  Coloround
//
//  Created by Andrea Maddaloni on 17/11/21.
//

//import SwiftUI
//
//struct MainPage : View {
//    @StateObject var Settings = SettingsObject()
//
//    var body: some View {
//
//            NavigationView {
//                VStack{
//                    Text("My Albums")
//                        .fontWeight(.semibold)
//                        .padding(.leading, -185.0)
//
//                    Spacer(minLength: 30.0)
//
//                        NavigationLink(destination: Tutorial()) {
//                            Image ("Placeholder Gallery")
//
//                                .resizable()
//
//                                .frame(width: 195, height: 300)
//                                .cornerRadius(10)
//                                .offset(x: 7 , y: 0)
//
//
//                            Spacer()
//
//                            HStack{
//
//                                NavigationLink (destination: CreditsView() ) {
//                                Image ("Placeholder Gallery")
//                                    .resizable()
//                                    .frame(width: 195, height: 300)
//                                    .cornerRadius(10)
//                                    .offset(x:-7 , y: 0)
//
//
//
//                            }
//                            }
//                        }
//
//                    Spacer()
//
//                    VStack{
//                        HStack{
//                            Text("Recents")
//                                .font(.subheadline)
//                                .fontWeight(.medium)
//                                .offset(x: -87, y: 0)
//
//                            Text("Favourite images")
//                                .font(.subheadline)
//                                .fontWeight(.medium)
//                                .offset(x: 53, y: 0)
//
//                        }
//                        Spacer()
//
//                        NavigationLink(destination: CreditsView()) {
//                            Image ("Placeholder Gallery")
//
//                                .resizable()
//                                .frame(width: 400, height:270)
//                                .cornerRadius(10)
//
//                        }
//                        Text("Favourite colors")
//                            .font(.subheadline)
//                            .fontWeight(.medium)
//                            .offset(x: -123, y: 0)
//                        Spacer()
//                    }
//                }
//                .navigationTitle("Albums")
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarLeading) {
//
//                        Button(action: {
//
//
//                        })
//                        {
//                            NavigationLink(destination: SettingsView()) {
//                                Label("", systemImage: "gearshape")
//
//
//                            }
//                        }
//                    }
//                    ToolbarItem(placement: .navigationBarTrailing){
//                        Button(action: {
//
//                        })
//                        {
//
//                            Label("", systemImage: "camera.viewfinder")
//
//                        }
//                    }
//                }
//
//            }.environmentObject(Settings)
//
//        }
//
//
//
//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            MainPage()
//                .previewDevice("iPhone 11")
//        }
//    }
//
//}
//
