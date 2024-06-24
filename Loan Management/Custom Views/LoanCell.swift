//
//  LoanCell.swift
//  Loan Management
//
//  Created by Wahyu Alfandi on 24/06/24.
//

import UIKit

class LoanCell: UITableViewCell {
    static let reuseID = "LoanCell"
    
    let amountLabel =  LMTitleLabel(textAlignment: .left)
    let termLabel = LMCalloutLabel(textAlignment: .left)
    let riskRatingLabel = LMTitleLabel(textAlignment: .center)
    let rateLabel = LMCalloutLabel(textAlignment: .left)
    let borrowerNameLabel = LMTitleLabel(textAlignment: .left)
    let purposeLabel = LMCalloutLabel(textAlignment: .left)
    
    let mainContainer = UIView()
    let topContainer = UIView()
    let bottomContainer = UIView()
    let amountAndTermStackView = UIStackView()
    let riskAndRateStackView = UIStackView()
    let divider = UIView()
    
    let padding: CGFloat = 12
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(loan: Loan){
        amountLabel.text = "Rp\(loan.amount),-"
        termLabel.text = "Jangka waktu \(loan.term) bulan"
        riskRatingLabel.text = loan.riskRating
        rateLabel.text = "\(loan.interestRate)% rate"
        borrowerNameLabel.text = loan.borrower.name
        purposeLabel.text = loan.purpose
    }
    
    func configure(){
        configureMainContainer()
        configureTopContainer()
        configureAmountAndTermStackView()
        configureRiskAndRateStackView()
        configureBottomContainer()
        configureDivider()
    }
    
    func configureMainContainer(){
        addSubview(mainContainer)
        mainContainer.layer.cornerRadius = 12
        mainContainer.layer.borderColor = UIColor.tertiaryLabel.cgColor
        mainContainer.layer.borderWidth = 2
        mainContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor,constant: padding),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            mainContainer.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding/2)
        ])
    }
    
    func configureTopContainer(){
        mainContainer.addSubview(topContainer)
        topContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topContainer.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: padding),
            topContainer.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: padding),
            topContainer.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -padding),
        ])
    }
    
    func configureAmountAndTermStackView(){
        topContainer.addSubview(amountAndTermStackView)
        amountAndTermStackView.axis = .vertical
        amountAndTermStackView.distribution = .fill
        amountAndTermStackView.addArrangedSubview(amountLabel)
        amountAndTermStackView.addArrangedSubview(termLabel)
        
        amountAndTermStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            amountAndTermStackView.leadingAnchor.constraint(equalTo: topContainer.leadingAnchor),
            amountAndTermStackView.heightAnchor.constraint(equalToConstant: 41),
        ])
    }
    
    func configureRiskAndRateStackView(){
        topContainer.addSubview(riskAndRateStackView)
        riskAndRateStackView.axis = .vertical
        riskAndRateStackView.distribution = .fill
        
        riskAndRateStackView.addArrangedSubview(riskRatingLabel)
        riskAndRateStackView.addArrangedSubview(rateLabel)
        
        riskAndRateStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            riskAndRateStackView.trailingAnchor.constraint(equalTo: topContainer.trailingAnchor),
            riskAndRateStackView.leadingAnchor.constraint(equalTo: amountAndTermStackView.trailingAnchor),
            riskAndRateStackView.heightAnchor.constraint(equalToConstant: 41),
        ])
    }
    
    func configureBottomContainer(){
        mainContainer.addSubview(bottomContainer)
        
        bottomContainer.backgroundColor = .systemBlue
        bottomContainer.addSubview(borrowerNameLabel)
        bottomContainer.addSubview(purposeLabel)
        
        bottomContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomContainer.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor, constant: -padding),
            bottomContainer.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: padding),
            bottomContainer.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -padding),
            
            borrowerNameLabel.leadingAnchor.constraint(equalTo:  bottomContainer.leadingAnchor),
            borrowerNameLabel.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor),
            
            purposeLabel.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor),
            
            purposeLabel.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor)
        ])
    }
    
    func configureDivider(){
        mainContainer.addSubview(divider)
        divider.backgroundColor = .systemGray5
        divider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            divider.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -padding),
            divider.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: padding),
            divider.topAnchor.constraint(equalTo: riskAndRateStackView.bottomAnchor, constant: 6),
            divider.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    
}
