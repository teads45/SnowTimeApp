//
//  RatingControl.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/18/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//
 
import UIKit
import CoreLocation
class viewControllerTwo: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var mainHeaderLabel: UILabel!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    @IBOutlet weak var ratingLabel: UILabel!

    @IBOutlet weak var pickerView: UIPickerView!
    
    let filter = ["Price", "Rating", "Distance"]

// testing location services
var locationManager = CLLocationManager()

override func viewDidLoad() {
  super.viewDidLoad()
    pickerView.delegate = self
    pickerView.dataSource = self
    locationManager.requestWhenInUseAuthorization()

    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filter.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return filter[row]
    }

}












 @IBDesignable class RatingControlValue: UIStackView {

    //MARK: Properties
    private var ratingButtons = [UIButton]()
    @IBOutlet weak var PriceRangeTextLabel: UILabel!
    
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
    @objc func ratingButtonTapped(button: UIButton) {
    guard let index = ratingButtons.firstIndex(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
    }
    
    //MARK: Private Methods
    private func setupButtons(){
        //clear existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let selectedStar = UIImage(named:"selectedStar", in: bundle, compatibleWith: self.traitCollection)

        for _ in 0..<starCount {
            //create the button
            let button = UIButton()
            
            // Set the button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(selectedStar, for: .highlighted)
            button.setImage(selectedStar, for: [.highlighted, .selected])
            
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControlValue.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
        updateButtonSelectionStates()
    }
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
              // If the index of a button is less than the rating, that button should be selected.
              button.isSelected = index < rating
          }
    }
}

@IBDesignable class RatingControlSnow: UIStackView{

    //MARK: Properties
    private var ratingButtons = [UIButton]()
    @IBOutlet weak var snowQualityTextLabel: UILabel!
    
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
    @objc func ratingButtonTapped(button: UIButton) {
    guard let index = ratingButtons.firstIndex(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
    }
    
    //MARK: Private Methods
    private func setupButtons(){
        //clear existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let selectedStar = UIImage(named:"selectedStar", in: bundle, compatibleWith: self.traitCollection)

        for _ in 0..<starCount {
            //create the button
            let button = UIButton()
            
            // Set the button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(selectedStar, for: .highlighted)
            button.setImage(selectedStar, for: [.highlighted, .selected])
            
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControlSnow.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
        updateButtonSelectionStates()
    }
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
              // If the index of a button is less than the rating, that button should be selected.
              button.isSelected = index < rating
          }
    }
}

@IBDesignable class RatingControlWaitTime: UIStackView{

    //MARK: Properties
    private var ratingButtons = [UIButton]()
     
    @IBOutlet weak var WaitTimeLabel: UILabel!
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
    @objc func ratingButtonTapped(button: UIButton) {
    guard let index = ratingButtons.firstIndex(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
    }
    
    //MARK: Private Methods
    private func setupButtons(){
        //clear existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let selectedStar = UIImage(named:"selectedStar", in: bundle, compatibleWith: self.traitCollection)

        for _ in 0..<starCount {
            //create the button
            let button = UIButton()
            
            // Set the button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(selectedStar, for: .highlighted)
            button.setImage(selectedStar, for: [.highlighted, .selected])
            
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControlWaitTime.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
        updateButtonSelectionStates()
    }
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
              // If the index of a button is less than the rating, that button should be selected.
              button.isSelected = index < rating
          }
    }
}

