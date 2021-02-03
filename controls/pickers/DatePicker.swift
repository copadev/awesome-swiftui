//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  DatePicker.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 2/3/21.
//  Credit to Sean Allen
//  https://youtu.be/wZinqpiAEiA
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate = Date()
    var body: some View {
        Form {
            Section(header: Text("Date Picker")) {
                DatePicker("Select", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
            }
            Section(header: Text("Hour & Minute Picker")) {
                DatePicker("Select", selection: $selectedDate, in: ...Date(), displayedComponents: .hourAndMinute)
            }
            Section(header: Text("Default Picker")) {
                DatePicker("Select", selection: $selectedDate)
            }
            Section(header: Text("Wheel Date Picker")) {
                DatePicker("Select", selection: $selectedDate)
                    .datePickerStyle(WheelDatePickerStyle())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
