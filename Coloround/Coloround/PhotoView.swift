//
//  PhotoView.swift
//  Coloround
//
//  Created by Marco Scaglione on 20/11/21.
//
import SwiftUI

struct PhotoView: View {
    
    @State var image: Image? = nil
    @State var showCaptureImageView : Bool = false
    
    var body: some View {
        ZStack {
          VStack {
            Button(action: {
              self.showCaptureImageView.toggle()
            }) {
              Text("Choose photos")
            }
            image?.resizable()
              .frame(width: 250, height: 200)
              .clipShape(Circle())
              .overlay(Circle().stroke(Color.white, lineWidth: 4))
              .shadow(radius: 10)
          }
          if (showCaptureImageView) {
            CaptureImageView(isShown: $showCaptureImageView, image: $image)
          }
        }
      }

struct CaptureImageView {
  /// TODO 2: Implement other things later
}
extension CaptureImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<CaptureImageView>) {
        
    }
}
