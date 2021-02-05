//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  ProgressView.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 2/4/21.
//  Credit to Sean Allen
//  https://youtu.be/2Jk58S6FiZw
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    var body: some View {
        ZStack {
            Color(.red)
                .ignoresSafeArea()
            Text("Hello, CodePassion.dev 😜")
                .foregroundColor(.white)
            if isLoading {
                ZStack {
                    Color(.black)
                        .ignoresSafeArea()
                        .opacity(0.35)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(3)
                }
            }
        }
        .onAppear {
            self.fakeNetworkCall()
        }
    }
    
    private func fakeNetworkCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLoading = false
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
