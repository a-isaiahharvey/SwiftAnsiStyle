/// Represents different text colors for styling text in the terminal using ASCII escape codes.
public enum Color: CustomStringConvertible, Equatable {
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
      return "30"
    case .red:
      return "31"
    case .green:
      return "32"
    case .yellow:
      return "33"
    case .blue:
      return "34"
    case .magenta:
      return "35"
    case .cyan:
      return "36"
    case .white:
      return "37"

    case .blackBright:
      return "90"
    case .redBright:
      return "91"
    case .greenBright:
      return "92"
    case .yellowBright:
      return "93"
    case .blueBright:
      return "94"
    case .magentaBright:
      return "95"
    case .cyanBright:
      return "96"
    case .whiteBright:
      return "97"
    case .ansi256(let color):
      return "38;5;\(color)"
    case .rgb(let red, let green, let blue):
      return "38;2;\(red);\(green);\(blue)"
    }
  }

}

extension Color {
  /// Closes the text color styling.
  ///
  /// - Returns: The ASCII escape code to close the text color.
  public func close() -> String {
    "\u{1B}[39m"
  }

  /// Opens the text color styling.
  ///
  /// - Returns: The ASCII escape code to open the text color.
  public func open() -> String {
    "\u{1B}[\(self)m"
  }

  /// Applies the text color to the given text.
  ///
  /// - Parameter text: The text to be styled.
  /// - Returns: The stylized text with the text color applied.
  public func paint(text: String) -> String {
    "\(open())\(text)\(close())"
  }
}
