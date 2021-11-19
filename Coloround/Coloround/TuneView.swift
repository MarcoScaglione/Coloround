//
//  TuneView.swift
//  Coloround
//
//  Created by Marco Scaglione on 18/11/21.
//

import SwiftUI

struct TuneView: View {
    @State var duration : Double = 0
    @State var showmodalview = false
    @State var selectedTuneRed = 0
    @State var selectedTuneGreen = 1
    @State var selectedTuneBlue = 2
    
   
    var tuneNotes = ["A","C#","E"]
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        NavigationView {
            
            VStack(){
                
                Form{
                    Section( header: Text("Frequencies")){
                        Picker(selection: $selectedTuneRed, label: Text("Red")) {
                            ForEach(0 ..< tuneNotes.count){
                                Text(self.tuneNotes[$0])
                            }
                            
                        }
                        
                        Picker(selection: $selectedTuneGreen, label: Text("Green")) {
                            ForEach(0 ..< tuneNotes.count){
                                Text(self.tuneNotes[$0])
                            }
                        }
                        
                        Picker(selection: $selectedTuneBlue, label: Text("Blue")) {
                            ForEach(0 ..< tuneNotes.count){
                                Text(self.tuneNotes[$0])
                            }
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


