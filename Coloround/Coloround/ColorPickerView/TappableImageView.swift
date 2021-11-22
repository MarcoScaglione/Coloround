//
//  TappableImageView.swift
//  Coloround
//
//  Created by Roman Simenok on 22.11.2021.
//

import SwiftUI

// RS

struct TappableImageView: UIViewRepresentable {
    var width: CGFloat
    var name: String
    var tappedCallback: ((UIColor, CGPoint) -> Void)

    class Coordinator: NSObject {
        var tappedCallback: ((UIColor, CGPoint) -> Void)
        
        init(tappedCallback: @escaping ((UIColor, CGPoint) -> Void)) {
            self.tappedCallback = tappedCallback
        }
        
        @objc func tapped(gesture: UITapGestureRecognizer) {
            let point = gesture.location(in: gesture.view)
            
            if let view = gesture.view,
               let color = getPixelColorAtPoint(point: point, sourceView: view) {
                self.tappedCallback(color, point)
            }
        }
        
        private func getPixelColorAtPoint(point:CGPoint, sourceView: UIView) -> UIColor? {
            let pixel = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: 4)
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
            let context = CGContext(data: pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
            var color: UIColor? = nil
            
            if let context = context {
                context.translateBy(x: -point.x, y: -point.y)
                sourceView.layer.render(in: context)
                
                color = UIColor(red: CGFloat(pixel[0])/255.0,
                                green: CGFloat(pixel[1])/255.0,
                                blue: CGFloat(pixel[2])/255.0,
                                alpha: CGFloat(pixel[3])/255.0)
                
                pixel.deallocate()
            }
            return color
        }
    }

    func makeCoordinator() -> TappableImageView.Coordinator {
        return Coordinator(tappedCallback: self.tappedCallback)
    }
    
    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: name)?.resizedImage(newWidth: UIScreen.main.bounds.width)
        let gesture = UITapGestureRecognizer(target: context.coordinator,
                                             action: #selector(Coordinator.tapped))
        imageView.addGestureRecognizer(gesture)
        return imageView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {
    }
}

private extension UIImage {
    func resizedImage(newWidth: CGFloat) -> UIImage? {
        let scale = newWidth / size.width
        let newHeight = size.height * scale
        UIGraphicsBeginImageContext(.init(width: newWidth, height: newHeight))
        self.draw(in: .init(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
