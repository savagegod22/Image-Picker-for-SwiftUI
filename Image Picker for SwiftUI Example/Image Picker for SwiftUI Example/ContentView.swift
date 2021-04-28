//
//  ContentView.swift
//  Image Picker for SwiftUI Example
//
//  Created by Aryan Sharma on 4/27/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var showImagePicker = false
    @State var image: Data? = nil
    
    var body: some View {
        VStack {
            Button(action: {showImagePicker = true}) { // The button that activates the sheet.
                Text("Import Image from Image Picker")
            }
            .sheet(isPresented: $showImagePicker) { // The sheet that comes up after pressing the import button that displays the library.
                ImagePicker(imageData: $image)
            }
            
            if let data = image { // Checks if var image is nil or not. This is optional, you only need it if you want to add a button after the user imports the image.
                imageDataIntoImageView(imageData: data)! // Displays Image by converting the image data safely into an Image view.
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5)
                    .padding()
                    .frame(width: 250.0, height: 250.0)
                
                Button(action: {image = nil}){ // Deletes the Image Data from the variable: image
                    Text("Remove Image")
                }
                
                // You can either do imageDataIntoImageView(imageData: yourImageData) for the SwiftUI Image View OR imageDataIntoUIImage(imageData: yourImageData) for a UIImage
            }
            
        }
        
        
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
