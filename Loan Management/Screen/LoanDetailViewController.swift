//
//  LoanDetailViewController.swift
//  Loan Management
//
//  Created by Wahyu Alfandi on 23/06/24.
//

import UIKit

class LoanDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
//        createFilterNavigationItemButton()
    }
    
    private func configure(){
       
    }
    
//    func createFilterNavigationItemButton(){
//        let filterButton = UIBarButtonItem(image: UIImage(named: "magnifyingglass.circle.fill"), style: .plain, target: self, action: #selector(filter))
//        navigationItem.rightBarButtonItem = filterButton
//    }
    
    @objc func filter(){
        print("filter")
    }
}


