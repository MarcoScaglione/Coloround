//
//  AlbumView.swift
//  Coloround
//
//  Created by Marco Scaglione on 22/11/21.
//

import SwiftUI

struct AlbumView: View {
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    
    var body: some View{
        
        
            VStack{
                
                   /* NavigationLink(destination: */PhotoPickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                    
                       
                    
            }
            
        }
    }
        

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
            .previewDevice("iPhone 11")
    }
}


