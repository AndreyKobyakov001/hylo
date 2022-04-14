/// An in-flight diagnostic about an error that occured at compile time.
public struct Diag {

  /// The severity of a diagnostic.
  public enum Level {

    /// An error that does not prevent compilation.
    case warning

    /// An unrecoverable error that prevents compilation.
    case error

  }

  /// A diagnostic window, providing detailed explanation about an error.
  public struct Window {

    /// The source range highlighted in the window.
    public var range: SourceRange

    /// The text of the window, if any.
    public var text: String?

    /// Creates a new diagnostic window.
    public init(range: SourceRange, text: String? = nil) {
      self.text = text
      self.range = range
    }

  }

  /// The level of the diagnostic.
  public let level: Level

  /// The main description of the diagnostic.
  ///
  /// The message should be general and able to stand on its own.
  public let message: String

  /// The location at which the diagnostic should be reported.
  public var location: SourceLocation?

  /// The window of the diagnostic, if any.
  public var window: Window?

  /// The sub-diagnostics.
  public var children: [Diag]

  /// Creates a new diagnostic.
  public init(
    level: Level,
    message: String,
    location: SourceLocation? = nil,
    window: Window? = nil,
    children: [Diag] = []
  ) {
    self.level = level
    self.message = message
    self.location = location
    self.window = window
    self.children = children
  }

}