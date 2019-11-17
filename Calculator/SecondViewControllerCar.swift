//
//  SecondViewControllerCar.swift
//  Calculator
//
//  Created by Lawrence Deng on 11/17/19.
//  Copyright © 2019 Lawrence Deng. All rights reserved.
//

import UIKit

class SecondViewControllerCar: UIViewController {
    
    //Textbox for information
    @IBOutlet weak var textBox: UILabel!
    
    //Variables from previous View Controller
    var finalIncome = "" //income
    var finalCredit = "" //credit score
    var finalPayback = "" //months to pay back
    var finalDown = "" //expected down payment
    var finalNewold = "" //new or used car
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let myIncome = finalIncome
        let a = Double(myIncome) ?? 0
        
        let myCredit = finalCredit
        let b = Double(myCredit) ?? 0
        
        let myLoan = finalPayback
        let c = Double(myLoan) ?? 0
        
        let myDownPayment = finalDown
        let d = Double(myDownPayment) ?? 0
        
        let monthlyCarPayments = a / 12.0 * 0.1
        
        let annualInterestRate = (0.0 - 0.0303) * b + 27.7
        
        let monthsPayment = c
        
        let monthlyInterestRate = annualInterestRate / 12.0 / 100.0
        
        let mortgageConstant = (monthlyInterestRate * (pow((1 + monthlyInterestRate), monthsPayment))) / ((pow((1 + monthlyInterestRate), monthsPayment)) - 1)
        
        let valueLoan = monthlyCarPayments / mortgageConstant
        
        let valueCar = valueLoan + d
        
        let StringTotal = String(valueCar)
        
        textBox.text = StringTotal
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
