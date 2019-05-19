//  This file was automatically generated and should not be edited.

import Apollo

public final class GetRepoQlQuery: GraphQLQuery {
  public let operationDefinition =
    "query GetRepoQL($name: String!, $owner: String!) {\n  repository(name: $name, owner: $owner) {\n    __typename\n    name\n    createdAt\n  }\n}"

  public var name: String
  public var owner: String

  public init(name: String, owner: String) {
    self.name = name
    self.owner = owner
  }

  public var variables: GraphQLMap? {
    return ["name": name, "owner": owner]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("repository", arguments: ["name": GraphQLVariable("name"), "owner": GraphQLVariable("owner")], type: .object(Repository.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(repository: Repository? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "repository": repository.flatMap { (value: Repository) -> ResultMap in value.resultMap }])
    }

    /// Lookup a given repository by the owner and repository name.
    public var repository: Repository? {
      get {
        return (resultMap["repository"] as? ResultMap).flatMap { Repository(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "repository")
      }
    }

    public struct Repository: GraphQLSelectionSet {
      public static let possibleTypes = ["Repository"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, createdAt: String) {
        self.init(unsafeResultMap: ["__typename": "Repository", "name": name, "createdAt": createdAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The name of the repository.
      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// Identifies the date and time when the object was created.
      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }
    }
  }
}

public final class GetUserQlQuery: GraphQLQuery {
  public let operationDefinition =
    "query GetUserQL($login: String!) {\n  user(login: $login) {\n    __typename\n    login\n    company\n    repositories(first: 3) {\n      __typename\n      nodes {\n        __typename\n        name\n        createdAt\n      }\n      totalDiskUsage\n    }\n    avatarUrl\n  }\n}"

  public var login: String

  public init(login: String) {
    self.login = login
  }

  public var variables: GraphQLMap? {
    return ["login": login]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("user", arguments: ["login": GraphQLVariable("login")], type: .object(User.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
    }

    /// Lookup a user by login.
    public var user: User? {
      get {
        return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("login", type: .nonNull(.scalar(String.self))),
        GraphQLField("company", type: .scalar(String.self)),
        GraphQLField("repositories", arguments: ["first": 3], type: .nonNull(.object(Repository.selections))),
        GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(login: String, company: String? = nil, repositories: Repository, avatarUrl: String) {
        self.init(unsafeResultMap: ["__typename": "User", "login": login, "company": company, "repositories": repositories.resultMap, "avatarUrl": avatarUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The username used to login.
      public var login: String {
        get {
          return resultMap["login"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "login")
        }
      }

      /// The user's public profile company.
      public var company: String? {
        get {
          return resultMap["company"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "company")
        }
      }

      /// A list of repositories that the user owns.
      public var repositories: Repository {
        get {
          return Repository(unsafeResultMap: resultMap["repositories"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "repositories")
        }
      }

      /// A URL pointing to the user's public avatar.
      public var avatarUrl: String {
        get {
          return resultMap["avatarUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "avatarUrl")
        }
      }

      public struct Repository: GraphQLSelectionSet {
        public static let possibleTypes = ["RepositoryConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
          GraphQLField("totalDiskUsage", type: .nonNull(.scalar(Int.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node?]? = nil, totalDiskUsage: Int) {
          self.init(unsafeResultMap: ["__typename": "RepositoryConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, "totalDiskUsage": totalDiskUsage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        /// The total size in kilobytes of all repositories in the connection.
        public var totalDiskUsage: Int {
          get {
            return resultMap["totalDiskUsage"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalDiskUsage")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["Repository"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, createdAt: String) {
            self.init(unsafeResultMap: ["__typename": "Repository", "name": name, "createdAt": createdAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The name of the repository.
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// Identifies the date and time when the object was created.
          public var createdAt: String {
            get {
              return resultMap["createdAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }
        }
      }
    }
  }
}

public final class GetGitOrgQlQuery: GraphQLQuery {
  public let operationDefinition =
    "query GetGitOrgQL($withName: String!) {\n  organization(login: $withName) {\n    __typename\n    name\n    url\n  }\n}"

  public var withName: String

  public init(withName: String) {
    self.withName = withName
  }

  public var variables: GraphQLMap? {
    return ["withName": withName]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("organization", arguments: ["login": GraphQLVariable("withName")], type: .object(Organization.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(organization: Organization? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "organization": organization.flatMap { (value: Organization) -> ResultMap in value.resultMap }])
    }

    /// Lookup a organization by login.
    public var organization: Organization? {
      get {
        return (resultMap["organization"] as? ResultMap).flatMap { Organization(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "organization")
      }
    }

    public struct Organization: GraphQLSelectionSet {
      public static let possibleTypes = ["Organization"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("url", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, url: String) {
        self.init(unsafeResultMap: ["__typename": "Organization", "name": name, "url": url])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The organization's public profile name.
      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// The HTTP URL for this organization.
      public var url: String {
        get {
          return resultMap["url"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "url")
        }
      }
    }
  }
}

public final class CallsLimitStatusQlQuery: GraphQLQuery {
  public let operationDefinition =
    "query CallsLimitStatusQL {\n  rateLimit {\n    __typename\n    cost\n    limit\n    nodeCount\n    remaining\n    resetAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("rateLimit", type: .object(RateLimit.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(rateLimit: RateLimit? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "rateLimit": rateLimit.flatMap { (value: RateLimit) -> ResultMap in value.resultMap }])
    }

    /// The client's rate limit information.
    public var rateLimit: RateLimit? {
      get {
        return (resultMap["rateLimit"] as? ResultMap).flatMap { RateLimit(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "rateLimit")
      }
    }

    public struct RateLimit: GraphQLSelectionSet {
      public static let possibleTypes = ["RateLimit"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("cost", type: .nonNull(.scalar(Int.self))),
        GraphQLField("limit", type: .nonNull(.scalar(Int.self))),
        GraphQLField("nodeCount", type: .nonNull(.scalar(Int.self))),
        GraphQLField("remaining", type: .nonNull(.scalar(Int.self))),
        GraphQLField("resetAt", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(cost: Int, limit: Int, nodeCount: Int, remaining: Int, resetAt: String) {
        self.init(unsafeResultMap: ["__typename": "RateLimit", "cost": cost, "limit": limit, "nodeCount": nodeCount, "remaining": remaining, "resetAt": resetAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The point cost for the current query counting against the rate limit.
      public var cost: Int {
        get {
          return resultMap["cost"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "cost")
        }
      }

      /// The maximum number of points the client is permitted to consume in a 60 minute window.
      public var limit: Int {
        get {
          return resultMap["limit"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "limit")
        }
      }

      /// The maximum number of nodes this query may return
      public var nodeCount: Int {
        get {
          return resultMap["nodeCount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "nodeCount")
        }
      }

      /// The number of points remaining in the current rate limit window.
      public var remaining: Int {
        get {
          return resultMap["remaining"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "remaining")
        }
      }

      /// The time at which the current rate limit window resets in UTC epoch seconds.
      public var resetAt: String {
        get {
          return resultMap["resetAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "resetAt")
        }
      }
    }
  }
}

public final class SearchUsersQlQuery: GraphQLQuery {
  public let operationDefinition =
    "query SearchUsersQL($withName: String!) {\n  search(first: 20, query: $withName, type: USER) {\n    __typename\n    nodes {\n      __typename\n      ...UserDetail\n    }\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(UserDetail.fragmentDefinition) }

  public var withName: String

  public init(withName: String) {
    self.withName = withName
  }

  public var variables: GraphQLMap? {
    return ["withName": withName]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("search", arguments: ["first": 20, "query": GraphQLVariable("withName"), "type": "USER"], type: .nonNull(.object(Search.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(search: Search) {
      self.init(unsafeResultMap: ["__typename": "Query", "search": search.resultMap])
    }

    /// Perform a search across resources.
    public var search: Search {
      get {
        return Search(unsafeResultMap: resultMap["search"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes = ["SearchResultItemConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("nodes", type: .list(.object(Node.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(nodes: [Node?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "SearchResultItemConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of nodes.
      public var nodes: [Node?]? {
        get {
          return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes = ["Issue", "PullRequest", "Repository", "User", "Organization", "MarketplaceListing"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(UserDetail.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeIssue() -> Node {
          return Node(unsafeResultMap: ["__typename": "Issue"])
        }

        public static func makePullRequest() -> Node {
          return Node(unsafeResultMap: ["__typename": "PullRequest"])
        }

        public static func makeRepository() -> Node {
          return Node(unsafeResultMap: ["__typename": "Repository"])
        }

        public static func makeOrganization() -> Node {
          return Node(unsafeResultMap: ["__typename": "Organization"])
        }

        public static func makeMarketplaceListing() -> Node {
          return Node(unsafeResultMap: ["__typename": "MarketplaceListing"])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var userDetail: UserDetail? {
            get {
              if !UserDetail.possibleTypes.contains(resultMap["__typename"]! as! String) { return nil }
              return UserDetail(unsafeResultMap: resultMap)
            }
            set {
              guard let newValue = newValue else { return }
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class SearchReposQlQuery: GraphQLQuery {
  public let operationDefinition =
    "query SearchReposQL($withName: String!) {\n  search(first: 20, query: $withName, type: REPOSITORY) {\n    __typename\n    nodes {\n      __typename\n      ...RepositoryDetail\n    }\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(RepositoryDetail.fragmentDefinition) }

  public var withName: String

  public init(withName: String) {
    self.withName = withName
  }

  public var variables: GraphQLMap? {
    return ["withName": withName]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("search", arguments: ["first": 20, "query": GraphQLVariable("withName"), "type": "REPOSITORY"], type: .nonNull(.object(Search.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(search: Search) {
      self.init(unsafeResultMap: ["__typename": "Query", "search": search.resultMap])
    }

    /// Perform a search across resources.
    public var search: Search {
      get {
        return Search(unsafeResultMap: resultMap["search"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes = ["SearchResultItemConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("nodes", type: .list(.object(Node.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(nodes: [Node?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "SearchResultItemConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of nodes.
      public var nodes: [Node?]? {
        get {
          return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes = ["Issue", "PullRequest", "Repository", "User", "Organization", "MarketplaceListing"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(RepositoryDetail.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeIssue() -> Node {
          return Node(unsafeResultMap: ["__typename": "Issue"])
        }

        public static func makePullRequest() -> Node {
          return Node(unsafeResultMap: ["__typename": "PullRequest"])
        }

        public static func makeUser() -> Node {
          return Node(unsafeResultMap: ["__typename": "User"])
        }

        public static func makeOrganization() -> Node {
          return Node(unsafeResultMap: ["__typename": "Organization"])
        }

        public static func makeMarketplaceListing() -> Node {
          return Node(unsafeResultMap: ["__typename": "MarketplaceListing"])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var repositoryDetail: RepositoryDetail? {
            get {
              if !RepositoryDetail.possibleTypes.contains(resultMap["__typename"]! as! String) { return nil }
              return RepositoryDetail(unsafeResultMap: resultMap)
            }
            set {
              guard let newValue = newValue else { return }
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public struct UserDetail: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment UserDetail on User {\n  __typename\n  avatarUrl\n  company\n  createdAt\n  login\n  repositories {\n    __typename\n    totalCount\n  }\n}"

  public static let possibleTypes = ["User"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
    GraphQLField("company", type: .scalar(String.self)),
    GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
    GraphQLField("login", type: .nonNull(.scalar(String.self))),
    GraphQLField("repositories", type: .nonNull(.object(Repository.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(avatarUrl: String, company: String? = nil, createdAt: String, login: String, repositories: Repository) {
    self.init(unsafeResultMap: ["__typename": "User", "avatarUrl": avatarUrl, "company": company, "createdAt": createdAt, "login": login, "repositories": repositories.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// A URL pointing to the user's public avatar.
  public var avatarUrl: String {
    get {
      return resultMap["avatarUrl"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "avatarUrl")
    }
  }

  /// The user's public profile company.
  public var company: String? {
    get {
      return resultMap["company"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "company")
    }
  }

  /// Identifies the date and time when the object was created.
  public var createdAt: String {
    get {
      return resultMap["createdAt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  /// The username used to login.
  public var login: String {
    get {
      return resultMap["login"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "login")
    }
  }

  /// A list of repositories that the user owns.
  public var repositories: Repository {
    get {
      return Repository(unsafeResultMap: resultMap["repositories"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "repositories")
    }
  }

  public struct Repository: GraphQLSelectionSet {
    public static let possibleTypes = ["RepositoryConnection"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(totalCount: Int) {
      self.init(unsafeResultMap: ["__typename": "RepositoryConnection", "totalCount": totalCount])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Identifies the total count of items in the connection.
    public var totalCount: Int {
      get {
        return resultMap["totalCount"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "totalCount")
      }
    }
  }
}

public struct RepositoryDetail: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment RepositoryDetail on Repository {\n  __typename\n  createdAt\n  isPrivate\n  name\n  nameWithOwner\n  assignableUsers(first: 0) {\n    __typename\n    totalCount\n  }\n  collaborators {\n    __typename\n    totalCount\n  }\n  commitComments {\n    __typename\n    totalCount\n  }\n  mentionableUsers {\n    __typename\n    totalCount\n  }\n  owner {\n    __typename\n    login\n    avatarUrl\n  }\n  primaryLanguage {\n    __typename\n    name\n  }\n  stargazers {\n    __typename\n    totalCount\n  }\n  watchers {\n    __typename\n    totalCount\n  }\n}"

  public static let possibleTypes = ["Repository"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
    GraphQLField("isPrivate", type: .nonNull(.scalar(Bool.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("nameWithOwner", type: .nonNull(.scalar(String.self))),
    GraphQLField("assignableUsers", arguments: ["first": 0], type: .nonNull(.object(AssignableUser.selections))),
    GraphQLField("collaborators", type: .object(Collaborator.selections)),
    GraphQLField("commitComments", type: .nonNull(.object(CommitComment.selections))),
    GraphQLField("mentionableUsers", type: .nonNull(.object(MentionableUser.selections))),
    GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
    GraphQLField("primaryLanguage", type: .object(PrimaryLanguage.selections)),
    GraphQLField("stargazers", type: .nonNull(.object(Stargazer.selections))),
    GraphQLField("watchers", type: .nonNull(.object(Watcher.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(createdAt: String, isPrivate: Bool, name: String, nameWithOwner: String, assignableUsers: AssignableUser, collaborators: Collaborator? = nil, commitComments: CommitComment, mentionableUsers: MentionableUser, owner: Owner, primaryLanguage: PrimaryLanguage? = nil, stargazers: Stargazer, watchers: Watcher) {
    self.init(unsafeResultMap: ["__typename": "Repository", "createdAt": createdAt, "isPrivate": isPrivate, "name": name, "nameWithOwner": nameWithOwner, "assignableUsers": assignableUsers.resultMap, "collaborators": collaborators.flatMap { (value: Collaborator) -> ResultMap in value.resultMap }, "commitComments": commitComments.resultMap, "mentionableUsers": mentionableUsers.resultMap, "owner": owner.resultMap, "primaryLanguage": primaryLanguage.flatMap { (value: PrimaryLanguage) -> ResultMap in value.resultMap }, "stargazers": stargazers.resultMap, "watchers": watchers.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// Identifies the date and time when the object was created.
  public var createdAt: String {
    get {
      return resultMap["createdAt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  /// Identifies if the repository is private.
  public var isPrivate: Bool {
    get {
      return resultMap["isPrivate"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "isPrivate")
    }
  }

  /// The name of the repository.
  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// The repository's name with owner.
  public var nameWithOwner: String {
    get {
      return resultMap["nameWithOwner"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "nameWithOwner")
    }
  }

  /// A list of users that can be assigned to issues in this repository.
  public var assignableUsers: AssignableUser {
    get {
      return AssignableUser(unsafeResultMap: resultMap["assignableUsers"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "assignableUsers")
    }
  }

  /// A list of collaborators associated with the repository.
  public var collaborators: Collaborator? {
    get {
      return (resultMap["collaborators"] as? ResultMap).flatMap { Collaborator(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "collaborators")
    }
  }

  /// A list of commit comments associated with the repository.
  public var commitComments: CommitComment {
    get {
      return CommitComment(unsafeResultMap: resultMap["commitComments"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "commitComments")
    }
  }

  /// A list of Users that can be mentioned in the context of the repository.
  public var mentionableUsers: MentionableUser {
    get {
      return MentionableUser(unsafeResultMap: resultMap["mentionableUsers"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "mentionableUsers")
    }
  }

  /// The User owner of the repository.
  public var owner: Owner {
    get {
      return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "owner")
    }
  }

  /// The primary language of the repository's code.
  public var primaryLanguage: PrimaryLanguage? {
    get {
      return (resultMap["primaryLanguage"] as? ResultMap).flatMap { PrimaryLanguage(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "primaryLanguage")
    }
  }

  /// A list of users who have starred this starrable.
  public var stargazers: Stargazer {
    get {
      return Stargazer(unsafeResultMap: resultMap["stargazers"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "stargazers")
    }
  }

  /// A list of users watching the repository.
  public var watchers: Watcher {
    get {
      return Watcher(unsafeResultMap: resultMap["watchers"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "watchers")
    }
  }

  public struct AssignableUser: GraphQLSelectionSet {
    public static let possibleTypes = ["UserConnection"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(totalCount: Int) {
      self.init(unsafeResultMap: ["__typename": "UserConnection", "totalCount": totalCount])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Identifies the total count of items in the connection.
    public var totalCount: Int {
      get {
        return resultMap["totalCount"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "totalCount")
      }
    }
  }

  public struct Collaborator: GraphQLSelectionSet {
    public static let possibleTypes = ["RepositoryCollaboratorConnection"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(totalCount: Int) {
      self.init(unsafeResultMap: ["__typename": "RepositoryCollaboratorConnection", "totalCount": totalCount])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Identifies the total count of items in the connection.
    public var totalCount: Int {
      get {
        return resultMap["totalCount"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "totalCount")
      }
    }
  }

  public struct CommitComment: GraphQLSelectionSet {
    public static let possibleTypes = ["CommitCommentConnection"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(totalCount: Int) {
      self.init(unsafeResultMap: ["__typename": "CommitCommentConnection", "totalCount": totalCount])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Identifies the total count of items in the connection.
    public var totalCount: Int {
      get {
        return resultMap["totalCount"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "totalCount")
      }
    }
  }

  public struct MentionableUser: GraphQLSelectionSet {
    public static let possibleTypes = ["UserConnection"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(totalCount: Int) {
      self.init(unsafeResultMap: ["__typename": "UserConnection", "totalCount": totalCount])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Identifies the total count of items in the connection.
    public var totalCount: Int {
      get {
        return resultMap["totalCount"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "totalCount")
      }
    }
  }

  public struct Owner: GraphQLSelectionSet {
    public static let possibleTypes = ["Organization", "User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("login", type: .nonNull(.scalar(String.self))),
      GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public static func makeOrganization(login: String, avatarUrl: String) -> Owner {
      return Owner(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl])
    }

    public static func makeUser(login: String, avatarUrl: String) -> Owner {
      return Owner(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The username used to login.
    public var login: String {
      get {
        return resultMap["login"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "login")
      }
    }

    /// A URL pointing to the owner's public avatar.
    public var avatarUrl: String {
      get {
        return resultMap["avatarUrl"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "avatarUrl")
      }
    }
  }

  public struct PrimaryLanguage: GraphQLSelectionSet {
    public static let possibleTypes = ["Language"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(name: String) {
      self.init(unsafeResultMap: ["__typename": "Language", "name": name])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The name of the current language.
    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }
  }

  public struct Stargazer: GraphQLSelectionSet {
    public static let possibleTypes = ["StargazerConnection"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(totalCount: Int) {
      self.init(unsafeResultMap: ["__typename": "StargazerConnection", "totalCount": totalCount])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Identifies the total count of items in the connection.
    public var totalCount: Int {
      get {
        return resultMap["totalCount"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "totalCount")
      }
    }
  }

  public struct Watcher: GraphQLSelectionSet {
    public static let possibleTypes = ["UserConnection"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(totalCount: Int) {
      self.init(unsafeResultMap: ["__typename": "UserConnection", "totalCount": totalCount])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Identifies the total count of items in the connection.
    public var totalCount: Int {
      get {
        return resultMap["totalCount"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "totalCount")
      }
    }
  }
}