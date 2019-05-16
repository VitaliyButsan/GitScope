//
//  UsersGitHub.swift
//  GitScope
//
//  Created by vit on 5/15/19.
//  Copyright © 2019 vit. All rights reserved.
//

import Foundation
import Alamofire
import Apollo

class UsersGitHub {
    
    // singleton
    static let shared = UsersGitHub()
    
    public private(set) var name = ""
    public private(set) var email = ""
    public private(set) var avatarUrl = ""
    
    func setProperties(name: String) {
        self.name = name
    }
    
    
    func getUsers(withName userName: String) {
        //MyDataBase.shared.GetUser(withUserName: userName)
    }
}
