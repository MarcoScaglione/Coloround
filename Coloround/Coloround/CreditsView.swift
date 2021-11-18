//
//  CreditsView.swift
//  Coloround
//
//  Created by Marco Scaglione on 18/11/21.
//

import SwiftUI

struct CreditsView: View {
    @State var duration: Double = 0
    @State var showmodalview = false
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        NavigationView {
            
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
            .navigationTitle("Credits")
        }
    }
}
struct ContentView_PreviewCredits: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewDevice("iPhone 11")
    }
}


