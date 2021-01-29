//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  UIImagePickerController.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 9/2/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

// MARK: - Using UIImagePickerController in SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(parent: self)
    }
    
    @Binding var showPicker: Bool
    @Binding var imageData: Data
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.parent.showPicker.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let imgData = info[.originalImage] as? UIImage,
                  let jpegData = imgData.jpegData(compressionQuality: 0.5) else { return }
            parent.imageData = jpegData
            self.parent.showPicker.toggle()
        }
        
    }
    
}

// MARK: - How to use (demo)

struct ContentView: View {
    @State var image: Data = Data()
    @State var showImagePicker: Bool = false
    var body: some View {
        Button(action: {
            self.showImagePicker.toggle()
        }) {
            ZStack {
                if self.image.count == 0 {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.darkGray))
                    Image(systemName: "plus")
                        .font(.system(size: 24, weight: .bold))
                } else {
                    Image(uiImage: UIImage(data: self.image)!)
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 150)
                        .cornerRadius(10)
                }
            }
            .frame(width: 200, height: 150)
        }
        .sheet(isPresented: self.$showImagePicker) {
            ImagePicker(showPicker: self.$showImagePicker, imageData: self.$image)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
