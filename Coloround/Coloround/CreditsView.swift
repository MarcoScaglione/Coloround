//
//  CreditsView.swift
//  Coloround
//
//  Created by Marco Scaglione on 18/11/21.
//

import SwiftUI

struct CreditsView: View {
   
    
    
    var body: some View {
        
            Credits().navigationTitle("Credits")
                .navigationBarTitleDisplayMode(.large)
        
    }
}


struct Credits: View {
    var body: some View {
        
        
        
        VStack(){
            
            Form{
                Section( header: Text("Made by")){
                    
                    Text("Ilaria Scognamiglio")
                    Text("Marco Scaglione")
                    Text("Andrea Maddaloni")
                    Text("Daniel Makhovskyi")
                    
                }
            }
            
        }
    }
}

struct ContentView_PreviewCredits: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewDevice("iPhone 11")
    }
}


