//
//  UIImageToString.swift
//  Coloround
//
//  Created by Marco Scaglione on 22/11/21.
//


import SwiftUI

//yourImage.toPngString() // it will convert UIImage to string

extension UIImage {
    func toPngString() -> String? {
        let data = self.pngData()
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
  
    func toJpegString(compressionQuality cq: CGFloat) -> String? {
        let data = self.jpegData(compressionQuality: cq)
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
}
