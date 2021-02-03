//
//  https://github.com/CodePassion-dev/awesome-swiftui
//  https://github.com/duonghominhhuy
//  CustomDismissalActionSheet.swift
//  Awesome-SwiftUI
//
//  Created by Huy D. on 2/3/21.
//

import SwiftUI

// Credit to Malin Sundberg
// https://youtu.be/0MAc-hjvKqw

struct ContentView: View {
    @State private var isSheetPresented = false
    // This is used for our custom implementation
    @State private var isSheetModal = false
    var body: some View {
        Button(action: {
            self.isSheetPresented = true
        }, label: {
            Text("Show Custom Behaviour Action Sheet")
        }).sheet(isPresented: $isSheetPresented, content: {
            // Here we create a custom view by passing it isSheetModal as a binding variable
            // and isSheetPresented, which we will used to dismiss CustomBehaviourSheet
            NavigationView {
                CustomBehaviourSheet(isModal: $isSheetModal, isPresented: $isSheetPresented)
            }
            // This is needed to prevent the interactive dismissal of the sheet
            // and ad our isModalInPresentation behaviour (https://developer.apple.com/documentation/uikit/uiviewcontroller/3229894-ismodalinpresentation)
            .presentation(isModal: isSheetModal)
            .onDisappear {
                // We're reseting our modal state on dismissal of the sheet
                isSheetModal = false
            }
        })
    }
}

struct CustomBehaviourSheet: View {
    @State private var favouriteCoffee: String = ""
    @Binding var isModal: Bool
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Form {
                TextField("Favourite Coffee", text: $favouriteCoffee)
            }
        }.toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.cancellationAction) {
                Button("Cancel") {
                    isPresented = false
                }
            }
            ToolbarItem(placement: ToolbarItemPlacement.primaryAction) {
                Button(action: {
                    // Here we would normally add logic to save the user input and then dismiss the view
                    isPresented = false
                }, label: {
                    Text("Save")
                }).disabled(favouriteCoffee.isEmpty)
            }
        }.navigationTitle("Custom Presentation")
        .onChange(of: calculateModalState()) { shouldBeModal in
            // We set our binding isModal variable here to enforce the behaviour that we want for
            // the interactive dismissal from the presenting view (in the ModalPresentationExample view)
            // If isModal is true, it means that we don't allow for interactive dismissal
            isModal = shouldBeModal
        }
    }
    
    private func calculateModalState() -> Bool {
        // If there's text entered to the TextField, we don't allow for interactive dismissal
        // If we would have multiple text fields in this view, we would check if any of them have text in them to determine this state
        !favouriteCoffee.isEmpty
    }
}

struct ModalView<T: View>: UIViewControllerRepresentable {
    let view: T
    let isModal: Bool
    let onDismissalAttempt: (()->())?
    
    // Here we set up our UIKit components
    func makeUIViewController(context: Context) -> UIHostingController<T> {
        UIHostingController(rootView: view)
    }
    
    func updateUIViewController(_ uiViewController: UIHostingController<T>, context: Context) {
        uiViewController.parent?.presentationController?.delegate = context.coordinator
        uiViewController.rootView = view
        context.coordinator.modalView = self
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIAdaptivePresentationControllerDelegate {
        var modalView: ModalView
        
        init(_ modalView: ModalView) {
            self.modalView = modalView
        }
        
        func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
            // This simulates the UIKit isModalInPresentation behaviour
            // (https://developer.apple.com/documentation/uikit/uiviewcontroller/3229894-ismodalinpresentation)
            // If isModal is true, it indicates that the view should not be dismissed
            !modalView.isModal
        }
        
        func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
            modalView.onDismissalAttempt?()
        }
    }
}

extension View {
    func presentation(isModal: Bool, onDismissalAttempt: (()->())? = nil) -> some View {
        // Here we create a wrapper ModalView which displays the view, and determines whether or not the view can be interactively dismissed based on isModal
        ModalView(view: self, isModal: isModal, onDismissalAttempt: onDismissalAttempt)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
