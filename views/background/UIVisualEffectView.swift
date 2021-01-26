//
//  UIVisualEffectView.swift
//
//  Created by Huy D. on 9/3/20.
//  Copyright © 2020 Huy D. All rights reserved.
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


