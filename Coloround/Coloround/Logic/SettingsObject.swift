//
//  Environment.swift
//  Coloround
//
//  Created by Marco Scaglione on 19/11/21.
//
//
import SwiftUI


class SettingsObject : ObservableObject{
    @Published var duration = 1.5
    @Published var selectedTuneRed = 0
    @Published var selectedTuneGreen = 1
    @Published var selectedTuneBlue = 2
}


