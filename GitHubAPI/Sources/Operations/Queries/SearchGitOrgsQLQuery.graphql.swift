// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SearchGitOrgsQLQuery: GraphQLQuery {
  public static let operationName: String = "SearchGitOrgsQL"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query SearchGitOrgsQL($withName: String!) { search(first: 10, query: $withName, type: USER) { __typename nodes { __typename ...OrgDetail } } rateLimit { __typename limit cost nodeCount remaining resetAt } }"#,
      fragments: [OrgDetail.self]
    ))

  public var withName: String

  public init(withName: String) {
    self.withName = withName
  }

  public var __variables: Variables? { ["withName": withName] }

  public struct Data: GitHubAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { GitHubAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("search", Search.self, arguments: [
        "first": 10,
        "query": .variable("withName"),
        "type": "USER"
      ]),
      .field("rateLimit", RateLimit?.self),
    ] }

    /// Perform a search across resources, returning a maximum of 1,000 results.
    public var search: Search { __data["search"] }
    /// The client's rate limit information.
    public var rateLimit: RateLimit? { __data["rateLimit"] }

    /// Search
    ///
    /// Parent Type: `SearchResultItemConnection`
    public struct Search: GitHubAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { GitHubAPI.Objects.SearchResultItemConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("nodes", [Node?]?.self),
      ] }

      /// A list of nodes.
      public var nodes: [Node?]? { __data["nodes"] }

      /// Search.Node
      ///
      /// Parent Type: `SearchResultItem`
      public struct Node: GitHubAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { GitHubAPI.Unions.SearchResultItem }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .inlineFragment(AsOrganization.self),
        ] }

        public var asOrganization: AsOrganization? { _asInlineFragment() }

        /// Search.Node.AsOrganization
        ///
        /// Parent Type: `Organization`
        public struct AsOrganization: GitHubAPI.InlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = SearchGitOrgsQLQuery.Data.Search.Node
          public static var __parentType: any ApolloAPI.ParentType { GitHubAPI.Objects.Organization }
          public static var __selections: [ApolloAPI.Selection] { [
            .fragment(OrgDetail.self),
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

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var orgDetail: OrgDetail { _toFragment() }
          }

          public typealias MembersWithRole = OrgDetail.MembersWithRole

          public typealias Repositories = OrgDetail.Repositories
        }
      }
    }

    /// RateLimit
    ///
    /// Parent Type: `RateLimit`
    public struct RateLimit: GitHubAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { GitHubAPI.Objects.RateLimit }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("limit", Int.self),
        .field("cost", Int.self),
        .field("nodeCount", Int.self),
        .field("remaining", Int.self),
        .field("resetAt", GitHubAPI.DateTime.self),
      ] }

      /// The maximum number of points the client is permitted to consume in a 60 minute window.
      public var limit: Int { __data["limit"] }
      /// The point cost for the current query counting against the rate limit.
      public var cost: Int { __data["cost"] }
      /// The maximum number of nodes this query may return
      public var nodeCount: Int { __data["nodeCount"] }
      /// The number of points remaining in the current rate limit window.
      public var remaining: Int { __data["remaining"] }
      /// The time at which the current rate limit window resets in UTC epoch seconds.
      public var resetAt: GitHubAPI.DateTime { __data["resetAt"] }
    }
  }
}
