// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct UserDetail: GitHubAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment UserDetail on User { __typename avatarUrl company createdAt login repositories(first: 30, ownerAffiliations: [OWNER]) { __typename nodes { __typename primaryLanguage { __typename name } stargazers { __typename totalCount } } totalCount } }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: any ApolloAPI.ParentType { GitHubAPI.Objects.User }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("avatarUrl", GitHubAPI.URI.self),
    .field("company", String?.self),
    .field("createdAt", GitHubAPI.DateTime.self),
    .field("login", String.self),
    .field("repositories", Repositories.self, arguments: [
      "first": 30,
      "ownerAffiliations": ["OWNER"]
    ]),
  ] }

  /// A URL pointing to the user's public avatar.
  public var avatarUrl: GitHubAPI.URI { __data["avatarUrl"] }
  /// The user's public profile company.
  public var company: String? { __data["company"] }
  /// Identifies the date and time when the object was created.
  public var createdAt: GitHubAPI.DateTime { __data["createdAt"] }
  /// The username used to login.
  public var login: String { __data["login"] }
  /// A list of repositories that the user owns.
  public var repositories: Repositories { __data["repositories"] }

  /// Repositories
  ///
  /// Parent Type: `RepositoryConnection`
  public struct Repositories: GitHubAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { GitHubAPI.Objects.RepositoryConnection }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("nodes", [Node?]?.self),
      .field("totalCount", Int.self),
    ] }

    /// A list of nodes.
    public var nodes: [Node?]? { __data["nodes"] }
    /// Identifies the total count of items in the connection.
    public var totalCount: Int { __data["totalCount"] }

    /// Repositories.Node
    ///
    /// Parent Type: `Repository`
    public struct Node: GitHubAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { GitHubAPI.Objects.Repository }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("primaryLanguage", PrimaryLanguage?.self),
        .field("stargazers", Stargazers.self),
      ] }

      /// The primary language of the repository's code.
      public var primaryLanguage: PrimaryLanguage? { __data["primaryLanguage"] }
      /// A list of users who have starred this starrable.
      public var stargazers: Stargazers { __data["stargazers"] }

      /// Repositories.Node.PrimaryLanguage
      ///
      /// Parent Type: `Language`
      public struct PrimaryLanguage: GitHubAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { GitHubAPI.Objects.Language }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String.self),
        ] }

        /// The name of the current language.
        public var name: String { __data["name"] }
      }

      /// Repositories.Node.Stargazers
      ///
      /// Parent Type: `StargazerConnection`
      public struct Stargazers: GitHubAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { GitHubAPI.Objects.StargazerConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("totalCount", Int.self),
        ] }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int { __data["totalCount"] }
      }
    }
  }
}
