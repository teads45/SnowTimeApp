//
//  ViewController.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/17/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//

import UIKit

//class MyViewController: UIViewController{}
class ViewController: UIViewController, UITextFieldDelegate {
  
    
    //MARK: Properties
   
    
    @IBAction func segueToYelpResults(_ sender: Any) {
    }
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var UsernameLabel: UILabel!
    @IBAction func createAnAccount(_ sender: Any) {
    }
    
    
 /*   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let yelpTableViewController = segue.destination
             as? yelpTableViewController else {
           return
         }
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field’s user input through delegate callbacks.
        //The self refers to the ViewController class, because it’s referenced inside the scope of the ViewController class definition.
        nameTextField.delegate = self
        
        
    //MARK: UITextFieldDelegate
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            return true
        }
        func textFieldDidEndEditing(_ textField: UITextField) {
            UsernameLabel.text = textField.text
        }
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
    //MARK:Actions
    
    }
        

}
