//
//  SecondViewController.swift
//  Calculator
//
//  Created by Lawrence Deng on 11/16/19.
//  Copyright © 2019 Lawrence Deng. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //array of state names in order
    var stateArray = ["Hawaii","Alabama","Louisiana","Colorado","District of Columbia","Delaware","South Carolina","West Virginia","Wyoming","Arkansas","Utah","Nevada","Arizona","Tennessee","Idaho","California","new Mexico","Virgina","Mississippi","Montana","North Carolina","Kentucky","Indiana","Oklahoma","Georgia","Florida","Missouri","North Dakota","Washington","Oregon","Maryland","Minnesota","Alaska","Massachusetts","South Dakota","Maine","Kansas","Iowa","Ohio","Pennsylvania","Michigan","Rhode Island","New York","Nebraska","Texas","Vermont","Wisconsin","Connecticut","New Hampshire","Illinois","New Jersey"]
    
    //array of state taxes in order
    var taxArray = [0.00270,0.00420,0.00520,0.00550,0.00550,0.00560,0.00570,0.00590,0.00610,0.00630,0.00660,0.00690,0.00720,0.00740,0.00750,0.00770,0.00780,0.00800,0.00800,0.00840,0.00860,0.00860,0.00870,0.00900,0.00910,0.00980,0.00990,0.01010,0.01030,0.01040,0.01100,0.01150,0.01190,0.01220,0.01320,0.01350,0.01400,0.01530,0.01570,0.01580,0.01640,0.01660,0.01680,0.01800,0.01830,0.01830,0.01940,0.02070,0.02200,0.02310,0.02440]

    //Textboxes with information
    @IBOutlet weak var nameLabel: UILabel!
    
    //Variables from previous View Controller
    var finalName = "" //income
    var finalCredit = "" //credit score
    var finalLoan = "" //loan duration
    var finalState = "" //state location
    var finalExpenses = "" //average expenses
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //indexing of arrays
        let IndexState = stateArray.firstIndex(of: finalState) ?? 0
        let FinalizedStateTax = taxArray[IndexState]
        
        let myIncome = finalName
        let a = Double(myIncome) ?? 0
        
        let myCredit = finalCredit
        let b = Double(myCredit) ?? 0
        
        let myLoan = finalLoan
        let c = Double(myLoan) ?? 0
        
        let myState = finalState
        let d = Double(myState) ?? 0
        
        let myExpenses = finalExpenses
        let e = Double(myExpenses) ?? 0
        
        let percentIncomeHousing = 0.36 - e / (a / 12.0)
        
        let homeRelatedDebts = a / 12.0 * percentIncomeHousing
        
        let millRate = FinalizedStateTax / 10
        
        let homeownersInsurance = 100.0
        
        let annualQuad = (pow(b, 2.0)) / 100000.0
        
        let annualInterestRate = 3.22 + 0.011 * b + (0.0 - 1.23) * annualQuad
        
        let monthsPayment = c * 12.0
        
        let monthlyInterestRate = annualInterestRate / 12.0 / 100.0
        
        let mortgageConstant = (monthlyInterestRate * (pow((1 + monthlyInterestRate), monthsPayment))) / ((pow((1 + monthlyInterestRate), monthsPayment)) - 1)
        
        let valueHome = (homeRelatedDebts - homeownersInsurance) / (millRate + 0.8 * mortgageConstant)
        
        let StringTotal = String(valueHome)
        
        nameLabel.text = StringTotal
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
