# AnsiStyle

AnsiStyle is a Swift library that provides a convenient way to style text in the terminal using ASCII escape codes. It offers options to apply different text colors, background colors, and text styles to enhance the appearance of text output in command-line interfaces.

## Features

- Apply various text colors and background colors to text.
- Style text with bold, italic, underline, and other text styles.
- Support for ANSI 256-color codes and RGB color values.
- Easy-to-use API for applying styles to text.

## Requirements

- Swift 5.8+
- Compatible with macOS, Linux, and other platforms that support Swift.

## Installation

You can integrate AnsiStyle into your project using Swift Package Manager (SPM). Simply add it as a dependency in your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/martial-plains/swift-ansi-style.git", branch: "main")
]
```

## Usage

1. Import the TerminalStyler module in your Swift file:

```swift
import AnsiStyle
```

2. Create a `TextStyler` instance with the desired styles:

```swift
let styler = TextStyler(styles: [.color(color: .red), .bgColor(color: .white), .bold])
```

3. Apply the styles to the desired text:

```swift
let stylizedText = styler.stylize(text: "Hello, Terminal!")
print(stylizedText)
```

The output will display the text "Hello, Terminal!" with red color, white background, and bold style.

## License

AnsiStyle is released under the MIT License.
