//
//  ContentView.swift
//  Coloround mio
//
//  Created by Marco Scaglione on 16/11/21.
//

import SwiftUI

struct settingsView : View{

    
    //@EnvironmentObject var Settings : SettingsObject   questo qui serve se devi prendere la variabile ma non modificarla
    @StateObject var Settings = SettingsObject()
            

    
   
    var tuneNotes = ["440 - 880 Hz (A)","554 - 1109 Hz (C#)","659- 1319 Hz (E)"]
        
    
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
                                    Text("\(Settings.duration)")
                                    
                                }
                                Slider(value: $Settings.duration, in: 0.5...2.5, step: 0.1)
                                    
                            }
                            
                        }
                        Section( header: Text("Frequencies ")){
                            Picker(selection: $Settings.selectedTuneRed, label: Text("Red")) {
                                ForEach(0 ..< tuneNotes.count){
                                    Text(self.tuneNotes[$0])
                                }
                                
                            }
                            
                            Picker(selection: $Settings.selectedTuneGreen, label: Text("Green")) {
                                ForEach(0 ..< tuneNotes.count){
                                    Text(self.tuneNotes[$0])
                                }
                            }
                            
                            Picker(selection: $Settings.selectedTuneBlue, label: Text("Blue")) {
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

    
