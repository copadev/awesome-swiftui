//
//  ContentView.swift
//
//  Created by Huy D. on 9/2/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var input: String = ""
    var body: some View {
        VStack(spacing: 35) {
            TextField("Enter text here...", text: self.$input)
                .padding()
                .background(Color(.lightGray))
                .clipShape(Capsule())
            Button(action: {
                print("Button tapped")
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
            .opacity(self.input.isEmpty ? 0.35 : 1)
            .disabled(self.input.isEmpty ? true : false)
            Spacer()
        }
        .padding()
        .background(
            Color(.white)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    UIApplication.shared.windows.first?.rootViewController?.view.endEditing(true)
            }
        )
    }
}


