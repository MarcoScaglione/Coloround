//
//  TuneView.swift
//  Coloround
//
//  Created by Marco Scaglione on 18/11/21.
//

import SwiftUI

struct TuneView: View {
    @State var duration: Double = 0
    @State var showmodalview = false
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        NavigationView {
            
            VStack(){
                
                Form{
                    Section( header: Text("Frequencies")){
                        HStack{
                        
                            NavigationLink(destination: Tutorial()) {
                                Text("Red")
                                Label("", systemImage: "chevron")
                                Spacer()
//                                Text("\(tuneRed) ")
                                
                            }
                            
                        }
                        NavigationLink(destination: Tutorial()) {
                            Text("Green")
                            Label("", systemImage: "chevron")
                        }
                        NavigationLink(destination: Tutorial()) {
                            Text("Blue")
                            Label("", systemImage: "chevron")
                        }
                    }
                    
                }

            }
            .navigationTitle("Tune")
        }
    }
}
struct ContentView_PreviewTuneView: PreviewProvider {
    static var previews: some View {
        TuneView()
            .previewDevice("iPhone 11")
    }
}


