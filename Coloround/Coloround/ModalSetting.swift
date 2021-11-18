//
//  ContentView.swift
//  Coloround mio
//
//  Created by Marco Scaglione on 16/11/21.
//

import SwiftUI

struct ModalSetting : View {
    @State var showmodalview = false
    @State var showActionSheet = false
    
    
    
    var ActionSheet: SwiftUI.ActionSheet {
        SwiftUI.ActionSheet(
            title: Text("Action Sheet's title"),
            message: Text("This is a message"),
            buttons: [
                .default(Text("this is a default button"), action:  {            print ("Default button tapped")
                }),
                .destructive(Text("this is a destructive button")),
                .cancel()
            ])
    }
        
    
    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            VStack{
                Button("show Modal"){
                    self.showmodalview.toggle()
                }
                Button("show Action Sheet"){
                    self.showActionSheet.toggle()
                }
                Menu("Actions") {
                    Button("Rename2", action: {print ("hello")})
                    Button("Rename", action: {print ("hello")})
                    Menu("Copy") {
                        Button("Copy", action: {print ("hello")})
                        Button("Copy Formatted", action: {print ("hello")})
                        Button("Copy Library Path", action: {print ("hello")})
                    }
                }
            }
            .actionSheet(isPresented: $showActionSheet, content: {self.ActionSheet})
            .sheet(isPresented: $showmodalview, content: { ModalView() })
        }
       
    }
    
    struct ModalView: View {
        @State var duration: Double = 0
        @State var showmodalview = false
        @Environment(\.presentationMode) private var presentationMode
        
        var body: some View {
            NavigationView {
                
                VStack(){
                    
                    Form{
                        Section( header: Text("Audio")){
                        
                            NavigationLink(destination: Tutorial()) {
                                Text("Tune")
                                Label("", systemImage: "chevron")
                            }
                            VStack{
                                
                                HStack{
                                    
                                    Text("Sound Duration")
                                    Spacer()
                                    Text("\(duration) ")
                                    
                                }
                                
                                HStack{
                                    
                                    Slider(value: $duration )
                                        

                                }
                            }
                            
                        }
                        Section( header : Text("About")){
                            
                            NavigationLink(destination: CreditsView()) {
                                Text("Credits")
                                Label("", systemImage: "chevron")
                            }
                        }
                    }

                }
                .navigationTitle("Settings")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        
                        })
                        {
                            Text("Close")
                            
                        }
                    }
                }
            }
        }
    }
    
    

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ModalSetting()
                .previewDevice("iPhone 11")
        }
    }
}

