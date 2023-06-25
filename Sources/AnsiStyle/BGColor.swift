/// Represents different background colors for styling text in the terminal using ASCII escape codes.
public enum BGColor: CustomStringConvertible, Equatable {
  case black
  case red
  case green
  case yellow
  case blue
  case magenta
  case cyan
  case white
  case blackBright
  case redBright
  case greenBright
  case yellowBright
  case blueBright
  case magentaBright
  case cyanBright
  case whiteBright
  case ansi256(UInt8)
  case rgb(red: UInt8, green: UInt8, blue: UInt8)

  public var description: String {
    switch self {
    case .black:
      return "40"
    case .red:
      return "41"
    case .green:
      return "42"
    case .yellow:
      return "43"
    case .blue:
      return "44"
    case .magenta:
      return "45"
    case .cyan:
      return "46"
    case .white:
      return "47"

    case .blackBright:
      return "100"
    case .redBright:
      return "101"
    case .greenBright:
      return "102"
    case .yellowBright:
      return "103"
    case .blueBright:
      return "104"
    case .magentaBright:
      return "105"
    case .cyanBright:
      return "106"
    case .whiteBright:
      return "107"
    case .ansi256(let color):
      return "45;5;\(color)"
    case .rgb(let red, let green, let blue):
      return "48;2;\(red);\(green);\(blue)"
    }
  }
}

extension BGColor {
  /// Closes the background color styling.
  ///
  /// - Returns: The ASCII escape code to close the background color.
  public func close() -> String {
    "\u{1B}[49m"
  }

  /// Opens the background color styling.
  ///
  /// - Returns: The ASCII escape code to open the background color.
  public func open() -> String {
    "\u{1B}[\(self)m"
  }

  /// Applies the background color to the given text.
  ///
  /// - Parameter text: The text to be styled.
  /// - Returns: The stylized text with the background color applied.
  public func paint(text: String) -> String {
    "\(open())\(text)\(close())"
  }
}
