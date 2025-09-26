//
//  ViewController.swift
//  GitScope
//
//  Created by vit on 5/4/19.
//  Copyright © 2019 vit. All rights reserved.
//

import UIKit
import Alamofire
import GitHubAPI
import Apollo

class GitCardsTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate, UITextFieldDelegate{
    
    private let cellId = "Cell"
    private var greatherIndex = -1
    private var inputSearchText = ""
    private var scopeBarDefaultTitle = "Repositories"
    private var searchController = UISearchController(searchResultsController: nil)
    private var animationsIsLaunching = false
    private var searchBarIsLaunching = false
    private var defaultCellsAmount = 10
    private var limitCounter = 0
    var db = MyDataBase.shared

    // establish custom titleLabel
    private var customTitleView: UILabel = {
        let myTitle = UILabel.init(frame: CGRect(x: 0, y: 0, width: 240, height: 30))
        myTitle.textAlignment = .center
        myTitle.backgroundColor = #colorLiteral(red: 0.9845624922, green: 1, blue: 0.9875162251, alpha: 0)
        myTitle.text = "<  🔍  >"
        return myTitle
    }()

    // label for limit button
    private var limitButtonLabel: UILabel = {
        let limitLabel = UILabel()
        limitLabel.textAlignment = .center
        limitLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        limitLabel.textColor = #colorLiteral(red: 0, green: 0.47905761, blue: 1, alpha: 1)
        limitLabel.text = "Limit"
        return limitLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // setup tableView
        view.backgroundColor = #colorLiteral(red: 0.9082065659, green: 0.9707477169, blue: 0.9541269933, alpha: 1)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        navigationItem.titleView = customTitleView

        // register the Cell
        tableView.register(GitCardsTableViewCell.self, forCellReuseIdentifier: cellId)
        // navBarGradient setup
        setNavBarGradient()
        // searchController setup
        setupSearchController()
        // navigationBarItems setup
        setupNavigationBarItems()
    }
    
