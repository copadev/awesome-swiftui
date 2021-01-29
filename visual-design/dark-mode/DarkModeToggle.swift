//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  DarkModeToggle.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 9/17/20.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = self.colorScheme == .dark ? .light : .dark
                    }) {
                        Image(systemName: self.colorScheme == .dark ? "sun.max.fill" : "moon.fill")
                            .font(.system(size: 22))
                            .foregroundColor(.primary)
                    }
                }
                .padding(.horizontal, 8)
                Spacer()
                Text("Hello, CodePassion.dev 😜")
                    .padding()
                Spacer()
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}
