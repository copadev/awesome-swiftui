//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  TabView-3.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 2/5/21.
//  Credit to Sean Allen
//  https://youtu.be/tnNFoZ7CkP8
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            CustomView(color: .red, text: "1")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            CustomView(color: .green, text: "2")
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            CustomView(color: .blue, text: "3")
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
        }
        .accentColor(.red)
    }
}

struct CustomView: View {
    var color: Color
    var text: String
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(color)
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .bold))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
