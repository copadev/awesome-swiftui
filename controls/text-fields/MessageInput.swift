//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  MessageInput.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 1/27/21.
//

import SwiftUI

struct ContentView: View {
    @State var inputText: String = ""
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 15) {
                HStack(spacing: 15) {
                    TextField("Message", text: self.$inputText)
                    Button(action: {
                        // Show ImagePicker...
                        print("Open ImagePicker...")
                    }, label: {
                        Image(systemName: "paperclip.circle.fill")
                            .font(.system(size: 22))
                            .foregroundColor(.gray)
                    })
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(Color.black.opacity(0.06))
                .clipShape(Capsule())
                if inputText != "" {
                    Button(action: {
                        withAnimation(.easeIn) {
                            // Call send message function...
                            print("Send message...")
                        }
                        self.inputText = ""
                        UIApplication.shared.windows.first?.rootViewController?.view.endEditing(true)
                    }, label: {
                        Image(systemName: "paperplane.fill")
                            .font(.system(size: 22))
                            .foregroundColor(.purple)
                            .rotationEffect(.init(degrees: 45))
                            .padding(.vertical, 12)
                            .padding(.leading, 12)
                            .padding(.trailing, 17)
                            .background(Color.black.opacity(0.07))
                            .clipShape(Circle())
                    })
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
