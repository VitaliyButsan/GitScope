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
    
    var userContainer: SearchGitUsersQlQuery.Data.Search?
    var repositoriesContainer: SearchGitReposQlQuery.Data.Search?
    var organizationsContainer: SearchGitOrgsQlQuery.Data.Search?
    var limitQueryesStatus = 0
    
    // created apollo client
    let apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        // add additionals headers if needed
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(vitGitHubBearerToken)"]
        let url = URL(string: vitGitHubGraphQLEndPoint)!
        // return client
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()
    
    
    // define getData func ------------------------------------------------------------------------
    func getData(withSearchInput searchInput: String, forScopeBarVariant scopeBarVariant: String, completionHandler: @escaping(Bool) -> Void) {
        
        if scopeBarVariant == "Repositories" {
            // apollo request
            apollo.fetch(query: SearchGitReposQlQuery(withName: searchInput)) { (result, error) in
                // chesk response
                guard let receivedRepositoriesStruct = result?.data?.search, error == nil else { completionHandler(false); return }
                // if response success
                self.repositoriesContainer = receivedRepositoriesStruct
                completionHandler(true)
            }
            
        } else if scopeBarVariant == "Users" {
                // apollo request
            apollo.fetch(query: SearchGitUsersQlQuery(withName: searchInput + " type:user")) { (result, error) in
                    // check response
                    guard let receivedUserStruct = result?.data?.search, error == nil else { completionHandler(false); return }
                    // if response is success
                    self.userContainer = receivedUserStruct
                    completionHandler(true)
                }
            
        } else if scopeBarVariant == "Organizations" {
            // apollo request
            apollo.fetch(query: SearchGitOrgsQlQuery(withName: searchInput + " type:org")) { (result, error) in
                // check response
                guard let receivedOrganizationStruct = result?.data?.search, error == nil else { completionHandler(false); return }
                // if response is success
                self.organizationsContainer = receivedOrganizationStruct
                completionHandler(true)
            }
        } else if scopeBarVariant == "getLimitStatus" {
            // apollo request
            apollo.fetch(query: CallsLimitStatusQlQuery()) { (result, error) in
                guard let limitStatusStruct = result?.data?.rateLimit else { completionHandler(false); return }
                // if response is success
                self.limitQueryesStatus = limitStatusStruct.remaining
                completionHandler(true)
            }
        }
    } // ------------------------------------------------------------------------------------------
    
}
