//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  ColorPicker.swift
//  Awesome-SwiftUI.
//
//  Created by Huy D. on 2/9/21.
//  Credit to Sean Allen
//  https://youtu.be/Kp9sHwp4wN8
//

import SwiftUI

struct ContentView: View {
    @State private var selectedColor: Color = .red
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(selectedColor)
                .frame(width: 200, height: 200)
                .padding()
            ColorPicker("Change Circle Color", selection: $selectedColor)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
