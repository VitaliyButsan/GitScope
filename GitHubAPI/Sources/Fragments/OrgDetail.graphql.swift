// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct OrgDetail: GitHubAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment OrgDetail on Organization { __typename avatarUrl id isVerified name websiteUrl membersWithRole { __typename totalCount } repositories(first: 20, affiliations: [OWNER]) { __typename nodes { __typename primaryLanguage { __typename name } } totalCount } }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: any ApolloAPI.ParentType { GitHubAPI.Objects.Organization }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("avatarUrl", GitHubAPI.URI.self),
    .field("id", GitHubAPI.ID.self),
    .field("isVerified", Bool.self),
    .field("name", String?.self),
    .field("websiteUrl", GitHubAPI.URI?.self),
    .field("membersWithRole", MembersWithRole.self),
    .field("repositories", Repositories.self, arguments: [
      "first": 20,
      "affiliations": ["OWNER"]
    ]),
  ] }

  /// A URL pointing to the organization's public avatar.
  public var avatarUrl: GitHubAPI.URI { __data["avatarUrl"] }
  /// The Node ID of the Organization object
  public var id: GitHubAPI.ID { __data["id"] }
  /// Whether the organization has verified its profile email and website.
  public var isVerified: Bool { __data["isVerified"] }
  /// The organization's public profile name.
  public var name: String? { __data["name"] }
  /// The organization's public profile URL.
  public var websiteUrl: GitHubAPI.URI? { __data["websiteUrl"] }
  /// A list of users who are members of this organization.
  public var membersWithRole: MembersWithRole { __data["membersWithRole"] }
  /// A list of repositories that the user owns.
  public var repositories: Repositories { __data["repositories"] }

  /// MembersWithRole
  ///
  /// Parent Type: `OrganizationMemberConnection`
  public struct MembersWithRole: GitHubAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { GitHubAPI.Objects.OrganizationMemberConnection }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("totalCount", Int.self),
    ] }

    /// Identifies the total count of items in the connection.
    public var totalCount: Int { __data["totalCount"] }
  }

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
      ] }

      /// The primary language of the repository's code.
      public var primaryLanguage: PrimaryLanguage? { __data["primaryLanguage"] }

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
    }
  }
}
