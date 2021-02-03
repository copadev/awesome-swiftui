//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  PageTabView.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 1/27/21.
//  Credit to Kavsoft
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .yellow, .purple, .orange]
    @State var index: Int = 0
    var body: some View {
        TabView(selection: self.$index) {
            ForEach(0...5, id: \.self) { index in
                Image(systemName: "photo")
                    .resizable()
                    .frame(height: self.index == index ? 230 : 180)
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .foregroundColor(colors[index])
                    .tag(index)
            }
        }
        .frame(height: 230)
        .padding(.top, 35)
        .tabViewStyle(PageTabViewStyle())
        .animation(.easeOut)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
