/// A match expression.
public struct MatchExpr: Expr {

  /// A case in a match expression.
  public struct Case: SourceRepresentable, ScopeOutliner {

    public enum Body {

      /// An expression body.
      case expr(Expr)

      /// A block body.
      case block(BraceStmt)

    }

    var scopeID: ScopeID

    public var range: SourceRange?

    /// The pattern of the case.
    public var pattern: Pattern

    /// The condition of the case, if any.
    public var condition: Expr?

    /// The body of the case.
    public var body: Body

  }

  public var range: SourceRange?

  /// The subject of the match.
  public var subject: Expr

  /// The cases of the match.
  public var cases: [Case]

  public func accept<V: ExprVisitor>(_ visitor: inout V) -> V.Result {
    visitor.visit(match: self)
  }

}