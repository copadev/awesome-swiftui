//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  TextEditorWithPlaceholderText.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 2/2/21.
//

import SwiftUI

// Credit to Malin Sundberg

struct ContentView: View {
    @State private var notes = ""
    var body: some View {
        Form {
            Section {
                // Using the TextEditor
                TextEditor(text: $notes)
                    .frame(height: 85)
            }
            Section {
                // Using a custom view with a placeholder text
                TextEditorWithPlaceholderText(placeholderText: "Placeholder...", enteredText: $notes)
                    .frame(height: 85)
            }
        }
    }
}

struct TextEditorWithPlaceholderText: View {
    var placeholderText: String
    @Binding var enteredText: String
    
    var body: some View {
        // Even though this project is an iOS only project, I wanted to highlight that this has to be
        // implemented slightly differently on iOS and macOS
        // On iOS, we need to add our placeholder as a background for the textEditor to still be tappable,
        // while on macOS, we need to add this as an overlay for the placeholder to be visible
        #if os(iOS)
        TextEditor(text: $enteredText)
            .background(placeholder())
        #elseif os(macOS)
        TextEditor(text: $enteredText)
            .overlay(placeholder())
        #endif
    }
    
    @ViewBuilder
    private func placeholder() -> some View {
        // We only want to display our placeholder text while there's no text entered in the textEditor
        if enteredText.isEmpty {
            HStack {
                VStack {
                    Text(placeholderText)
                        // We're adding some padding to align the text with the TextEditor's cursor
                        .padding(.leading, 4)
                        .padding(.top, 8)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                Spacer()
            }.allowsHitTesting(false) // We don't want the the overlay to block touch input of the TextEditor
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
