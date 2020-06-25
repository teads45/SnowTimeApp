//
//  matchStars.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/24/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//
/*
import Foundation
import UIKit

 @IBDesignable class matchStars: UIStackView{

    //MARK: Properties
    var
    private var ratingMatchimage = [UIImage]()
     
    var rating = 0{
        didSet {
               updateButtonSelectionStates()
           }
    }
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0)
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
//MARK: Initialization - add below algos to attach correct stars
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupButtons()
    }
        required init(coder:NSCoder){
            super.init(coder:coder)
            setupButtons()
        }
    
    //MARK: Button Action
    @objc func ratingMatchButton(button: UIButton) {
    guard let index = ratingMatchButtons.firstIndex(of: button) else {
            fatalError("The button, \(button), is not in the ratingMatchButtons array: \(ratingMatchButtons)")
        }
        
        // Calculate the rating of the selected button
        let algoRating = index + 1
        
        if algoRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
             // Otherwise set the rating to the selected star
            rating = algoRating
        }
    }
    
    //MARK: Private Methods
    private func setupButtons(){
        //hard coded for now... should return match level
        for button in ratingMatchButtons{
            removeArrangedSubview(button)
                button.removeFromSuperview()
            }
            ratingMatchButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
      

        for _ in 0..<starCount {
            //create the button
            let button = UIButton()
            
            // Set the button image
            button.setImage(filledStar, for: .selected)
            
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
    
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingMatchButtons.append(button)
        }
        updateButtonSelectionStates()
    }
    private func updateButtonSelectionStates() {
        for (index, button) in ratingMatchButtons.enumerated() {
              // If the index of a button is less than the rating, that button should be selected.
              button.isSelected = index < rating
          }
    }
}







//MARK: Algorithm to choose how many stars
class MatchType {
    
}
*/
