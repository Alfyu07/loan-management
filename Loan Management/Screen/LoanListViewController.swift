//
//  ViewController.swift
//  Loan Management
//
//  Created by Wahyu Alfandi on 23/06/24.
//

import UIKit

class LoanListViewController: UIViewController {
    var tableView = UITableView()
    var loans : [Loan] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getLoans()
        view.backgroundColor = .systemBackground
        createFilterNavigationItemButton()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getLoans()
    }
    
    func configureTableView(){
        
        // add view to vc
        view.addSubview(tableView)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        // set the delegate
        tableView.delegate = self
        tableView.dataSource = self
        //set tableView rowHeight
        tableView.rowHeight = 115
        
        //set tableview constraints
        tableView.register(LoanCell.self, forCellReuseIdentifier: LoanCell.reuseID)
        tableView.pin(to: view)
    }
    
    func createFilterNavigationItemButton(){
        let filterButton = UIBarButtonItem(image: UIImage(named: "magnifyingglass.circle.fill"), style: .plain, target: self, action: #selector(filter))
        navigationItem.rightBarButtonItem = filterButton
    }
    
    @objc func filter(){
        print("filter")
    }
    
    func getLoans(){
        NetworkManager.shared.getLoans { [weak self] result in
            guard let self = self else {return}
            
            switch(result){
                case .success(let loans):
                    if loans.isEmpty {
                        print("Loans Kosong")
                    }else{
                        self.loans = loans
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            self.view.bringSubviewToFront(self.tableView)
                        }
                    }
                    
                case .failure(let error):
                    print(error.rawValue)
            }
        }
    }
}

extension LoanListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LoanCell.reuseID) as! LoanCell
        
        let loan = loans[indexPath.row]
        cell.set(loan: loan)
        return cell
    }
    
    
}
