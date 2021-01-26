//
//  UITextView.swift
//
//  Created by Huy D. on 9/2/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

// MARK: - Using UITextView (MultilineTextField) in SwiftUI

struct MultilineTextField: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeCoordinator() -> Coordinator {
        return MultilineTextField.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.text = "Enter text..."
        view.textColor = .white
        view.font = .systemFont(ofSize: 18)
        view.backgroundColor = .clear
        view.returnKeyType = .done
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) { }
    
    class Coordinator: NSObject, UITextViewDelegate {
        
        var parent: MultilineTextField
        
        init(parent: MultilineTextField) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if parent.text.isEmpty {
                textView.text = "Enter text..."
            }
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if parent.text.isEmpty {
                textView.text = ""
            }
        }
        
    }
    
}


// MARK: - How to use (demo)

struct ContentView: View {
    @State var input: String = ""
    @State var height: CGFloat = 0
    var body: some View {
        VStack {
            MultilineTextField(text: self.$input)
                .padding()
                .background(Color(.lightGray))
                .cornerRadius(10)
            Button(action: {
                print("Button Tapped")
            }) {
                Text("Tap Here")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 40)
                    .background(Color.blue)
                    .clipShape(Capsule())
            }
            .padding(.top, 25)
            Spacer()
        }
        .background(
            Color(.white)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    UIApplication.shared.windows.first?.rootViewController?.view.endEditing(true)
            }
        )
            .padding(.horizontal)
            .padding(.bottom, self.height)
            .onAppear(perform: {
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (data) in
                    guard let info = data.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
                        return
                    }
                    withAnimation {
                        // remove bottom edge spacing
                        self.height = info.cgRectValue.height - (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0)
                    }
                }
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification, object: nil, queue: .main) { (_) in
                    self.height = 0
                }
            })
    }
    
    func isFilled() -> Bool {
        return self.input.isEmpty || self.input == "Enter text..."
    }
}


