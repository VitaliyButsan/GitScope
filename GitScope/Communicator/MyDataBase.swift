//
//  MyGitHub.swift
//  GitScope
//
//  Created by vit on 5/4/19.
//  Copyright © 2019 vit. All rights reserved.
//

import Foundation
import Alamofire
import Apollo

class MyDataBase {
    
    // singleton
    static let shared = MyDataBase()
    
    // containers for received data
    var userContainer: SearchGitUsersQlQuery.Data?
    var repositoriesContainer: SearchGitReposQlQuery.Data?
    var organizationsContainer: SearchGitOrgsQlQuery.Data?
    var limitQueriesStatus: Int?
    
    // created apollo client
    let apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        // add additionals headers if needed
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(vitGitHubBearerToken)"]
        let url = URL(string: vitGitHubGraphQLEndPoint)!
        // return apollo client
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()
    
    
    // define getData func ------------------------------------------------------------------------
    func getData(withSearchInput searchInput: String, forScopeBarVariant scopeBarVariant: String, completionHandler: @escaping(Bool) -> Void) {
        
        if scopeBarVariant == "Repositories" {
            // apollo request
            let rep = SearchGitReposQlQuery(withName: searchInput)
            apollo.fetch(query: rep) { (result, error) in
                // chesk response
                guard let receivedRepositoriesStruct = result?.data, error == nil else { completionHandler(false); return }
                // if response is success
                self.repositoriesContainer = receivedRepositoriesStruct
                self.limitQueriesStatus = receivedRepositoriesStruct.rateLimit?.remaining
                completionHandler(true)
            }
            
        } else if scopeBarVariant == "Users" {
            // apollo request
            let usr = SearchGitUsersQlQuery(withName: searchInput + " type:user")
            apollo.fetch(query: usr) { (result, error) in
                // check response
                guard let receivedUserStruct = result?.data, error == nil else { completionHandler(false); return }
                // if response is success
                self.userContainer = receivedUserStruct
                self.limitQueriesStatus = receivedUserStruct.rateLimit?.remaining
                completionHandler(true)
            }
            
        } else if scopeBarVariant == "Organizations" {
            // apollo request
            let org = SearchGitOrgsQlQuery(withName: searchInput + " type:org")
            apollo.fetch(query: org) { (result, error) in
                // check response
                guard let receivedOrganizationStruct = result?.data, error == nil else { completionHandler(false); return }
                // if response is success
                self.organizationsContainer = receivedOrganizationStruct
                self.limitQueriesStatus = receivedOrganizationStruct.rateLimit?.remaining
                completionHandler(true)
            }
        }
    } // ------------------------------------------------------------------------------------------

}

