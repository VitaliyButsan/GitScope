// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SearchGitReposQLQuery: GraphQLQuery {
  public static let operationName: String = "SearchGitReposQL"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query SearchGitReposQL($withName: String!) { search(first: 50, query: $withName, type: REPOSITORY) { __typename repositoryCount nodes { __typename ...RepositoryDetail } } rateLimit { __typename limit cost nodeCount remaining resetAt } }"#,
      fragments: [RepositoryDetail.self]
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
        "first": 50,
        "query": .variable("withName"),
        "type": "REPOSITORY"
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
        .field("repositoryCount", Int.self),
        .field("nodes", [Node?]?.self),
      ] }

      /// The total number of repositories that matched the search query. Regardless of
      /// the total number of matches, a maximum of 1,000 results will be available
      /// across all types.
      public var repositoryCount: Int { __data["repositoryCount"] }
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
          .inlineFragment(AsRepository.self),
        ] }

        public var asRepository: AsRepository? { _asInlineFragment() }

        /// Search.Node.AsRepository
        ///
        /// Parent Type: `Repository`
        public struct AsRepository: GitHubAPI.InlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = SearchGitReposQLQuery.Data.Search.Node
          public static var __parentType: any ApolloAPI.ParentType { GitHubAPI.Objects.Repository }
          public static var __selections: [ApolloAPI.Selection] { [
            .fragment(RepositoryDetail.self),
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

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var repositoryDetail: RepositoryDetail { _toFragment() }
          }

          public typealias Owner = RepositoryDetail.Owner

          public typealias PrimaryLanguage = RepositoryDetail.PrimaryLanguage

          public typealias Stargazers = RepositoryDetail.Stargazers

          public typealias Watchers = RepositoryDetail.Watchers
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
