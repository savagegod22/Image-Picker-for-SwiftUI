//
//  ImagePicker.swift
//  HypedList
//
//  Created by Aryan Sharma on 4/27/21.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var imageData: Data?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.imageData = image.pngData()
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

func imageDataIntoImageView(imageData: Data?) -> Image? {
    if let data = imageData {
        if let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage)
        }
    }
    return nil
}

func imageDataIntoUIImage(imageData: Data?) -> UIImage? {
    if let data = imageData {
        if let uiImage = UIImage(data: data) {
            return uiImage
        }
    }
    return nil
}
