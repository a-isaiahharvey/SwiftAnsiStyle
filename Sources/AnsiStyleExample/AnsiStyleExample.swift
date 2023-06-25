import AnsiStyle

@main
struct App {
  static func main() {
    // You can either color the text directly with the Color enumeration

    print("\(Color.cyan.open())Cyan colored \"Hello World!\"\(Color.cyan.close())")

    let styler = TextStyler(styles: [.color(color: .red), .strikethrough])

    print("\(styler.stylize(text:"Hello World in red with strikethrough"))")

    print("This is in red: \(Color.red.paint(text: "a red string"))")

    print("Here's a \(BGColor.red.paint(text: "background")) that's red.")

  }
}
