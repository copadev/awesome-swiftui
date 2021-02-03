//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  CustomPicker.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 2/2/21.
//

import SwiftUI

// Credit to Malin Sundberg

struct ContentView: View {
    @State private var beverageSelection: HotBeverages = .latte
    var body: some View {
        NavigationView {
            Form {
                // The default picker which will display the picker options in a separate view
                Section(header: Text("Default Picker")) {
                    Picker("Selected beverage", selection: $beverageSelection) {
                        ForEach(HotBeverages.allCases, id: \.self) { option in
                            Text(option.rawValue.localizedCapitalized)
                        }
                    }
                }
                
                // Our custom implementation that displays the pickable options in a custom view
                Section(header: Text("Custom Picker")) {
                    NavigationLink(
                        destination: CustomPicker(beverageOptions: HotBeverages.allCases, selection: $beverageSelection),
                        label: {
                            HStack {
                                Text("Selected beverage")
                                Spacer()
                                Text(beverageSelection.rawValue.localizedCapitalized)
                                    .foregroundColor(.secondary)
                            }
                        })
                }
            }.navigationTitle("Picker Example")
        }
    }
}

struct CustomPicker: View {
    @Environment(\.presentationMode) var presentationMode
    let beverageOptions: [HotBeverages]
    @Binding var selection: HotBeverages
    var body: some View {
        // A list of all picker options
        List(beverageOptions) { beverageOption in
            Button {
                selection = beverageOption
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text(beverageOption.rawValue.localizedCapitalized)
                    Spacer()
                    if beverageOption == selection {
                        Image(systemName: "checkmark")
                            .foregroundColor(.accentColor)
                    }
                }.foregroundColor(.primary)
            }
        }
        // Apply our styling to the list of picker options
        .navigationTitle("Hot Beverages")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(GroupedListStyle())
    }
}

// An enum for our picker example with different beverage options
enum HotBeverages: String, Identifiable, CaseIterable {
    var id: String { rawValue }
    case espresso, americano, macchiato, gibraltar, cappuccino, latte, tea
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
