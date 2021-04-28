# Image-Picker-for-SwiftUI

## A simple way to import images until Apple introduces a simpler way in SwiftUI

1. Drag-and-Drop the `ImagePicker.swift` file
2. Add these variables to you SwiftUI View:
```swift
@State var showImagePicker = false
@State var image: Data? = nil
```
3. Add a button that you would like to trigger the ImagePicker. Example:
```swift
Button(action: {showImagePicker = true}) {
     Text("Import Image")
}
```
4. Add this sheet and attach it to the button:
```swift
.sheet(isPresented: $showImagePicker) {
     ImagePicker(imageData: $image)
}
```
5. Done! Now, you can add this code to you SwiftUI View for an Image view:

 ```swift
 imageDataIntoImageView(imageData: $image) // Make sure to add the dollar sign
 ```

OR this to a place where you need to input a UIImage:
```swift 
imageDataIntoUIImage(imageData: yourImageData)
``` 

#### Example Project is in the Source code. [Download ImagePicker.swift Here.](https://github.com/savagegod22/Image-Picker-for-SwiftUI/releases/tag/v1.0) Or download everything, if you want.
```swift
var License = MIT // This means that the license is the MIT License
```
