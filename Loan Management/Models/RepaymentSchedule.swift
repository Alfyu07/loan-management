//
//  RepaymentSchedule.swift
//  Loan Management App
//
//  Created by Wahyu Alfandi on 23/06/24.
//

import Foundation

struct RepaymentSchedule: Codable{
    var installments: [Installment]?
}

struct Installment: Codable{
    var dueDate: String
    var amountDue: Int
}
