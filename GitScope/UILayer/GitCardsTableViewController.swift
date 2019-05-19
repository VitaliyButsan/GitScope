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
    private var scopeBarDefaultTitle = "Repositories"
    private var searchController: UISearchController?
    private var animationsIsLaunching = false
    private var searchBarIsLaunching = false
    private var defaultCellsAmount = 10
    
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
        MyDataBase.shared.getLimitStatus()
        
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
            // set gradient from --> to
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
        searchController?.searchBar.scopeButtonTitles = ["Repositories", "Users", "Organizations"]
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
        // get Users
        MyDataBase.shared.getData(withSearchInput: inputSearchText, forScopeBarVariant: scopeBarDefaultTitle) { isCompleted in
            if isCompleted {
                //print(MyDataBase.shared.userContainer)
                DispatchQueue.main.async {
                    self.defaultCellsAmount = MyDataBase.shared.repositoriesContainer?.nodes?.count ?? self.defaultCellsAmount
                    self.defaultCellsAmount = MyDataBase.shared.userContainer?.nodes?.count ?? self.defaultCellsAmount
                    self.tableView.reloadData()
                }
            } else {
                print("ERROR: NO DATA!")
                // Alert()
            }
        }
        // turn ON animations flag
        animationsIsLaunching = false
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
        
        if let repositories = MyDataBase.shared.repositoriesContainer {
            return repositories.nodes?.count ?? defaultCellsAmount
        } else if let users = MyDataBase.shared.userContainer {
            return users.nodes?.count ?? defaultCellsAmount
        } else {
            return defaultCellsAmount
        }
    }
    
    // reuse the cell --------------------------------------------------------------------------------------------------
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! GitCardsTableViewCell
  
        // set titles based on searchScopeBar variant
        cell.setLabelsTitle(withSearchScopeBarVariant: scopeBarDefaultTitle)
        
        // update cell with data
        if let data = MyDataBase.shared.repositoriesContainer {
            cell.updateCell(withData: data, withScopeBarVariant: scopeBarDefaultTitle, forIndexPath: indexPath)
        } else if let data =  MyDataBase.shared.userContainer {
            cell.updateCell(withData: data, withScopeBarVariant: scopeBarDefaultTitle, forIndexPath: indexPath)
        } else if let data = MyDataBase.shared.organizationsContainer {
            cell.updateCell(withData: data, withScopeBarVariant: scopeBarDefaultTitle, forIndexPath: indexPath)
        }
        
        print(greatherIndex, indexPath.row)
        // animate views inside cell
        if !animationsIsLaunching, defaultCellsAmount > 0 {
            animateViewsInsideCell(iconView: cell.iconView, decorationSolidLineView: cell.decorationSolidLineView, nameLabel: cell.nameLabel, companyView: cell.companyView, yearCreatedView: cell.yearCreatedView, repoView: cell.repoView, starsView: cell.starsView, profLanguagesView: cell.profLanguagesView)
            
            defaultCellsAmount -= 1
            if indexPath.row > greatherIndex {
                greatherIndex = indexPath.row
            }
        }

        return cell
    } // ----------------------------------------------------------------------------------------------------------------

    
    // MARK: - Animation func
    // define labels animator --------------------------------------------------------------------------
    func animateViewsInsideCell(iconView: UIView, decorationSolidLineView: UIView, nameLabel: UIView, companyView: UIView, yearCreatedView: UIView, repoView: UIView, starsView: UIView, profLanguagesView: UIView) {

        // define animation cellSubViews func
        func animatorCellSubViews(forView inputedView: UIView, withDelay inputedDelay: Double) {
            UIView.animate(withDuration: 1, delay: inputedDelay, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                inputedView.frame = CGRect(x: -400, y: 0, width: 0, height: 0)
                inputedView.alpha = 1
            })
        }
        
        // animate views inside cell
        animatorCellSubViews(forView: iconView, withDelay: 0.5)
        animatorCellSubViews(forView: decorationSolidLineView, withDelay: 0.5)
        animatorCellSubViews(forView: nameLabel, withDelay: 1.0)
        animatorCellSubViews(forView: companyView, withDelay: 1.5)
        animatorCellSubViews(forView: yearCreatedView, withDelay: 2.0)
        animatorCellSubViews(forView: repoView, withDelay: 2.1)
        animatorCellSubViews(forView: starsView, withDelay: 2.2)
        
        // animate profLanguagesView inside the cell
        UIView.animate(withDuration: 1, delay: 2.3, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            profLanguagesView.frame = CGRect(x: -100, y: 0, width: 0, height: 0)
            profLanguagesView.alpha = 1
        }) { _ in
            // launch searchBar
            if !self.searchBarIsLaunching {
                DispatchQueue.main.async {
                    self.searchController?.searchBar.becomeFirstResponder()
                    self.searchBarIsLaunching = true
                    self.animationsIsLaunching = true
                }
                // animating titleLabel
                self.animatorTitleLabel(withText: "<  \(self.scopeBarDefaultTitle) 🔍  >", withDelay: 0.5)
            }
        }
    } // END animation func -------------------------------------------------------------------

    
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
        scopeBarDefaultTitle = searchBar.scopeButtonTitles![selectedScope]
        // animate titleLabel
        animatorTitleLabel(withText: "<  " + scopeBarDefaultTitle + " 🔍  >", withDelay: 0.0)
        searchBar.text = ""
        searchBar.becomeFirstResponder()
        
        MyDataBase.shared.repositoriesContainer = nil
        MyDataBase.shared.userContainer = nil
        MyDataBase.shared.organizationsContainer = nil
        
        animationsIsLaunching = false
        greatherIndex = -1
        defaultCellsAmount = 10
        tableView.reloadData()
        
    }
    
    // input search responder
    func updateSearchResults(for searchController: UISearchController) {
        // save input text
        inputSearchText = searchController.searchBar.text?.trimmingCharacters(in: .whitespaces).lowercased() ?? ""
    }
    
}

// exdended UISearchBar to textField
extension UISearchBar {
    var textField: UITextField? {
        let subViews = subviews.flatMap { $0.subviews }
        return (subViews.filter { $0 is UITextField }).first as? UITextField
    }
}
