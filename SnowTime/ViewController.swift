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
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var UsernameLabel: UILabel!
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field’s user input through delegate callbacks.
        //The self refers to the ViewController class, because it’s referenced inside the scope of the ViewController class definition.
        nameTextField.delegate = self
         
    
        /*
        func SwitchViewController(_ sender: Any) {
           }
         func usernameField(_ sender: Any) {
             }
             
         func passwordField(_ sender: Any) {
             }
    }
     func prepare(for segue: UIStoryboardSegue, sender: UIButton?) {
        if segue.identifier=="PhotoDetail"{
             let ViewController = segue.destination  as! viewControllerTwo
            else {self.return}
        }
    }
    
    @IBAction func SwitchViewController(_ sender: Any) {
    }
     @IBAction func usernameField(_ sender: Any) {
      }
      
      @IBAction func passwordField(_ sender: Any) {
      }*/
        
        
        
        
        
        
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
