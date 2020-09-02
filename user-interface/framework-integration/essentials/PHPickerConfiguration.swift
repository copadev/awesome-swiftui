//
//  PHPickerConfiguration.swift
//
//  Created by Huy D. on 7/23/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI
import PhotosUI

// MARK: - Using PHPickerConfiguration (Multiple Image Selection) in SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var images: [UIImage]
    @Binding var picker: Bool
    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 0
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            
            // close the picker
            parent.picker.toggle()
            
            for image in results {
                // check if image can be loaded?
                guard image.itemProvider.canLoadObject(ofClass: UIImage.self) else {
                    continue
                }
                // retreving selected image
                image.itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                    guard let image = image as? UIImage else {
                        print(error ?? "Undefined error")
                        return
                    }
                    self.parent.images.append(image)
                }
            }
        }
    }
}


// MARK: - How to use (demo)

struct ContentView: View {
    @State var images: [UIImage] = []
    @State var picker = false
    var body: some View {
        VStack {
            if !images.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(images, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width - 45, height: 250)
                                .cornerRadius(20)
                        }
                    }
                }
            } else {
                Button(action: {
                    self.picker.toggle()
                }) {
                    Text("Pick Image")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 35)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
            }
        }
        .sheet(isPresented: $picker, content: {
            ImagePicker(images: $images, picker: $picker)
        })
        
    }
}


