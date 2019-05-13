//
//  GitCardsTableViewCell.swift
//  GitScope
//
//  Created by vit on 5/10/19.
//  Copyright © 2019 vit. All rights reserved.
//

import UIKit

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
        icon.image = UIImage(named: "EmptyFace.jpg")
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
        name.text = "Apple.com/swift"
        name.alpha = 0
        name.font = name.font.withSize(26)
        return name
    }()
    
    // created decoration line under nameLabel
    var decorationSolidLineView: UIView = {
        let solidLine = UIView()
        solidLine.translatesAutoresizingMaskIntoConstraints = false
        solidLine.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return solidLine
    }()
    
    // MARK: - Created companyView under nameLabel
    // created company view bottom nameLabel
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
        nameLabel.text = "Apple.company"
        nameLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
        //nameLabel.font = nameLabel.font.withSize(12)
        return nameLabel
    }()
    // ========================================================================
    
    // MARK: - Created 4 bottom info views
    // created four bottom info views
    // ========================================================================
    var yearCreatedView: UIView = {
        let yearView = UIView()
        yearView.translatesAutoresizingMaskIntoConstraints = false
        yearView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        yearView.alpha = 0
        return yearView
    }()
    
    var repoView: UIView = {
        let repoView = UIView()
        repoView.translatesAutoresizingMaskIntoConstraints = false
        repoView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        repoView.alpha = 0
        return repoView
    }()

    var starsView: UIView = {
        let starsView = UIView()
        starsView.translatesAutoresizingMaskIntoConstraints = false
        starsView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        starsView.alpha = 0
        return starsView
    }()
    
    var profLanguagesView: UIView = {
        let languagesView = UIView()
        languagesView.translatesAutoresizingMaskIntoConstraints = false
        languagesView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        languagesView.alpha = 0
        return languagesView
    }()
    //=======================================================================
    
    // MARK: - Created subViews iside 4 bottom views
    // created views inside info views, bottom located
    //-----------------------------------------------------------------------
    var yearCounterLabel: UILabel = {
        let yearLabel = UILabel()
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        yearLabel.text = "1972"
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
    }()
    
     var repoCounterLabel: UILabel = {
        let counter = UILabel()
        counter.translatesAutoresizingMaskIntoConstraints = false
        counter.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        counter.text = "17"
        counter.textAlignment = .center
        return counter
    }()
    
    var titlePepoLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        nameLabel.text = "Repository"
        nameLabel.textAlignment = .center
        return nameLabel
    }()

    var starsCounterLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        name.text = "45"
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
    }()
    
    var counterProfLanguagesLabel: UILabel = {
        let profLanguages = UILabel()
        profLanguages.translatesAutoresizingMaskIntoConstraints = false
        profLanguages.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        profLanguages.text = "3"
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
    }()
    //-----------------------------------------------------------------------
    
    
    // MARK: - Layout all views
    // set layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        // define some properties to happen setup constraints
        let defaultIndent: CGFloat = 16
        let heightInfoView: CGFloat = 60
        let heightInfoSubView: CGFloat = 40
        let calculatedWidth: CGFloat = (self.frame.width - defaultIndent * 7) / 4
        
        // MARK: - Layout basisView with subviews
        // setup basis view, covered cell content view -----------------------------------------
        contentView.addSubview(basisViewOfCard)
        basisViewOfCard.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: defaultIndent).isActive = true
        basisViewOfCard.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        basisViewOfCard.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -defaultIndent).isActive = true
        basisViewOfCard.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        
        // attach to left iconView on basic view
        basisViewOfCard.addSubview(iconView)
        iconView.leftAnchor.constraint(equalTo: basisViewOfCard.leftAnchor, constant: defaultIndent).isActive = true
        iconView.topAnchor.constraint(equalTo: basisViewOfCard.topAnchor, constant: defaultIndent).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        // attach nameLabel on basis view
        basisViewOfCard.addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: defaultIndent).isActive = true
        nameLabel.topAnchor.constraint(equalTo: basisViewOfCard.topAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: basisViewOfCard.rightAnchor, constant: -defaultIndent).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: heightInfoView).isActive = true
        
        // attach decarationLine on basis view
        basisViewOfCard.addSubview(decorationSolidLineView)
        decorationSolidLineView.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: defaultIndent).isActive = true
        decorationSolidLineView.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        decorationSolidLineView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -10).isActive = true
        decorationSolidLineView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        // -------------------------------------------------------------------------------------
        
        // MARK: - Layout companyView with subviews
        // setup company view ------------------------------------------------------------------
        basisViewOfCard.addSubview(companyView)
        companyView.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: defaultIndent).isActive = true
        companyView.rightAnchor.constraint(equalTo: basisViewOfCard.rightAnchor, constant: -defaultIndent).isActive = true
        companyView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        companyView.heightAnchor.constraint(equalToConstant: defaultIndent).isActive = true
        
        // attach titleCompanyLabel on companyView
        companyView.addSubview(titleCompanyLabel)
        titleCompanyLabel.leftAnchor.constraint(equalTo: companyView.leftAnchor).isActive = true
        titleCompanyLabel.topAnchor.constraint(equalTo: companyView.topAnchor).isActive = true
        titleCompanyLabel.heightAnchor.constraint(equalTo: companyView.heightAnchor).isActive = true
        titleCompanyLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        // attach nameCompanyLabel on companyView
        companyView.addSubview(nameCompanyLabel)
        nameCompanyLabel.leftAnchor.constraint(equalTo: titleCompanyLabel.rightAnchor).isActive = true
        nameCompanyLabel.topAnchor.constraint(equalTo: companyView.topAnchor).isActive = true
        nameCompanyLabel.rightAnchor.constraint(equalTo: companyView.rightAnchor).isActive = true
        nameCompanyLabel.heightAnchor.constraint(equalTo: companyView.heightAnchor).isActive = true
        //---------------------------------------------------------------------------------------

        // MARK: - Layout createdYearView with subviews
        // setup createdInView ------------------------------------------------------------------
        basisViewOfCard.addSubview(yearCreatedView)
        yearCreatedView.leftAnchor.constraint(equalTo: basisViewOfCard.leftAnchor, constant: defaultIndent).isActive = true
        yearCreatedView.bottomAnchor.constraint(equalTo: basisViewOfCard.bottomAnchor, constant: -6).isActive = true
        yearCreatedView.heightAnchor.constraint(equalToConstant: heightInfoView).isActive = true
        yearCreatedView.widthAnchor.constraint(equalToConstant: (self.frame.width - defaultIndent * 7) / 4).isActive = true
        
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
        repoView.leftAnchor.constraint(equalTo: yearCreatedView.rightAnchor, constant: defaultIndent).isActive = true
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
        repoView.addSubview(titlePepoLabel)
        titlePepoLabel.leftAnchor.constraint(equalTo: repoView.leftAnchor).isActive = true
        titlePepoLabel.bottomAnchor.constraint(equalTo: repoView.bottomAnchor).isActive = true
        titlePepoLabel.heightAnchor.constraint(equalToConstant: heightInfoView - heightInfoSubView).isActive = true
        titlePepoLabel.widthAnchor.constraint(equalToConstant: calculatedWidth).isActive = true
        //---------------------------------------------------------------------------------------
        
        // MARK: - Layout companyView with subviews
        // setup companyView --------------------------------------------------------------------
        basisViewOfCard.addSubview(starsView)
        starsView.leftAnchor.constraint(equalTo: titlePepoLabel.rightAnchor, constant: defaultIndent).isActive = true
        starsView.bottomAnchor.constraint(equalTo: basisViewOfCard.bottomAnchor, constant: -6).isActive = true
        starsView.heightAnchor.constraint(equalToConstant: heightInfoView).isActive = true
        starsView.widthAnchor.constraint(equalToConstant: (self.frame.width - defaultIndent * 7) / 4).isActive = true
        
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
        profLanguagesView.leftAnchor.constraint(equalTo: starsView.rightAnchor, constant: defaultIndent).isActive = true
        profLanguagesView.bottomAnchor.constraint(equalTo: basisViewOfCard.bottomAnchor, constant: -6).isActive = true
        profLanguagesView.heightAnchor.constraint(equalToConstant: heightInfoView).isActive = true
        profLanguagesView.widthAnchor.constraint(equalToConstant: (self.frame.width - defaultIndent * 7) / 4).isActive = true
        
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
    
}

