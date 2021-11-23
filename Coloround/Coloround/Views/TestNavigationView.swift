//
//  TestNavigationView.swift
//  Coloround
//
//  Created by Roman Simenok on 23.11.2021.
//

import SwiftUI

// JUST FOR TEST THE NAVIGATION BAR ON COLOR PICKER
// REMOVE WHEN NAVIGATION IN HTE PP WILL BE FIXED
struct TestNavigationView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ColorPickerView()) {
                    Text("Show Detail View")
                }
                .navigationTitle("test")
            }
        }
    }
}

struct TestNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TestNavigationView()
    }
}
