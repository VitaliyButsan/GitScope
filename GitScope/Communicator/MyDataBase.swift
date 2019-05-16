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
    
    var userContainer: GetUserQlQuery.Data.User?
    var organizationContainer: GetGitOrgQlQuery.Data.Organization?
    
    // created apollo client
    let apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        // add additionals headers if needed
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(vitGitHubBearerToken)"]
        let url = URL(string: vitGitHubGraphQLEndPoint)!
        // return client
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()
    

    // define getUsers func
    func getUsers(withName userName: String, completionHandler: @escaping (GetUserQlQuery.Data.User?) -> Void) {
        // apollo request
        apollo.fetch(query: GetUserQlQuery(login: userName)) { (result, error) in
            // check response
            guard let userStruct = result?.data?.user, error == nil else {
                completionHandler(nil)
                return
            }
            
            // if response is success
            self.userContainer = userStruct
            completionHandler(self.userContainer)
        }
        
    }
    
    
    
    
    
    
    
    
    
    func getOrg() {
        let getOrgQL = GetGitOrgQlQuery(login: "facebook")
        
        apollo.fetch(query: getOrgQL) { (result, error) in
            
            guard let org = result?.data?.organization else {
                print("There is no Data")
                return
            }
            
            print("-----------------------------------------------------")
            print("ORGANIZATION NAME: \(String(describing: org.name))")
            print("ORGANIZATION LINK: \(org.url)")
            print("-----------------------------------------------------")
        }
    }
    
    
    
    
}
