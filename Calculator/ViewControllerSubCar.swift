//
//  ViewControllerSubCar.swift
//  Calculator
//
//  Created by Lawrence Deng on 11/17/19.
//  Copyright © 2019 Lawrence Deng. All rights reserved.
//

import UIKit

//These are all the input objects from the screen
class ViewControllerSubCar: UIViewController {
    @IBOutlet weak var incomeField: UITextField!
    @IBOutlet weak var creditField: UITextField!
    @IBOutlet weak var paybackField: UITextField!
    @IBOutlet weak var downField: UITextField!
    @IBOutlet weak var newoldField: UITextField!
    
    //Text from the previous objects
    var incomeText = ""
    var creditText = ""
    var paybackText = ""
    var downText = ""
    var newoldText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    //Converts data to be sent to SecondViewControllerCar.swift
    @IBAction func calculate(_ sender: Any) {
        self.incomeText = incomeField.text!
        self.creditText = creditField.text!
        self.paybackText = paybackField.text!
        self.downText = downField.text!
        self.newoldText = newoldField.text!
        performSegue(withIdentifier: "gotoCARR", sender: self)
    }
    
    //"Go Back" Button
    @IBAction func backCar(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //Sends information to SecondViewControllerCar.swift
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! SecondViewControllerCar
        vc.finalIncome = self.incomeText
        vc.finalCredit = self.creditText
        vc.finalPayback = self.paybackText
        vc.finalDown = self.downText
        vc.finalNewold = self.newoldText
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
