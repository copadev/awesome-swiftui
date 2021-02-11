//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  OpenLink.swift
//  Awesome-SwiftUI.
//
//  Created by Huy D. on 2/11/21.
//  Credit to Sean Allen
//  https://youtu.be/YL43vieArF8
//

import SwiftUI

struct ContentView: View {
    @State private var selectedColor: Color = .red
    var body: some View {
        VStack {
            Link(destination: URL(string: "https://codepassion.dev/")!, label: {
                Text("Go to CodePassion.dev")
                    .bold()
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(12)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
