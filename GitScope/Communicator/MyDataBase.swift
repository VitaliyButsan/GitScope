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
    
    var userContainer: SearchUsersQlQuery.Data.Search?
    var repositoriesContainer: SearchReposQlQuery.Data.Search?
    var organizationsContainer: GetGitOrgQlQuery.Data.Organization?
    
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
            apollo.fetch(query: SearchReposQlQuery(withName: searchInput)) { (result, error) in
                // chesk response
                guard let receivedRepositoriesStruct = result?.data?.search, error == nil else { completionHandler(false); return }
                // if response success
                self.repositoriesContainer = receivedRepositoriesStruct
                completionHandler(true)
            }
            
        } else if scopeBarVariant == "Users" {
                // apollo request
                apollo.fetch(query: SearchUsersQlQuery(withName: searchInput)) { (result, error) in
                    // check response
                    guard let receivedUserStruct = result?.data?.search, error == nil else { completionHandler(false); return }
                    // if response is success
                    self.userContainer = receivedUserStruct
                    completionHandler(true)
                }
            
        } else if scopeBarVariant == "Organizations" {
            // apollo request
            apollo.fetch(query: GetGitOrgQlQuery(withName: searchInput)) { (result, error) in
                
            }
        }
    } // ------------------------------------------------------------------------------------------
    
    
    func getLimitStatus() {
        // apollo request
        apollo.fetch(query: CallsLimitStatusQlQuery()) { (result, error) in
            guard let limitStatusStruct = result?.data?.rateLimit else { return }
            
            print("-------------------------- ")
            print("cost:", limitStatusStruct.cost)
            print("limit:", limitStatusStruct.limit)
            print("nodeCont:", limitStatusStruct.nodeCount)
            print("remaining:", limitStatusStruct.remaining)
            print("resetAt:", limitStatusStruct.resetAt)
            print("-------------------------- ")
        }
    }
    
}
