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

class GitCardsTableViewController: UITableViewController {
    
    private let cellId = "Cell"
    private var greatherIndex = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        // setup tableView
        view.backgroundColor = #colorLiteral(red: 0.9082065659, green: 0.9707477169, blue: 0.9541269933, alpha: 1)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        // register the Cell
        tableView.register(GitCardsTableViewCell.self, forCellReuseIdentifier: cellId)
        // call navBarGradient func
        setNavBarGradient()
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
    
    
    // set hieght for row
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // set numbers of rows in table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // reuse the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! GitCardsTableViewCell
        
        // perform animation on views inside cell
        viewsTransform(cell.iconView, cell.decorationSolidLineView, cell.nameLabel, cell.companyView, cell.yearCreatedView, cell.repoView, cell.starsView, cell.profLanguagesView, withIndex: indexPath)

        // set font some labels
        [cell.yearCounterLabel, cell.repoCounterLabel, cell.starsCounterLabel, cell.counterProfLanguagesLabel].forEach { $0.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.thin) }
        [cell.titleCompanyLabel, cell.titleYearLabel, cell.titlePepoLabel, cell.titleStarsLabel, cell.titleProfLanguagesLabel].forEach { $0.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.thin)}
        
        return cell
    }
    
    
    // define animation func -------------------------------------------------------------------------------------------------------
    private func viewsTransform(_ view1: UIView, _ view2: UIView, _ view3: UIView, _ view4: UIView, _ view5: UIView, _ view6: UIView, _ view7: UIView, _ view8: UIView, withIndex indexPath: IndexPath) {

        // if statement need for does not repeat animation
        if indexPath.row > greatherIndex {
            greatherIndex = indexPath.row

            // animate view1
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                view1.frame = CGRect(x: -100, y: 0, width: 0, height: 0)
                view1.alpha = 1
            })

            // animate view2
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1 ,options: .curveEaseOut, animations: {
                view2.frame = CGRect(x: -100, y: 0, width: 0, height: 0)
                view2.alpha = 1
            })
            
            // anamete view3
            UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                view3.frame = CGRect(x: -100, y: 0, width: 0, height: 0)
                view3.alpha = 1
            })
            
            // animate view4
            UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                view4.frame = CGRect(x: -100, y: 0, width: 0, height: 0)
                view4.alpha = 1
            })
            
            // aniwane view5
            UIView.animate(withDuration: 1, delay: 1.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                view5.frame = CGRect(x: -100, y: 0, width: 0, height: 0)
                view5.alpha = 1
            })
            
            // anamate view6
            UIView.animate(withDuration: 1, delay: 1.6, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                view6.frame = CGRect(x: -100, y: 0, width: 0, height: 0)
                view6.alpha = 1
            })
            
            // animate view7
            UIView.animate(withDuration: 1, delay: 1.7, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                view7.frame = CGRect(x: -100, y: 0, width: 0, height: 0)
                view7.alpha = 1
            })

            // animate view8
            UIView.animate(withDuration: 1, delay: 1.8, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                view8.frame = CGRect(x: -100, y: 0, width: 0, height: 0)
                view8.alpha = 1
            })
            
        } // end 'if' statement
        
    } // END animate func -------------------------------------------------------------------------------------------------

    
    
}