    // define setNavBarGradient func
    private func setNavBarGradient() {
        
        if let navigationBar = self.navigationController?.navigationBar {
            let gradient = CAGradientLayer()
            var bounds = navigationBar.bounds
            
            bounds.size.height += UIApplication.shared.statusBarFrame.size.height
            gradient.frame = bounds
            // set gradient [from, to]
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
    
    // setup limit button
    private func setupNavigationBarItems() {
        let limitButton = UIButton(type: .system)
        limitButton.frame = CGRect(x: 0, y: 0, width: 40, height: 34)
        limitButton.addTarget(self, action: #selector(limitButtonHandler), for: .touchUpInside)
        limitButtonLabel.frame = CGRect(x: -70, y: 0, width: 40, height: 34)
        limitButton.addSubview(limitButtonLabel)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: limitButton)
    }

    // limit button handler
    @objc func limitButtonHandler() {
        if MyDataBase.shared.limitQueriesStatus != nil {
            repeaterTitle(withText: "<  Remain: \(limitCounter) requests  >", withTextColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        } else {
            self.repeaterTitle(withText: "<  Limit not received!  >", withTextColor: #colorLiteral(red: 0.7184983492, green: 0.07270544022, blue: 0.1745591164, alpha: 1))
        }
    }
        
    // repeater titleLabel animation func
    @objc private func repeaterTitle(withText titleText: String, withTextColor textColor: UIColor) {
        animatorTitleLabel(withText: titleText, textColor: textColor, withDelay: 0.0)
        _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(repeatTitleLabelMove), userInfo: nil, repeats: false)
    }
    
    // repeat titleLabel move
    @objc func repeatTitleLabelMove() {
        animatorTitleLabel(withText: "<  " + scopeBarDefaultTitle + "🔍  >", textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), withDelay: 0.0)
    }
    
    // setup searchController
    private func setupSearchController() {
        searchController.searchBar.backgroundColor = #colorLiteral(red: 0.9069359303, green: 0.971636951, blue: 0.9524329305, alpha: 1)
        searchController.searchBar.placeholder = "Find on GitHub"
        searchController.searchBar.scopeButtonTitles = ["Repositories", "Users", "Organizations"]
        searchController.searchBar.textField?.addTarget(self, action: #selector(getData), for: UIControl.Event.primaryActionTriggered)
        searchController.searchBar.textField?.clearButtonMode = .never
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.textField?.textColor = .red
        searchController.obscuresBackgroundDuringPresentation = false // ?
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    // get data
    @objc func getData() {
        // loading wheel started, into searchBar
        searchController.searchBar.isLoading = true
        
        MyDataBase.shared.getData(withSearchInput: inputSearchText, forScopeBarVariant: scopeBarDefaultTitle) { isCompleted in
            if isCompleted {
                
                // if data not received earlier and title has been red
                if self.customTitleView.text == "<  No" + " \(self.scopeBarDefaultTitle) " + "Data!  >" {
                    self.animatorTitleLabel(withText: "<  " + "\(self.scopeBarDefaultTitle)" + "🔍  >", textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), withDelay: 0.0)
                }
                
                // after data has been reseived, set limitCounter and defaultCellsAmount
                self.limitCounter = MyDataBase.shared.limitQueriesStatus ?? 0
                self.defaultCellsAmount = MyDataBase.shared.repositoriesContainer?.search.nodes?.count ?? self.defaultCellsAmount
                self.defaultCellsAmount = MyDataBase.shared.userContainer?.search.nodes?.count ?? self.defaultCellsAmount
                self.defaultCellsAmount = MyDataBase.shared.organizationsContainer?.search.nodes?.count ?? self.defaultCellsAmount
                
                DispatchQueue.main.async {
                    // stop loading wheel and then reload tabelView
                    self.searchController.searchBar.isLoading = false
                    self.tableView.reloadData()
                }
            } else {
                // if data not received
                self.searchController.searchBar.isLoading = false
                self.animatorTitleLabel(withText: "<  No" + " \(self.scopeBarDefaultTitle) " + "Data!  >", textColor: #colorLiteral(red: 0.8219781091, green: 0.03732189472, blue: 0.1942074423, alpha: 1), withDelay: 0.5)
            }
        }
        // turn ON animations flag
        animationsIsLaunching = false
    }

    
    // cancel button responder
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.isLoading = false
        animatorTitleLabel(withText: "<  " + "\(scopeBarDefaultTitle)" + "🔍  >", textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), withDelay: 0.0)
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
        // number of rows basis on received data
        if let repositories = MyDataBase.shared.repositoriesContainer {
            return repositories.search.nodes?.count ?? 1
        } else if let users = MyDataBase.shared.userContainer {
            return users.search.nodes?.count ?? 2
        } else if let organizations = MyDataBase.shared.organizationsContainer {
            return organizations.search.nodes?.count ?? 3
        } else {
//            print("----------------------->")
            return defaultCellsAmount
        }
    }
    
    // reuse the cell --------------------------------------------------------------------------------------------------
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! GitCardsTableViewCell

        // set titles based on searchScopeBar variant
        cell.setLabelsTitle(withSearchScopeBarVariant: scopeBarDefaultTitle)
        
        // transfer data into the cell
        if let data = MyDataBase.shared.repositoriesContainer {
            cell.updateCell(withData: data, withScopeBarVariant: scopeBarDefaultTitle, forIndexPath: indexPath)
        } else if let data =  MyDataBase.shared.userContainer {
            cell.updateCell(withData: data, withScopeBarVariant: scopeBarDefaultTitle, forIndexPath: indexPath)
        } else if let data = MyDataBase.shared.organizationsContainer {
            cell.updateCell(withData: data, withScopeBarVariant: scopeBarDefaultTitle, forIndexPath: indexPath)
        }
        
        // animate views inside cell
        if !animationsIsLaunching, defaultCellsAmount > 0 {
            cell.animateViewsInsideCell { isAnimated in
                // launch searchBar
                if !self.searchBarIsLaunching {
                    DispatchQueue.main.async {
                        self.searchController.searchBar.becomeFirstResponder()
                        self.searchBarIsLaunching = true
                        self.animationsIsLaunching = true
                    }
                    // animating titleLabel
                    self.animatorTitleLabel(withText: "<  \(self.scopeBarDefaultTitle) 🔍  >", textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), withDelay: 0.5)
                }
            }
            
            defaultCellsAmount -= 1
            // for don't repeat animated cells
            if indexPath.row > greatherIndex {
                greatherIndex = indexPath.row
            }
        }

        return cell
    } // ----------------------------------------------------------------------------------------------------------------

  
    // define inamation titleLabel func
    private func animatorTitleLabel(withText inputText: String, textColor inputColor: UIColor, withDelay inputedDelay: Double) {
        searchController.searchBar.textField?.textColor = inputColor
        // (up) animate titleLabel
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.customTitleView.frame = CGRect(x: 0, y: -90, width: 240, height: 30)
            self.limitButtonLabel.frame = CGRect(x: 0, y: 0, width: 44, height: 34)
        }) { _ in
            // (down) set title.text and reverse animate titleLabel
            UIView.animate(withDuration: 0.5, delay: inputedDelay, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.customTitleView.frame = CGRect(x: 0, y: 0, width: 240, height: 30)
                self.customTitleView.text = inputText
                self.customTitleView.textColor = inputColor
            })
        }
    }
    
    // scope bar responder
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        MyDataBase.shared.repositoriesContainer = nil
        MyDataBase.shared.userContainer = nil
        MyDataBase.shared.organizationsContainer = nil

        scopeBarDefaultTitle = searchBar.scopeButtonTitles![selectedScope]
        // animate titleLabel with scopeBar title
        self.animatorTitleLabel(withText: "<  " + self.scopeBarDefaultTitle + " 🔍  >", textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), withDelay: 0.0)
        searchBar.text = ""
        searchBar.becomeFirstResponder()
        
        animationsIsLaunching = false
        greatherIndex = -1
        defaultCellsAmount = 10
        tableView.reloadData()
        
    }
    
    // input searching responder
    func updateSearchResults(for searchController: UISearchController) {
        // save input text
        inputSearchText = searchController.searchBar.text?.trimmingCharacters(in: .whitespaces).lowercased() ?? ""
    }
    
}

