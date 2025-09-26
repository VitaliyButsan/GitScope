// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct RepositoryDetail: GitHubAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment RepositoryDetail on Repository { __typename createdAt name nameWithOwner pushedAt owner { __typename login avatarUrl } primaryLanguage { __typename name } stargazers { __typename totalCount } watchers { __typename totalCount } }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: any ApolloAPI.ParentType { GitHubAPI.Objects.Repository }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("createdAt", GitHubAPI.DateTime.self),
    .field("name", String.self),
    .field("nameWithOwner", String.self),
    .field("pushedAt", GitHubAPI.DateTime?.self),
    .field("owner", Owner.self),
    .field("primaryLanguage", PrimaryLanguage?.self),
    .field("stargazers", Stargazers.self),
    .field("watchers", Watchers.self),
  ] }

  /// Identifies the date and time when the object was created.
  public var createdAt: GitHubAPI.DateTime { __data["createdAt"] }
  /// The name of the repository.
  public var name: String { __data["name"] }
  /// The repository's name with owner.
  public var nameWithOwner: String { __data["nameWithOwner"] }
  /// Identifies the date and time when the repository was last pushed to.
  public var pushedAt: GitHubAPI.DateTime? { __data["pushedAt"] }
  /// The User owner of the repository.
  public var owner: Owner { __data["owner"] }
  /// The primary language of the repository's code.
  public var primaryLanguage: PrimaryLanguage? { __data["primaryLanguage"] }
  /// A list of users who have starred this starrable.
  public var stargazers: Stargazers { __data["stargazers"] }
  /// A list of users watching the repository.
  public var watchers: Watchers { __data["watchers"] }

  /// Owner
  ///
  /// Parent Type: `RepositoryOwner`
  public struct Owner: GitHubAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { GitHubAPI.Interfaces.RepositoryOwner }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("login", String.self),
      .field("avatarUrl", GitHubAPI.URI.self),
    ] }

    /// The username used to login.
    public var login: String { __data["login"] }
    /// A URL pointing to the owner's public avatar.
    public var avatarUrl: GitHubAPI.URI { __data["avatarUrl"] }
  }

  /// PrimaryLanguage
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

  /// Stargazers
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

  /// Watchers
  ///
  /// Parent Type: `UserConnection`
  public struct Watchers: GitHubAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { GitHubAPI.Objects.UserConnection }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("totalCount", Int.self),
    ] }

    /// Identifies the total count of items in the connection.
    public var totalCount: Int { __data["totalCount"] }
  }
}
