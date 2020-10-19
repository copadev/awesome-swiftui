# Awesome SwiftUI

- A list of awesome [SwiftUI Framework](https://developer.apple.com/documentation/swiftui) collection. 

![Awesome SwiftUI](assets/banner.png)

[![Platform](https://img.shields.io/badge/platform-iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS-red.svg)](https://developer.apple.com/xcode/swiftui/)
[![Version](http://img.shields.io/badge/version-2.0-green.svg?style=flat)](https://github.com/CodePassion-dev/awesome-swiftui)
[![PRs](https://img.shields.io/badge/PRs-welcome-teal.svg)](https://github.com/CodePassion-dev/awesome-swiftui/pulls)
[![Website](https://img.shields.io/badge/Website-codepassion.dev-yellow.svg)](https://codepassion.dev)
[![Twitter](https://img.shields.io/badge/twitter-@duonghominhhuy-blue.svg?style=flat)](http://twitter.com/duonghominhhuy)

# User Interface

### [Views and Controls](https://github.com/CodePassion-dev/awesome-swiftui/blob/master/user-interface/views-and-controls)

**Dismiss Keyboard When Tap Outside** | **Coming soon...**     | **Coming soon...**
:--:|:--:|:--:|
[![DismissKeyboardWhenTapOutside](preview/DismissKeyboardWhenTapOutside.gif)](https://github.com/CodePassion-dev/awesome-swiftui/blob/master/user-interface/views-and-controls/text/DismissKeyboardWhenTapOutside.swift) | ![UIActivityIndicatorView](preview/UIActivityIndicatorView.gif) | ![UIActivityIndicatorView](preview/UIActivityIndicatorView.gif)
**Coming soon...** | **Coming soon...**
![UIActivityIndicatorView](preview/UIActivityIndicatorView.gif) | ![UIActivityIndicatorView](preview/UIActivityIndicatorView.gif) |

- Essentials
    - [ ] View
    - [ ] Creating and Combining Views
    - [ ] Working with UI Controls
- Text
    - [ ] Text
    - [x] TextField
    - [ ] SecureField
    - [ ] TextEditor
- Images
    - [x] Images
- Buttons
    - [ ] Button
    - [ ] NavigationLink
    - [ ] EditButton
    - [ ] PasteButton
    - [ ] SignInWithAppleButton
    - [ ] Menu
- Value Selectors
    - [ ] Toggle
    - [ ] Picker
    - [ ] DatePicker
    - [ ] Slider
    - [ ] Stepper
    - [ ] ColorPicker
- Value Indicators
    - [ ] ProgressView
    - [ ] Gauge
    - [ ] Label
    - [ ] Link
- Fonts and Localization
    - [ ] Font
    - [ ] ScaledMetric
    - [ ] LocalizedStringKey

### [View Layout and Presentation](https://github.com/CodePassion-dev/awesome-swiftui/blob/master/user-interface/view-layout-and-presentation)

- Essentials
    - [ ] Building Lists and Navigation
    - [ ] Composing Complex Interfaces
- Stacks
    - [ ] HStack
    - [ ] VStack
    - [ ] ZStack
    - [ ] LazyHStack
    - [ ] LazyVStack
- Grids
    - [ ] LazyHGrid
    - [ ] LazyVGrid
    - [ ] GridItem
- Lists and Scroll Views
    - [ ] List
    - [ ] ForEach
    - [ ] ScrollView
    - [ ] ScrollViewReader
    - [ ] ScrollViewProxy
    - [ ] DynamicViewContent
    - [ ] Axis
- Container Views
    - [ ] Form
    - [ ] Group
    - [ ] GroupBox
    - [ ] Section
- Hierarchical Views
    - [ ] OutlineGroup
    - [ ] DisclosureGroup
- Spacers and Dividers
    - [ ] Spacer
    - [ ] Divider
- Architectural Views
    - [ ] NavigationView
    - [x] TabView
    - [ ] HSplitView
    - [ ] VSplitView
- Presentations
    - [ ] Alert
    - [ ] ActionSheet
- Conditionally Visible Items
    - [ ] EmptyView
    - [ ] EquatableView
- Infrequently Used Views
    - [ ] AnyView
    - [ ]  TupleView
    
### [Drawing and Animation](https://github.com/CodePassion-dev/awesome-swiftui/blob/master/user-interface/drawing-and-animation)

- Essentials
    - [ ] Drawing Paths and Shapes
    - [ ] Building Custom Views in SwiftUI
    - [x] Shape
- Animation
    - [ ] Animating Views and Transitions
    - [ ] Animation
    - [ ] Animatable
    - [ ] AnimatableModifier
    - [ ] withAnimation(_:_:)
    - [ ] AnimatablePair
    - [ ] EmptyAnimatableData
    - [ ] AnyTransition
- Shapes
    - [ ] Rectangle
    - [ ] Edge
    - [ ] RoundedRectangle
    - [ ] Circle
    - [ ] Ellipse
    - [ ] Capsule
    - [ ] Path
- Transformed Shapes
    - [ ] InsettableShape
    - [ ] ScaledShape
    - [ ] RotatedShape
    - [ ] OffsetShape
    - [ ] TransformedShape
    - [ ] ContainerRelativeShape
- Paints, Styles, and Gradients
    - [ ] Color
    - [ ] ImagePaint
    - [ ] Gradient
    - [ ] LinearGradient
    - [ ] AngularGradient
    - [ ] RadialGradient
    - [ ] ForegroundStyle
    - [ ] FillStyle
    - [ ] BackgroundStyle
    - [ ] ShapeStyle
    - [ ] RoundedCornerStyle
    - [ ] SelectionShapeStyle
    - [ ] SeparatorShapeStyle
    - [ ] StrokeStyle
- Geometry
    - [ ] GeometryProxy
    - [ ] GeometryReader
    - [ ] GeometryEffect
    - [ ] Angle
    - [ ] Anchor
    - [ ] UnitPoint
    - [ ] CoordinateSpace
    - [ ] ProjectionTransform
    - [ ] ProjectionTransform

### [Framework Integration](https://github.com/CodePassion-dev/awesome-swiftui/blob/master/user-interface/framework-integration)

- Essentials
    - [x] Interfacing with UIKit
    - [ ] Creating a watchOS App
- AppKit Hosting
    - [ ] NSHostingController
    - [ ] NSHostingView
    - [ ] NSViewControllerRepresentable
    - [ ] NSViewRepresentable
    - [ ] NSApplicationDelegateAdaptor
- UIKit Hosting
    - [ ] UIHostingController
    - [ ] UIViewControllerRepresentable
    - [ ] UIViewRepresentable
    - [ ] UIApplicationDelegateAdaptor
- WatchKit Hosting
    - [ ] WKHostingController
    - [ ] WKUserNotificationHostingController
    - [ ] WKInterfaceObjectRepresentable
    - [ ] DigitalCrownRotationalSensitivity
    - [ ] WKExtensionDelegateAdaptor

# Data and Events

### [State and Data Flow](https://github.com/CodePassion-dev/awesome-swiftui/blob/master/data-and-events/state-and-data-flow)

- Essentials
    - [ ] Handling User Input
    - [ ] Binding
- View State
    - [ ] Managing User Interface State
    - [ ] State
- Model Data
    - [ ] Managing Model Data in Your App
    - [ ] ObservedObject
    - [ ] EnvironmentObject
    - [ ] StateObject
    - [ ] ObservableObject
- Focused View State
    - [ ] FocusedBinding
    - [ ] FocusedValue
    - [ ] FocusedValues
    - [ ] FocusedValueKey
- Environment Data
    - [x] Environment
    - [ ] EnvironmentValues
- View Preferences
    - [ ] PreferenceKey
- Persistent Storage
    - [ ] AppStorage
    - [ ] SceneStorage
    - [ ] FetchRequest
    - [ ] FetchedResults
- Change Management
    - [ ] Transaction
    - [ ] DynamicProperty

### [Gestures](https://github.com/CodePassion-dev/awesome-swiftui/blob/master/data-and-events/gestures)

- Basic Gestures
    - [ ] Adding Interactivity with Gestures
    - [ ] TapGesture
    - [ ] LongPressGesture
    - [ ] DragGesture
    - [ ] MagnificationGesture
    - [ ] RotationGesture
- Combined Gestures
    - [ ] Composing SwiftUI Gestures
    - [ ] SequenceGesture
    - [ ]  SimultaneousGesture
    - [ ] ExclusiveGesture
- Custom Gestures
    - [ ] Gesture
    - [ ] AnyGesture
- Dynamic View Properties
    - [ ] GestureState
    - [ ] GestureStateGesture
- Gesture Support
    - [ ] GestureMask

# Previews in Xcode

### [Previews](https://github.com/CodePassion-dev/awesome-swiftui/blob/master/previews-in-xcode/previews)

- Preview Creation
    - [x] PreviewProvider
- Preview Customization
    - [ ] PreviewDevice
    - [ ] PreviewPlatform
    - [ ] PreviewLayout
- Preview Contexts
    - [ ] PreviewContext

# Find me on:

- [GitHub](https://github.com/duonghominhhuy) and [Twitter](https://twitter.com/duonghominhhuy)
- Website: [https://codepassion.dev](https://codepassion.dev)
- Facebook: [https://fb.com/codepassion.dev](https://www.facebook.com/codepassion.dev)


