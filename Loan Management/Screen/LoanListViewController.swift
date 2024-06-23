//
//  ViewController.swift
//  Loan Management
//
//  Created by Wahyu Alfandi on 23/06/24.
//

import UIKit

class LoanListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        getLoans()
    }
    
    private func configure(){
        view.backgroundColor = .systemBackground
        
        createFilterNavigationItemButton()
    }
    
    
    func createFilterNavigationItemButton(){
        let filterButton = UIBarButtonItem(image: UIImage(named: "line.3.horizontal.decrease.circle.fill"), style: .plain, target: self, action: #selector(filter))
        navigationItem.rightBarButtonItem = filterButton
    }
    
    @objc func filter(){
        print("filter")
    }
    
    func getLoans(){
        NetworkManager.shared.getLoans { result in
            switch(result){
                case .success(let loans):
                    print(loans.count)
                    print(loans)
                case .failure(let error):
                    print(error.rawValue)
            }
        }
    }


}

