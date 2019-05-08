//
//  ViewController.swift
//  GitScope
//
//  Created by vit on 5/4/19.
//  Copyright © 2019 vit. All rights reserved.
//

import UIKit
import Alamofire
import Apollo

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8824626171, green: 1, blue: 0.8104658711, alpha: 1)
        
        MyGitHub.shared.GetOrg()
        MyGitHub.shared.GetUser()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

// {"query": "{organization(login: \"facebook\") {name,url}}"}
