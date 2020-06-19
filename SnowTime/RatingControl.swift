//
//  RatingControl.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/18/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
//MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupButtons()
    }
        required init(coder:NSCoder){
            super.init(coder:coder)
            setupButtons()
        }
    
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }
    
    //MARK: Private Methods
    private func setupButtons(){
        
        //create the button
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        
        // Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        // Setup the button action
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        
        // Add the button to the stack
        addArrangedSubview(button)
    }
    
}


