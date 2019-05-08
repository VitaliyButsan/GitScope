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

class MyGitHub {
    
    static let shared = MyGitHub()
    
    let apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        // add additionals headers if needed
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(vitGitHubBearerToken)"]
        let url = URL(string: vitGitHubGraphQLEndPoint)!
        
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()
    
    
    func GetOrg() {
        let getOrgQL = GetGitOrgQlQuery()
        
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
    
    
    
    func GetUser() {
        let getUser = GetUserQlQuery()
        
        apollo.fetch(query: getUser) { (result, error) in
            guard let user = result?.data?.user else { return }
            // print user photo
            print(user.login, "photo:", user.avatarUrl, "\n")
            // repo info
            for (index, repo) in user.repositories.nodes!.enumerated() {
                print("\(index)" + ")", "'" + user.login + "'", "repo", "(" + (repo?.name ?? "...") + ")", "created at: -->", (repo?.createdAt ?? "No date!") + "; ", "total_size:", "\(user.repositories.totalDiskUsage / 1024)" + "MB")
            }
            
        }
        
    }
    
}
