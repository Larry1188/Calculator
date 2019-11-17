//
//  ViewControllerSub.swift
//  Calculator
//
//  Created by Lawrence Deng on 11/16/19.
//  Copyright © 2019 Lawrence Deng. All rights reserved.
//

import UIKit

//This hides the keyboard when the screen is tapped
extension UIViewController{
    
    func HideKeyboard() {
        
        //Allows user to escape keyboard input
        let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self , action: #selector(DismissKeyboard))
        
        view.addGestureRecognizer(Tap)
    }
    
    @objc func DismissKeyboard(){
        
        view.endEditing(true)
    }
}

//These are all the input objects from the screen
class ViewControllerSub: UIViewController {
    @IBOutlet weak var incomeField: UITextField!
    @IBOutlet weak var creditField: UITextField!
    @IBOutlet weak var loanField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var expensesField: UITextField!
    
    //Text from the previous objects
    var nameText = ""
    var creditText = ""
    var loanText = ""
    var stateText = ""
    var expensesText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.HideKeyboard()
        // Do any additional setup after loading the view.
    }
        
    //Converts data to be sent to SecondViewController.swift
    @IBAction func calculate(_ sender: Any) {
        self.nameText = incomeField.text!
        self.creditText = creditField.text!
        self.loanText = loanField.text!
        self.stateText = stateField.text!
        self.expensesText = expensesField.text!
        performSegue(withIdentifier: "name", sender: self)
    }
    
    //"Go Back" Button
    @IBAction func goback(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //Sends information to SecondViewController.swift
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! SecondViewController
        vc.finalName = self.nameText
        vc.finalCredit = self.creditText
        vc.finalLoan = self.loanText
        vc.finalState = self.stateText
        vc.finalExpenses = self.expensesText
    }
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
