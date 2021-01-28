//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  UIVisualEffectView.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 1/28/21.
//

import SwiftUI

// MARK: - Using BlurView in SwiftUI
struct BlurView: UIViewRepresentable {
    
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView{
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) { }
    
}

// MARK: - How to use (demo)
struct ContentView: View {
    var body: some View {
        ZStack {
            // background
            Image("image-background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .blur(radius: 35, opaque: true)
            
            // using blur view
            ZStack {
                BlurView(style: .regular)
                Image("photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(.init(degrees: 5))
                    .padding(.all, 10)
            }
            .frame(width: 200, height: 250)
            .cornerRadius(15)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
