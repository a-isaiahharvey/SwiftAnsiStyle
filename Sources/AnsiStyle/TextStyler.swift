/// A struct for applying styles to text using ASCII escape codes.
public struct TextStyler: CustomStringConvertible {
  /// The styles to be applied.
  var styles: [TextStyle]

  /// The buffer storing the configuration of styles.
  var buffer = ""

  /// Initializes a `Styler` instance with the specified styles.
  ///
  /// - Parameter styles: The styles to be applied.
  public init(styles: [TextStyle]) {
    self.styles = styles
    configureStyle()
  }

  /// Applies the configured styles to the given text.
  ///
  /// - Parameter text: The text to be stylized.
  /// - Returns: The stylized text with the configured styles applied.
  public func stylize(text: String) -> String {
    "\(self)\(text)\(reset())"
  }

  /// Resets all styles and returns the ASCII escape code for resetting text styles.
  ///
  /// - Returns: The ASCII escape code for resetting text styles.
  public func reset() -> String {
    "\u{1B}[0m"
  }

  /// Configures the style settings based on the specified styles.
  mutating func configureStyle() {
    if styles.isEmpty {
      self.buffer = ""
      return
    }

    var buffer = ""

    buffer += "\u{1B}["

    var written = false

    let writeStyle: (TextStyle) -> Void = { style in
      if written {
        buffer.append(";")
      }
      written = true
      buffer.append("\(style)")
    }

    if styles.contains(.bold) {
      writeStyle(.bold)
    }

    if styles.contains(.dim) {
      writeStyle(.dim)
    }

    if styles.contains(.italic) {
      writeStyle(.italic)
    }

    if styles.contains(.underline) {
      writeStyle(.underline)
    }

    if styles.contains(.blink) {
      writeStyle(.blink)
    }

    if styles.contains(.inverse) {
      writeStyle(.inverse)
    }

    if styles.contains(.hidden) {
      writeStyle(.hidden)
    }

    if styles.contains(.strikethrough) {
      writeStyle(.strikethrough)
    }

    if styles.contains(.overline) {
      buffer.append(contentsOf: "53")
    }

    for style in styles {
      if case .bgColor(let color) = style {
        if written {
          buffer.append(contentsOf: ";\(color!)")
        } else {
          buffer.append("\(color!)")
        }
      }

      if case .color(let color) = style {
        if written {
          buffer.append(contentsOf: ";\(color!)")
        } else {
          buffer.append("\(color!)")
        }
      }
    }

    buffer.append("m")
    self.buffer = buffer
  }

  public var description: String {
    return self.buffer
  }
}
