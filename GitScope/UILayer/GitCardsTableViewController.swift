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

class GitCardsTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    private let cellId = "Cell"
    private var greatherIndex = -1
    private var inputSearchText = ""
    private var searchController: UISearchController?
    private var animationsIsLaunching = false
    private var searchBarIsLaunching = false
    private var defaultCellsAmount = 5
    
    // establish custom titleLabel
    private var myTitleView: UILabel = {
        let myTitle = UILabel.init(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        myTitle.textAlignment = .center
        myTitle.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        myTitle.text = "<  🔍  >"
        return myTitle
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        // setup tableView
        view.backgroundColor = #colorLiteral(red: 0.9082065659, green: 0.9707477169, blue: 0.9541269933, alpha: 1)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        navigationItem.titleView = myTitleView
        
        // register the Cell
        tableView.register(GitCardsTableViewCell.self, forCellReuseIdentifier: cellId)
        // call navBarGradient func
        setNavBarGradient()
        // call searchController setup
        setupSearchController()
    }
    
    
    // define setNavBarGradient func
    private func setNavBarGradient() {
        
        if let navigationBar = self.navigationController?.navigationBar {
            let gradient = CAGradientLayer()
            var bounds = navigationBar.bounds
            
            bounds.size.height += UIApplication.shared.statusBarFrame.size.height
            gradient.frame = bounds
            gradient.colors = [UIColor.init(cgColor: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)).cgColor, UIColor.init(cgColor: #colorLiteral(red: 0.9069359303, green: 0.971636951, blue: 0.9524329305, alpha: 1)).cgColor]
            gradient.locations = [0, 1]
            
            UIGraphicsBeginImageContext(gradient.bounds.size)
            gradient.render(in: UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            // set gradient image to navBar.bg
            navigationBar.setBackgroundImage(image, for: .default)
        }
    }

    private func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchBar.backgroundColor = #colorLiteral(red: 0.9069359303, green: 0.971636951, blue: 0.9524329305, alpha: 1)
        searchController?.searchBar.placeholder = "Find on GitHub"
        searchController?.searchBar.scopeButtonTitles = ["All", "User", "Company"]
        searchController?.searchBar.textField?.addTarget(self, action: #selector(getData), for: UIControl.Event.primaryActionTriggered)
        searchController?.hidesNavigationBarDuringPresentation = false
        searchController?.searchResultsUpdater = self
        searchController?.searchBar.delegate = self
        searchController?.obscuresBackgroundDuringPresentation = false // ?
        searchController?.dimsBackgroundDuringPresentation = false // ?
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    @objc func getData() {
        // turn ON animations flag
        animationsIsLaunching = false
        
        // get User
        MyDataBase.shared.getUsers(withName: inputSearchText) { (result) in
            if result != nil {
                print(result?.avatarUrl ?? "")
                DispatchQueue.main.async {
                    self.defaultCellsAmount = MyDataBase.shared.userContainer?.repositories.nodes?.count ?? 5
                    self.tableView.reloadData()
                }
            } else {
                // Alert()
            }
        }
    }
    
    // selected cell responder
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    // set height for row
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // set number of rows in table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("...", MyDataBase.shared.userContainer?.repositories.nodes?.count ?? 0)
        return MyDataBase.shared.userContainer?.repositories.nodes?.count ?? defaultCellsAmount
    }
    
    // reuse the cell --------------------------------------------------------------------------------------------------
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! GitCardsTableViewCell
        
        if let user = MyDataBase.shared.userContainer {
            cell.updateCell(withData: user, forIndexPath: indexPath)
        }
        
        if !animationsIsLaunching, defaultCellsAmount > 0 {
            cell.animateViewsInsideCell { isAnimated in
                if isAnimated, !self.searchBarIsLaunching {
                    // launch searchBar
                    DispatchQueue.main.async {
                        self.searchController?.searchBar.becomeFirstResponder()
                        self.searchBarIsLaunching = true
                        self.animationsIsLaunching = true
                    }
                    // animating titleLabel
                    self.animatorTitleLabel(withText: "<  All 🔍  >", withDelay: 0.5)
                }
            }
            defaultCellsAmount -= 1
        }

        return cell
    } // ----------------------------------------------------------------------------------------------------------------

    
    // define inamation titleLabel func
    private func animatorTitleLabel(withText inputText: String, withDelay inputedDelay: Double) {
        // (up) animate titleLabel
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.myTitleView.frame = CGRect(x: 0, y: -60, width: 200, height: 30)
        }) { _ in
            // (down) set title.text and reverse animate titleLabel
            self.myTitleView.text = inputText
            UIView.animate(withDuration: 0.5, delay: inputedDelay, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.myTitleView.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
            })
        }
    }
    

    // scope bar responder
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        let stringForLabel = "<  " + searchBar.scopeButtonTitles![selectedScope] + " 🔍  >"
        // animate titleLabel when scope bar did switched
        searchBar.showsCancelButton = true
        searchBar.becomeFirstResponder()
        animatorTitleLabel(withText: stringForLabel, withDelay: 0.0)
    }
    
    // input search responder
    func updateSearchResults(for searchController: UISearchController) {
        // save input text
        inputSearchText = searchController.searchBar.text?.trimmingCharacters(in: .whitespaces).lowercased() ?? ""
    }
    
}

// exdended to textField
extension UISearchBar {
    var textField: UITextField? {
        let subViews = subviews.flatMap { $0.subviews }
        return (subViews.filter { $0 is UITextField }).first as? UITextField
    }
}
