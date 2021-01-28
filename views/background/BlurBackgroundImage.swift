//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  BlurBackgroundImage.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 1/28/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("image-background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .blur(radius: 35, opaque: true)
            Text("Hello, CodePassion.dev 😜")
                .foregroundColor(.white)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
