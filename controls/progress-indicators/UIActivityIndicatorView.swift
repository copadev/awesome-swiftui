//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  UIActivityIndicatorView.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 9/1/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

// MARK: - Using UIActivityIndicatorView in SwiftUI
struct Indicator: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) { }
    
}


// MARK: - How to use (demo)
struct ContentView: View {
    @State var timeRemaining = 5
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            if self.timeRemaining > 0 {
                Indicator()
                Text("\(timeRemaining)")
                    .onReceive(timer) { _ in
                        if self.timeRemaining > 0 {
                            self.timeRemaining -= 1
                        }
                    }
            } else {
                Text("Hello, CodePassion.dev 😜")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
