//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  NavigationBar-2.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 1/31/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Button { } label: {
                    Image(systemName: "filemenu.and.selection")
                        .font(.system(size: 25))
                }
                Text("CodePassion.dev")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer(minLength: 0)
                Button { } label: {
                    Image(systemName: "bell.badge")
                        .font(.system(size: 25))
                }
            }
            .foregroundColor(.black)
            .padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
