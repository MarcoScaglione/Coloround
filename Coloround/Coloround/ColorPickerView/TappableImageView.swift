//
//  TappableImageView.swift
//  Coloround
//
//  Created by Daniel Makhovskyi on 22.11.2021.
//

import SwiftUI
import UIKit

struct TappableImageView: UIViewRepresentable {
    let width: CGFloat
    let height: CGFloat
    let image: UIImage
    var tappedCallback: ((UIColor, CGPoint) -> Void)

    class Coordinator: NSObject, UIGestureRecognizerDelegate {
        var tappedCallback: ((UIColor, CGPoint) -> Void)
        
        init(tappedCallback: @escaping ((UIColor, CGPoint) -> Void)) {
            self.tappedCallback = tappedCallback
        }
        
        @objc func tapped(gesture: UITapGestureRecognizer) {
            guard let view = gesture.view as? UIImageView else {
                return
            }
            
            let point = gesture.location(in: view)
            let imageRect = imageRect(from: view)
            
            if imageRect.contains(point) {
                if let color = getPixelColorAtPoint(point: point, sourceView: view) {
                    self.tappedCallback(color, point)
                }
            }
        }
        
        private func imageRect(from imageView: UIImageView) -> CGRect {
            let imageViewSize = imageView.frame.size
            let imgSize = imageView.image?.size
            
            guard let imageSize = imgSize else {
                return CGRect.zero
            }
            
            let scaleWidth = imageViewSize.width / imageSize.width
            let scaleHeight = imageViewSize.height / imageSize.height
            let aspect = fmin(scaleWidth, scaleHeight)
            
            var imageRect = CGRect(x: 0, y: 0, width: imageSize.width * aspect, height: imageSize.height * aspect)
            // Center image
            imageRect.origin.x = (imageViewSize.width - imageRect.size.width) / 2
            imageRect.origin.y = (imageViewSize.height - imageRect.size.height) / 2
            
            // Add imageView offset
            imageRect.origin.x += imageView.frame.origin.x
            imageRect.origin.y += imageView.frame.origin.y
            
            return imageRect
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
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.image = image.resizedImage(width: width, height: height)
        let gesture = UITapGestureRecognizer(target: context.coordinator,
                                             action: #selector(Coordinator.tapped))
        imageView.addGestureRecognizer(gesture)
        return imageView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {
        uiView.image = image.resizedImage(width: width, height: height)
    }
}

private extension UIImage {
    
    // resize to fit input size and keep aspect
    func resizedImage(width: CGFloat, height: CGFloat) -> UIImage? {
        let newWidth: CGFloat
        let newHeight: CGFloat
        
        if size.width > size.height {
            let scale = width / size.width
            newHeight = size.height * scale
            newWidth = width
        } else {
            let scale = height / size.height
            newWidth = size.width * scale
            newHeight = height
        }

        UIGraphicsBeginImageContext(.init(width: newWidth, height: newHeight))
        self.draw(in: .init(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
