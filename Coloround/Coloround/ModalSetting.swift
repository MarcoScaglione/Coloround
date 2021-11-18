//
//  ContentView.swift
//  Coloround mio
//
//  Created by Marco Scaglione on 16/11/21.
//

import SwiftUI

struct settingsView : View{
    @State var duration: Double = 0.5
    @State var selectedTuneRed = 0
    @State var selectedTuneGreen = 1
    @State var selectedTuneBlue = 2
    var sDuration : String = ""
    
   
    var tuneNotes = ["A","C#","E"]
    
        
    
    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            NavigationView {
                
                VStack(){
                    
                    Form{
                        Section( header: Text("Audio")){
                        
                            VStack{
                                
                                HStack{
                                    
                                    Text("Sound Duration")
                                    Spacer()
                                    Text("\(duration )")
                                    
                                }
                                Slider(value: $duration)
                                    
                            }
                            
                        }
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
                           
                        Section( header : Text("About")){
                            
                            NavigationLink(destination: CreditsView()) {
                                Text("Credits")
                            }
                        }
                    }
                }
                .navigationTitle("Settings")
                
            }
        }
    }
}
    
    struct ContentView_PreviewSettings: PreviewProvider {
        static var previews: some View {
            settingsView()
                .previewDevice("iPhone 11")
        }
    }

    
