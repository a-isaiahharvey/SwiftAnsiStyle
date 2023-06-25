/// Represents different text styles for styling text in the terminal using ASCII escape codes.
public enum TextStyle: CustomStringConvertible, Equatable {
  case bold
  case dim
  case italic
  case underline
  case blink
  case inverse
  case hidden
  case strikethrough
  case overline
  case color(color: Color?)
  case bgColor(color: BGColor?)

  public var description: String {
    switch self {
    case .bold:
      return "1"
    case .dim:
      return "2"
    case .italic:
      return "3"
    case .underline:
      return "4"
    case .blink:
      return "5"
    case .inverse:
      return "7"
    case .hidden:
      return "8"
    case .strikethrough:
      return "9"
    case .overline:
      return "53"

    case .color(let color) where color != nil:
      return color!.description

    case .bgColor(let color) where color != nil:
      return color!.description

    default:
      return ""
    }
  }
}

extension TextStyle {
  /// Converts RGB color values to the corresponding ANSI 256-color code.
  ///
  /// - Parameters:
  ///   - red: The red component of the RGB color.
  ///   - green: The green component of the RGB color.
  ///   - blue: The blue component of the RGB color.
  /// - Returns: The ANSI 256-color code.
  public func rgbToAnsi(red: UInt8, green: UInt8, blue: UInt8) -> UInt8 {
    if red == green && green == blue {
      if red < 8 {
        return 16
      }

      if red > 248 {
        return 231
      }

      return UInt8((((Float(red) - 8.0) / 247.0) * 24.0) + 232.0)
    }

    return UInt8(
      16.0 + (36.0 * (Float(red) / 255.0 * 5.0))
        + (6.0 * (Float(green) / 255.0 * 5.0))
        + (Float(blue) / 255.0 * 5.0))
  }
}
