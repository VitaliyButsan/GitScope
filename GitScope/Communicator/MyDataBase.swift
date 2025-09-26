//
//  MyGitHub.swift
//  GitScope
//
//  Created by vit on 5/4/19.
//  Copyright © 2019 vit. All rights reserved.
//

import Foundation
import GitHubAPI
import Alamofire
import Apollo

class MyDataBase {
    
    // singleton
    static let shared = MyDataBase()
    
    // containers for received data
    var userContainer: SearchGitUsersQLQuery.Data?
    var repositoriesContainer: SearchGitReposQLQuery.Data?
    var organizationsContainer: SearchGitOrgsQLQuery.Data?
    var limitQueriesStatus: Int?
    private(set) var apollo: ApolloClient
    
    // MARK: - Initializer
    
    private init() {
        let store = ApolloStore()
        let provider = DefaultInterceptorProvider(store: store)
        
        let headers: [String: String] = [
            "Authorization": "Bearer \(vitGitHubBearerToken)",
            "User-Agent": "TestGitHubGraphQl",
            "X-GitHub-Api-Version": "2022-11-28"
        ]
        
        let transport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: URL(string: vitGitHubGraphQLEndPoint)!,
            additionalHeaders: headers
        )
        
        apollo = ApolloClient(networkTransport: transport, store: store)
    }
    
    // define getData func ------------------------------------------------------------------------
    func getData(withSearchInput searchInput: String, forScopeBarVariant scopeBarVariant: String, completionHandler: @escaping(Bool) -> Void) {
        
        if scopeBarVariant == "Repositories" {
            // apollo request
            let rep = SearchGitReposQLQuery(withName: searchInput)
            apollo.fetch(query: rep) { (result: Result<GraphQLResult<SearchGitReposQLQuery.Data>, Error>) in
                switch result {
                    case .success(let graphQLResult):
                        if let errors = graphQLResult.errors, !errors.isEmpty {
                            print("GraphQL errors:", errors)
                            completionHandler(false)
                            return
                        }
                        guard let data = graphQLResult.data else {
                            completionHandler(false)
                            return
                        }
                        self.repositoriesContainer = data
                        self.limitQueriesStatus = data.rateLimit?.remaining
                        completionHandler(true)
                        
                    case .failure(let error):
                        print("Network error:", error)
                        completionHandler(false)
                }
            }
        } else if scopeBarVariant == "Users" {
            // apollo request
            let usr = SearchGitUsersQLQuery(withName: searchInput + " type:user")
            apollo.fetch(query: usr) { result in
                switch result {
                    case .success(let graphQLResult):
                        if let errors = graphQLResult.errors, !errors.isEmpty {
                            print("GraphQL errors:", errors)
                            completionHandler(false)
                            return
                        }
                        guard let data = graphQLResult.data else {
                            completionHandler(false)
                            return
                        }
                        self.userContainer = data
                        self.limitQueriesStatus = data.rateLimit?.remaining
                        completionHandler(true)
                        
                    case .failure(let error):
                        print("Network error:", error)
                        completionHandler(false)
                }
            }
        } else if scopeBarVariant == "Organizations" {
            // apollo request
            let org = SearchGitOrgsQLQuery(withName: searchInput + " type:org")
            apollo.fetch(query: org) { result in
                switch result {
                    case .success(let graphQLResult):
                        if let errors = graphQLResult.errors, !errors.isEmpty {
                            print("GraphQL errors:", errors)
                            completionHandler(false)
                            return
                        }
                        guard let data = graphQLResult.data else {
                            completionHandler(false)
                            return
                        }
                        self.organizationsContainer = data
                        self.limitQueriesStatus = data.rateLimit?.remaining
                        completionHandler(true)
                        
                    case .failure(let error):
                        print("Network error:", error)
                        completionHandler(false)
                }
            }
        }
    } // ------------------------------------------------------------------------------------------
    
}