// extended UISearchBar
extension UISearchBar {
    
    // Access to textField
    public var textField: UITextField? {
        let subViews = subviews.flatMap { $0.subviews }
        return (subViews.filter { $0 is UITextField }).first as? UITextField
    }
    
    //  Create activity indicator
    public var activityIndicator: UIActivityIndicatorView? {
        return textField?.leftView?.subviews.compactMap{ $0 as? UIActivityIndicatorView }.first
    }
    
    //  on/off activity indicator
    var isLoading: Bool {
        get {
            return activityIndicator != nil
        } set {
            if newValue {
                // Set up activity indicator
                if activityIndicator == nil {
                    let newActivityIndicator = UIActivityIndicatorView(style: .gray)
                    newActivityIndicator.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                    newActivityIndicator.startAnimating()
                    newActivityIndicator.backgroundColor = #colorLiteral(red: 0.7783739567, green: 0.9003444314, blue: 0.8740741014, alpha: 1)
                    textField?.leftView?.addSubview(newActivityIndicator)
                    let leftViewSize = textField?.leftView?.frame.size ?? CGSize.zero
                    newActivityIndicator.center = CGPoint(x: leftViewSize.width/2, y: leftViewSize.height/2)
                }
            } else {
                activityIndicator?.removeFromSuperview()
            }
        }
    }
    
}
