//
//  GitCardsTableViewCell.swift
//  GitScope
//
//  Created by vit on 5/10/19.
//  Copyright © 2019 vit. All rights reserved.
//

import UIKit
import GitHubAPI
import SDWebImage

// cards table view cell class
class GitCardsTableViewCell: UITableViewCell {

    // MARK: - Created Views on basisView
    // created basis card view
    private var basisViewOfCard: UIView = {
        let basisView = UIView()
        basisView.translatesAutoresizingMaskIntoConstraints = false
        basisView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        basisView.layer.cornerRadius = 16
        basisView.layer.borderWidth = 0.5
        return basisView
    }()
    
    // created left icon view
    var iconView: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "EmptyFace.png")
        icon.clipsToBounds = true
        icon.alpha = 0
        icon.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        icon.layer.cornerRadius = 14
        return icon
    }()

    // created name label, right position
    var nameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        name.text = "- - - - -"
        name.alpha = 0
        name.font = name.font.withSize(24)
        return name
    }()
    
    // created decoration line under nameLabel
    var decorationSolidLineView: UIView = {
        let solidLine = UIView()
        solidLine.translatesAutoresizingMaskIntoConstraints = false
        solidLine.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        solidLine.alpha = 0
        return solidLine
    }()
    
    // MARK: - Created companyView under nameLabel
    // created company view under nameLabel
    // ========================================================================
    var companyView: UIView = {
        let companyView = UIView()
        companyView.translatesAutoresizingMaskIntoConstraints = false
        companyView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        companyView.alpha = 0
        return companyView
    }()
    
    // created titlCompanyLabel
    var titleCompanyLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        titleLabel.text = "Company:"
        return titleLabel
    }()
    
    // created nameCompanyLabel
    var nameCompanyLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        nameLabel.text = "- - - - -"
        nameLabel.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium)
        return nameLabel
    }() // ====================================================================
    
    
    // MARK: - Created 4 bottom info views
    // created four bottom info views
    // yearView with subViews =================================================
    var yearCreatedView: UIView = {
        let yearView = UIView()
        yearView.translatesAutoresizingMaskIntoConstraints = false
        yearView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        yearView.alpha = 0
        return yearView
    }()
    
    var yearCounterLabel: UILabel = {
        let yearLabel = UILabel()
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        yearLabel.text = "07/2005"
        yearLabel.textAlignment = .center
        return yearLabel
    }()
    
    var titleYearLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        title.text = "Created in"
        title.textAlignment = .center
        return title
    }() // ---------------------------------------------------------------------
    
    // repoView with subViews --------------------------------------------------
    var repoView: UIView = {
        let repoView = UIView()
        repoView.translatesAutoresizingMaskIntoConstraints = false
        repoView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        repoView.alpha = 0
        return repoView
    }()

    var repoCounterLabel: UILabel = {
        let counter = UILabel()
        counter.translatesAutoresizingMaskIntoConstraints = false
        counter.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        counter.text = "- - -"
        counter.textAlignment = .center
        return counter
    }()
    
    var titleRepoLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        nameLabel.text = "Repository"
        nameLabel.textAlignment = .center
        return nameLabel
    }() // ---------------------------------------------------------------------

    // strarsView with subViews ------------------------------------------------
    var starsView: UIView = {
        let starsView = UIView()
        starsView.translatesAutoresizingMaskIntoConstraints = false
        starsView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        starsView.alpha = 0
        return starsView
    }()
    
    var starsCounterLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        name.text = "- - -"
        name.textAlignment = .center
        return name
    }()
    
    var titleStarsLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        nameLabel.text = "★"
        nameLabel.textAlignment = .center
        return nameLabel
    }() // ------------------------------------------------------------------
    
    // profLanguagesView with subViews --------------------------------------
    var profLanguagesView: UIView = {
        let languagesView = UIView()
        languagesView.translatesAutoresizingMaskIntoConstraints = false
        languagesView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        languagesView.alpha = 0
        return languagesView
    }()
    
    var counterProfLanguagesLabel: UILabel = {
        let profLanguages = UILabel()
        profLanguages.translatesAutoresizingMaskIntoConstraints = false
        profLanguages.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        profLanguages.text = "- - -"
        profLanguages.textAlignment = .center
        return profLanguages
    }()
    
    var titleProfLanguagesLabel: UILabel = {
        let titleLang = UILabel()
        titleLang.translatesAutoresizingMaskIntoConstraints = false
        titleLang.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        titleLang.text = "DevLang's"
        titleLang.textAlignment = .center
        return titleLang
    }() //===================================================================

    
    // MARK: - Layout all views
    // set layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = #colorLiteral(red: 0.9069359303, green: 0.971636951, blue: 0.9524329305, alpha: 1)
        // define some properties to happen setup constraints
        let indentDefault: CGFloat = 16
        let indentBetweenSubViews: CGFloat = 0
        let heightInfoView: CGFloat = 60
        let heightInfoSubView: CGFloat = 40
        let calculatedWidth: CGFloat = (self.frame.width - (indentDefault * 4) - (indentBetweenSubViews * 3)) / 4
        
        // MARK: - Layout basisView with subviews
        // setup basis view, covered cell content view -----------------------------------------
        contentView.addSubview(basisViewOfCard)
        basisViewOfCard.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: indentDefault).isActive = true
        basisViewOfCard.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        basisViewOfCard.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -indentDefault).isActive = true
        basisViewOfCard.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        
        // attach to left iconView on basic view
        basisViewOfCard.addSubview(iconView)
        iconView.leftAnchor.constraint(equalTo: basisViewOfCard.leftAnchor, constant: indentDefault).isActive = true
        iconView.topAnchor.constraint(equalTo: basisViewOfCard.topAnchor, constant: indentDefault).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        // attach nameLabel on basis view
        basisViewOfCard.addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: indentDefault).isActive = true
        nameLabel.topAnchor.constraint(equalTo: basisViewOfCard.topAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: basisViewOfCard.rightAnchor, constant: 0).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: heightInfoView).isActive = true
        
        // attach decarationLine on basis view
        basisViewOfCard.addSubview(decorationSolidLineView)
        decorationSolidLineView.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: indentDefault).isActive = true
        decorationSolidLineView.rightAnchor.constraint(equalTo: basisViewOfCard.rightAnchor, constant: -indentDefault).isActive = true
        decorationSolidLineView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -indentDefault).isActive = true
        decorationSolidLineView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        // -------------------------------------------------------------------------------------
        
        // MARK: - Layout companyView with subviews
        // setup company view ------------------------------------------------------------------
        basisViewOfCard.addSubview(companyView)
        companyView.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: indentDefault).isActive = true
        companyView.rightAnchor.constraint(equalTo: basisViewOfCard.rightAnchor, constant: -indentDefault).isActive = true
        companyView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        companyView.heightAnchor.constraint(equalToConstant: indentDefault).isActive = true
        
        // attach titleCompanyLabel on companyView
        companyView.addSubview(titleCompanyLabel)
        titleCompanyLabel.leftAnchor.constraint(equalTo: companyView.leftAnchor).isActive = true
        titleCompanyLabel.topAnchor.constraint(equalTo: companyView.topAnchor).isActive = true
        titleCompanyLabel.heightAnchor.constraint(equalTo: companyView.heightAnchor).isActive = true
        titleCompanyLabel.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        
        // attach nameCompanyLabel on companyView
        companyView.addSubview(nameCompanyLabel)
        nameCompanyLabel.leftAnchor.constraint(equalTo: titleCompanyLabel.rightAnchor).isActive = true
        nameCompanyLabel.topAnchor.constraint(equalTo: companyView.topAnchor).isActive = true
        nameCompanyLabel.rightAnchor.constraint(equalTo: companyView.rightAnchor).isActive = true
        nameCompanyLabel.heightAnchor.constraint(equalTo: companyView.heightAnchor).isActive = true
        nameCompanyLabel.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        //---------------------------------------------------------------------------------------

        // MARK: - Layout createdYearView with subviews
        // setup createdInView ------------------------------------------------------------------
        basisViewOfCard.addSubview(yearCreatedView)
        yearCreatedView.leftAnchor.constraint(equalTo: basisViewOfCard.leftAnchor, constant: indentDefault).isActive = true
        yearCreatedView.bottomAnchor.constraint(equalTo: basisViewOfCard.bottomAnchor, constant: -6).isActive = true
        yearCreatedView.heightAnchor.constraint(equalToConstant: heightInfoView).isActive = true
        yearCreatedView.widthAnchor.constraint(equalToConstant: calculatedWidth).isActive = true
        
        // attach numbersOfYearLabel
        yearCreatedView.addSubview(yearCounterLabel)
        yearCounterLabel.leftAnchor.constraint(equalTo: yearCreatedView.leftAnchor).isActive = true
        yearCounterLabel.topAnchor.constraint(equalTo: yearCreatedView.topAnchor).isActive = true
        yearCounterLabel.heightAnchor.constraint(equalToConstant: heightInfoSubView).isActive = true
        yearCounterLabel.widthAnchor.constraint(equalToConstant: calculatedWidth).isActive = true
        
        // attach titleYearLabel
        yearCreatedView.addSubview(titleYearLabel)
        titleYearLabel.leftAnchor.constraint(equalTo: yearCreatedView.leftAnchor).isActive = true
        titleYearLabel.bottomAnchor.constraint(equalTo: yearCreatedView.bottomAnchor).isActive = true
        titleYearLabel.heightAnchor.constraint(equalToConstant: heightInfoView - heightInfoSubView).isActive = true
        titleYearLabel.widthAnchor.constraint(equalToConstant: calculatedWidth).isActive = true
        //---------------------------------------------------------------------------------------

        // MARK: - Layout repoView with subviews
        // setup repoView ---------------------------------------------------------------------
        basisViewOfCard.addSubview(repoView)
        repoView.leftAnchor.constraint(equalTo: yearCreatedView.rightAnchor, constant: indentBetweenSubViews).isActive = true
        repoView.bottomAnchor.constraint(equalTo: basisViewOfCard.bottomAnchor, constant: -6).isActive = true
        repoView.heightAnchor.constraint(equalToConstant: heightInfoView).isActive = true
        repoView.widthAnchor.constraint(equalToConstant: calculatedWidth).isActive = true
        
        // attach repoCounterView on repoView
        repoView.addSubview(repoCounterLabel)
        repoCounterLabel.leftAnchor.constraint(equalTo: repoView.leftAnchor).isActive = true
        repoCounterLabel.topAnchor.constraint(equalTo: repoView.topAnchor).isActive = true
        repoCounterLabel.heightAnchor.constraint(equalToConstant: heightInfoSubView).isActive = true
        repoCounterLabel.widthAnchor.constraint(equalToConstant: calculatedWidth).isActive = true
        
        // attach repoNameLabel on repoView
        repoView.addSubview(titleRepoLabel)
        titleRepoLabel.leftAnchor.constraint(equalTo: repoView.leftAnchor).isActive = true
        titleRepoLabel.bottomAnchor.constraint(equalTo: repoView.bottomAnchor).isActive = true
        titleRepoLabel.heightAnchor.constraint(equalToConstant: heightInfoView - heightInfoSubView).isActive = true
        titleRepoLabel.widthAnchor.constraint(equalToConstant: calculatedWidth).isActive = true
        //---------------------------------------------------------------------------------------
        
        // MARK: - Layout companyView with subviews
        // setup companyView --------------------------------------------------------------------
        basisViewOfCard.addSubview(starsView)
        starsView.leftAnchor.constraint(equalTo: titleRepoLabel.rightAnchor, constant: indentBetweenSubViews).isActive = true
        starsView.bottomAnchor.constraint(equalTo: basisViewOfCard.bottomAnchor, constant: -6).isActive = true
        starsView.heightAnchor.constraint(equalToConstant: heightInfoView).isActive = true
        starsView.widthAnchor.constraint(equalToConstant: calculatedWidth).isActive = true
        
        // attach nameOfCompanyLabel
        starsView.addSubview(starsCounterLabel)
        starsCounterLabel.leftAnchor.constraint(equalTo: starsView.leftAnchor).isActive = true
        starsCounterLabel.topAnchor.constraint(equalTo: starsView.topAnchor).isActive = true
        starsCounterLabel.heightAnchor.constraint(equalToConstant: heightInfoSubView).isActive = true
        starsCounterLabel.widthAnchor.constraint(equalToConstant: calculatedWidth).isActive = true
        
        // attach titleCompanyLabel
        starsView.addSubview(titleStarsLabel)
        titleStarsLabel.leftAnchor.constraint(equalTo: starsView.leftAnchor).isActive = true
        titleStarsLabel.bottomAnchor.constraint(equalTo: starsView.bottomAnchor).isActive = true
        titleStarsLabel.heightAnchor.constraint(equalToConstant: heightInfoView - heightInfoSubView).isActive = true
        titleStarsLabel.widthAnchor.constraint(equalToConstant: calculatedWidth).isActive = true
        //---------------------------------------------------------------------------------------
        
        // MARK: - Layout profLanguageView with subviews
        // setup profLanguageView ---------------------------------------------------------------
        basisViewOfCard.addSubview(profLanguagesView)
        profLanguagesView.leftAnchor.constraint(equalTo: starsView.rightAnchor, constant: indentBetweenSubViews).isActive = true
        profLanguagesView.bottomAnchor.constraint(equalTo: basisViewOfCard.bottomAnchor, constant: -6).isActive = true
        profLanguagesView.rightAnchor.constraint(equalTo: basisViewOfCard.rightAnchor, constant: -indentDefault).isActive = true
        profLanguagesView.heightAnchor.constraint(equalToConstant: heightInfoView).isActive = true
        profLanguagesView.widthAnchor.constraint(equalToConstant: calculatedWidth).isActive = true
        
        // attach languagesCounterLabel on languagesView
        profLanguagesView.addSubview(counterProfLanguagesLabel)
        counterProfLanguagesLabel.leftAnchor.constraint(equalTo: counterProfLanguagesLabel.leftAnchor).isActive = true
        counterProfLanguagesLabel.topAnchor.constraint(equalTo: counterProfLanguagesLabel.topAnchor).isActive = true
        counterProfLanguagesLabel.heightAnchor.constraint(equalToConstant: heightInfoSubView).isActive = true
        counterProfLanguagesLabel.widthAnchor.constraint(equalToConstant: calculatedWidth).isActive = true
        
        // attach titleLanguagesView on languagesView
        profLanguagesView.addSubview(titleProfLanguagesLabel)
        titleProfLanguagesLabel.leftAnchor.constraint(equalTo: profLanguagesView.leftAnchor).isActive = true
        titleProfLanguagesLabel.bottomAnchor.constraint(equalTo: profLanguagesView.bottomAnchor).isActive = true
        titleProfLanguagesLabel.heightAnchor.constraint(equalToConstant: heightInfoView - heightInfoSubView).isActive = true
        titleProfLanguagesLabel.widthAnchor.constraint(equalToConstant: calculatedWidth).isActive = true
        //---------------------------------------------------------------------------------------
    }
 
    
    // MARK: - Animation func
    // define labels animator --------------------------------------------------------------------------
    func animateViewsInsideCell(completionHanbler: @escaping (Bool) -> Void) {
        
        // define animation cellSubViews func
        func animatorCellSubViews(forView inputedView: UIView, withDelay inputedDelay: Double) {
            UIView.animate(withDuration: 1, delay: inputedDelay, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                inputedView.frame = CGRect(x: -400, y: 0, width: 0, height: 0)
                inputedView.alpha = 1
            })
        }
        
        // animate subViews inside cell
        animatorCellSubViews(forView: iconView, withDelay: 0.5)
        animatorCellSubViews(forView: decorationSolidLineView, withDelay: 0.5)
        animatorCellSubViews(forView: nameLabel, withDelay: 1.0)
        animatorCellSubViews(forView: companyView, withDelay: 1.5)
        animatorCellSubViews(forView: yearCreatedView, withDelay: 2.0)
        animatorCellSubViews(forView: repoView, withDelay: 2.1)
        animatorCellSubViews(forView: starsView, withDelay: 2.2)
        
        // animate profLanguagesView inside the cell
        UIView.animate(withDuration: 1, delay: 2.3, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.profLanguagesView.frame = CGRect(x: -100, y: 0, width: 0, height: 0)
            self.profLanguagesView.alpha = 1
        }) { _ in
            completionHanbler(true)
        }
    } // END animation func -------------------------------------------------------------------
    
    
    // defined update cell func ===============================================================
    func updateCell<T>(withData data: T, withScopeBarVariant scopeBarVariant: String, forIndexPath indexPath: IndexPath) {
        // ------------------------------------------------------------------------
        if scopeBarVariant == "Repositories" {
            guard let repoDetailOfSearchingResult = data as? SearchGitReposQLQuery.Data else { return }
            let nodes = repoDetailOfSearchingResult.search.nodes
            guard let nodesCount = nodes?.count else { return }
            guard indexPath.row < nodesCount else { return }
            let repo = nodes?[indexPath.row]?.asRepository?.fragments.repositoryDetail
            let imageLink = URL(string: repo?.owner.avatarUrl ?? "")
            // set values
            iconView.sd_setImage(with: imageLink, completed: nil)
            nameLabel.text = repo?.name
            nameCompanyLabel.text = repo?.owner.login
            yearCounterLabel.text = convertDate(fromISO_8601_UTC: repo?.createdAt ?? "", to: "MM/yyyy")
            repoCounterLabel.text = convertDate(fromISO_8601_UTC: repo?.pushedAt ?? "", to: "dd/MM/yy")
            starsCounterLabel.text = "\(repo?.stargazers.totalCount ?? 0)"
            counterProfLanguagesLabel.text = (repo?.primaryLanguage?.name != nil && repo?.primaryLanguage?.name != "") ? repo?.primaryLanguage?.name : "- - -"
        // ------------------------------------------------------------------------
        } else if scopeBarVariant == "Users" {
            guard let usersProfile = data as? SearchGitUsersQLQuery.Data else { return }
            let nodes = usersProfile.search.nodes
            guard let nodesCount = nodes?.count else { return }
            guard indexPath.row < nodesCount else { return }
            let userDetails = nodes?[indexPath.row]?.asUser?.fragments.userDetail
            let imageLink = URL(string: userDetails?.avatarUrl ?? "")
            // set values
            iconView.sd_setImage(with: imageLink, completed: nil)
            nameLabel.text = userDetails?.login
            nameCompanyLabel.text = (userDetails?.company != nil && userDetails?.company != "") ? userDetails?.company : "- - - - -"
            yearCounterLabel.text = convertDate(fromISO_8601_UTC: userDetails?.createdAt ?? "", to: "MM/yyyy")
            repoCounterLabel.text = "\(userDetails?.repositories.totalCount ?? 0)"
            starsCounterLabel.text = "\(starsCounter(fromUserProfile: userDetails))"
            counterProfLanguagesLabel.text = "\(languagesCounter(fromProfile: userDetails))"
        // ------------------------------------------------------------------------
        } else if scopeBarVariant == "Organizations" {
            guard let orgProfile = data as? SearchGitOrgsQLQuery.Data else { return }
            let nodes = orgProfile.search.nodes
            guard let nodesCount = nodes?.count else { return }
            guard indexPath.row < nodesCount else { return }
            let orgDetails = nodes?[indexPath.row]?.asOrganization?.fragments.orgDetail
            let imageLink = URL(string: orgDetails?.avatarUrl ?? "")
            
            iconView.sd_setImage(with: imageLink, completed: nil)
            nameLabel.text = orgDetails?.name
            nameCompanyLabel.text = (orgDetails?.websiteUrl != nil && orgDetails?.websiteUrl != "") ? orgDetails?.websiteUrl : "- - - - -"
            yearCounterLabel.text = orgDetails?.isVerified ?? false ? "Yes" : "No"
            repoCounterLabel.text = "\(orgDetails?.repositories.totalCount ?? 0)"
            starsCounterLabel.text = "\(orgDetails?.membersWithRole.totalCount ?? 0)"
            counterProfLanguagesLabel.text = "\(languagesCounter(fromProfile: orgDetails))"
        }
    } // =====================================================================================
    
    
    // counter languages from profile
    private func languagesCounter<T>(fromProfile profile: T) -> Int {
        var languages = Set<String>()
        
        if let userProfile = profile as? UserDetail {
            guard let repositories = userProfile.repositories.nodes else { return 0 }
            for repo in repositories {
                    languages.insert(repo?.primaryLanguage?.name ?? "")
            }
            
        } else if let organizationProfile = profile as? OrgDetail {
            guard let repositories = organizationProfile.repositories.nodes else { return 0}
            for repo in repositories {
                languages.insert(repo?.primaryLanguage?.name ?? "")
            }
        }
        
        let filteredLanguages = languages.filter { $0 != "" }
        return filteredLanguages.count
    }
    
    // counter stars of repositories, where user is owner
    private func starsCounter(fromUserProfile userProfile: UserDetail?) -> Int {
        var stars = 0
        guard let repoNodes = userProfile?.repositories.nodes else { return 0 }
        
        for repoNode in repoNodes {
            stars += (repoNode?.stargazers.totalCount)!
        }
        return stars
    }
    
    // format date from ISO-8601_UTC to current dd/mm/yy
    private func convertDate(fromISO_8601_UTC iso8601Str: String, to dateFormat: String) -> String? {
        // -------------------------------
        // https://nsdateformatter.com/
        // -------------------------------
        // iso8601 formatter
        let iso8601DateFormatter = DateFormatter()
        iso8601DateFormatter.calendar = Calendar(identifier: .iso8601)
        iso8601DateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ssZ"
        // custom formatter
        let customDateFormatter = DateFormatter()
        customDateFormatter.dateFormat = dateFormat
        if let iso8601 = iso8601DateFormatter.date(from: iso8601Str) {
            return customDateFormatter.string(from: iso8601)
        } else {
            return "- - -"
        }
    }
    
    // define set labels title func
    func setLabelsTitle(withSearchScopeBarVariant scopeBarVariant: String) {
        // set titles to labels based on searchScopeBar variant
        if scopeBarVariant == "Repositories" {
            iconView.image = UIImage(named: "EmptyFace.png")
            titleCompanyLabel.text = "Owner:  "
            titleYearLabel.text = "Created in"
            titleRepoLabel.text = "Last Push"
            titleStarsLabel.text = "★"
            titleProfLanguagesLabel.text = "Language"
            nameLabel.text = "- - - - -"
            nameCompanyLabel.text = "- - - - -"
            yearCounterLabel.text = "- - -"
            repoCounterLabel.text = "- - -"
            starsCounterLabel.text = "- - -"
            counterProfLanguagesLabel.text = "- - -"
            
        } else if scopeBarVariant == "Users" {
            iconView.image = UIImage(named: "EmptyFace.png")
            titleCompanyLabel.text = "Company:  "
            titleYearLabel.text = "Created in"
            titleRepoLabel.text = "Repositories"
            titleStarsLabel.text = "★"
            titleProfLanguagesLabel.text = "Languages"
            nameLabel.text = "- - - - -"
            nameCompanyLabel.text = "- - - - -"
            yearCounterLabel.text = "- - -"
            repoCounterLabel.text = "- - -"
            starsCounterLabel.text = "- - -"
            counterProfLanguagesLabel.text = "- - -"

        } else if scopeBarVariant == "Organizations" {
            iconView.image = UIImage(named: "EmptyFace.png")
            titleCompanyLabel.text = "WebSite:  "
            titleYearLabel.text = "isVerified"
            titleRepoLabel.text = "Repositories"
            titleStarsLabel.text = "Members"
            titleProfLanguagesLabel.text = "Languages"
            nameLabel.text = "- - - - -"
            nameCompanyLabel.text = "- - - - -"
            yearCounterLabel.text = "- - -"
            repoCounterLabel.text = "- - -"
            starsCounterLabel.text = "- - -"
            counterProfLanguagesLabel.text = "- - -"
            
        }
        
        // set font for some labels
        [yearCounterLabel, repoCounterLabel, starsCounterLabel, counterProfLanguagesLabel].forEach { $0.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.thin) }
        [titleCompanyLabel, titleYearLabel, titleRepoLabel, titleStarsLabel, titleProfLanguagesLabel].forEach { $0.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.thin)}
    }
    
}


