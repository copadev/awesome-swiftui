//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  UITextView.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 1/28/21.
//  Credit to Kavsoft.
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
    }
    
    func isFilled() -> Bool {
        return self.input.isEmpty || self.input == "Enter text..."
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
