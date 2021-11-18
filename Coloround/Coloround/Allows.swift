//
//  Allows.swift
//  Coloround
//
//  Created by Ilaria Scognamiglio on 18/11/21.
//

import Foundation
import SwiftUI

struct Allows: View {
 @State private var showingAlert = false
    
    var body: some View {
        Button("Start") {
            showingAlert = true
        }
     .alert("\"Coloround\" Would Like to Access Your Photos", isPresented: $showingAlert) {
            Button("Select Photo..") { }
            Button("Allow Access to All Photos") { }
            Button("Don't Allow") { }
            
        }
    }
    
}

struct ContentView_PreviewAllows: PreviewProvider {
    static var previews: some View {
        Allows()
            .previewDevice("iPhone 11")
    }
}




