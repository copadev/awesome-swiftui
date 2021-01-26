//
//  SegmentedPickerStyle.swift
//  CodePassion
//
//  Created by Huy D. on 11/29/20.
//

import SwiftUI

struct ContentView: View {
    @State private var viewIndex = 0
    var body: some View {
        VStack {
            Picker(selection: $viewIndex, label: Text("")) {
                Text("First Tab").tag(0)
                Text("Second Tab").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            Spacer()
            if viewIndex == 0 {
                Text("First Tab Content")
                    .foregroundColor(.red)
            } else if viewIndex == 1 {
                Text("Second Tab Content")
                    .foregroundColor(.blue)
            }
            Spacer()
        }
    }
}
