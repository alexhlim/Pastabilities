//
//  CustomRecipeViewController.swift
//  Recipe Generator
//
//  Created by Alexander Lim on 2/18/18.
//  Copyright © 2018 Alexander Lim. All rights reserved.
//

import UIKit

class CustomRecipeViewController: UIViewController {

    
    @IBOutlet weak var pastaField: UITextField!
    @IBOutlet weak var meatField: UITextField!
    @IBOutlet weak var sauceField: UITextField!
    @IBOutlet weak var herbField: UITextField!
    @IBOutlet weak var cheeseField: UITextField!
  
    @IBAction func pastaFieldPressed(_ sender: Any) {
        pastaField.addTarget(self, action: #selector(CustomRecipeViewController.pastaTextFieldDidChange(_:)),
                             for: UIControlEvents.editingChanged)
    }
    @IBAction func pastaTextFieldDidChange(_ sender: Any) {
        currentRecipe.pasta = pastaField.text!
    }
    @IBAction func meatFieldPressed(_ sender: Any) {
        meatField.addTarget(self, action: #selector(CustomRecipeViewController.meatTextFieldDidChange(_:)),
                            for: UIControlEvents.editingChanged)
    }
    @IBAction func meatTextFieldDidChange(_ sender: Any) {
         currentRecipe.meat = meatField.text!
    }
    
    @IBAction func sauceFieldPressed(_ sender: Any) {
        sauceField.addTarget(self, action: #selector(CustomRecipeViewController.sauceTextFieldDidChange(_:)),
                            for: UIControlEvents.editingChanged)
    }
    @IBAction func sauceTextFieldDidChange(_ sender: Any) {
        currentRecipe.sauce = sauceField.text!
    }
    
    @IBAction func herbFieldPressed(_ sender: Any) {
        herbField.addTarget(self, action: #selector(CustomRecipeViewController.herbTextFieldDidChange(_:)),
                             for: UIControlEvents.editingChanged)
    }
    @IBAction func herbTextFieldDidChange(_ sender: Any) {
        currentRecipe.herb = herbField.text!
    }
    
    @IBAction func cheeseFieldPressed(_ sender: Any) {
        cheeseField.addTarget(self, action: #selector(CustomRecipeViewController.cheeseTextFieldDidChange(_:)),
                            for: UIControlEvents.editingChanged)
    }
    @IBAction func cheeseTextFieldDidChange(_ sender: Any) {
        currentRecipe.cheese = cheeseField.text!
    }
    
    
    
    
    @IBAction func submitButton(_ sender: Any) {
    customRecipe = true
       self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.jpeg")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }



}
