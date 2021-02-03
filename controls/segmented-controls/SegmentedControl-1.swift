//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  Awesome-SwiftUI
//  SegmentedControl-1.swift
//
//  Created by Huy D. on 1/29/21.
//  Credit to Kavsoft.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    var body: some View {
        VStack {
            HStack {
                Text("CodePassion.dev")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                Spacer()
            }
            .padding(.horizontal)
            HStack(spacing: 0) {
                Text("Day")
                    .foregroundColor(self.index == 0 ? .white : Color.purple.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color.purple.opacity(self.index == 0 ? 1: 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 0
                        }
                    }
                Spacer(minLength: 0)
                Text("Week")
                    .foregroundColor(self.index == 1 ? .white : Color.purple.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color.purple.opacity(self.index == 1 ? 1: 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 1
                        }
                    }
                Spacer(minLength: 0)
                Text("Month")
                    .foregroundColor(self.index == 2 ? .white : Color.purple.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color.purple.opacity(self.index == 2 ? 1: 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 2
                        }
                    }
            }
            .background(Color.black.opacity(0.06))
            .clipShape(Capsule())
            .padding(.horizontal)
            .padding(.top, 25)
            TabView(selection: self.$index) {
                Text("Daily Tab")
                    .tag(0)
                Text("Weekly Tab")
                    .tag(1)
                Text("Montly Tab")
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            Spacer()
        }
        .padding(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
