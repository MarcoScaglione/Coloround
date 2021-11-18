//
//  MainPage.swift
//  Coloround
//
//  Created by Andrea Maddaloni on 17/11/21.
//

import SwiftUI


struct mainPage : View {
    
    var body: some View {
        VStack{
            NavigationView {
                VStack{
                    
                }
                .navigationTitle("Albums")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        Button(action: {

                        
                        })
                        {
                            Label("Close", systemImage: "gearshape")
                            
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {

                        
                        })
                        {
                            Label("Close", systemImage: "camera.viewfinder")
                            
                        }
                    }
                }
            }
            
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            mainPage()
                .previewDevice("iPhone 11")
        }
    }

}

