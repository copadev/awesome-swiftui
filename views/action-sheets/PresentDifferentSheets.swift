//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  PresentDifferentSheets.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 2/2/21.
//

import SwiftUI

// Credit to Malin Sundberg
// https://youtu.be/0MAc-hjvKqw

struct ContentView: View {
    // This enum defines the different sheets that can be displayed from this view
    private enum SheetType: String, Identifiable {
        var id: String { rawValue }
        case sheetOne, sheetTwo
    }
    
    @State private var sheetType: SheetType? = nil
    var body: some View {
        VStack {
            Button("Present Sheet 1️⃣") {
                sheetType = .sheetOne
            }.padding()
            Button("Present Sheet 2️⃣") {
                sheetType = .sheetTwo
            }.padding()
        }.sheet(item: $sheetType) { sheetType in
            // If sheetType is not nil, we will display a sheet
            // We'll use a switch case to determine which sheet we should display
            switch sheetType {
            case .sheetOne:
                SheetOne()
            case .sheetTwo:
                SheetTwo()
            }
        }
    }
}

struct SheetOne: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                Text("Sheet 1️⃣")
                    .font(.title)
                    .bold()
                Spacer()
            }.toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.cancellationAction) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct SheetTwo: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                Text("Sheet 2️⃣")
                    .font(.title)
                    .bold()
                Spacer()
            }.toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.cancellationAction) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
