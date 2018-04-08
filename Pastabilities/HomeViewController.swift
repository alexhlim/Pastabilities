//
//  ViewController.swift
//  Recipe Generator
//
//  Created by Alexander Lim on 1/15/18.
//  Copyright © 2018 Alexander Lim. All rights reserved.
//

import UIKit

var currentRecipe = Recipe()
var ingredient = IngredientsLists();

var randomMeatIndex = 0
var randomHerbsIndex = 0
var randomPastaIndex = 0
var randomSauceIndex = 0
var randomCheeseIndex = 0

var recipeDisplayed = false
var customRecipe = false

class HomeViewController: UIViewController {
    
    

    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var seeRecipeButton: UIButton!
    @IBOutlet weak var customRecipeButton: UIButton!
    
    @IBOutlet weak var randomRecipeButton: UIButton!
    
    override func viewDidLoad() {
        customRecipeButton.layer.borderColor = UIColor.black.cgColor
        randomRecipeButton.layer.borderColor = UIColor.black.cgColor
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.jpeg")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (customRecipe == true){
            self.generateRecipe(nil)
        }
        fillOutIngredients(currentRecipe: currentRecipe)
    }

    @IBAction func generateRecipe(_ sender: AnyObject?) {
        if (customRecipe == false){
            currentRecipe = makeNewRecipe()
        }
        
        recipeLabel.text = currentRecipe.pasta + " with " + currentRecipe.sauce + ", " + currentRecipe.herb + ", " + currentRecipe.meat + ", and " + currentRecipe.cheese
        recipeLabel.numberOfLines = 0
        
//        seeRecipeButton.setTitle("See Recipe", for: UIControlState.normal)
        let image = UIImage(named: "seeRecipeArrow.png") as UIImage?
        seeRecipeButton.setBackgroundImage(image, for: UIControlState.normal)

        
        recipeDisplayed = true
        customRecipe = false
        
        
    }
    
    func makeNewRecipe() -> Recipe {
        
        randomMeatIndex = Int(arc4random_uniform(UInt32(ingredient.meatList.count)))
        //var randomSeafoodIndex = Int(arc4random_uniform(UInt32(seafood.count)))
        randomHerbsIndex = Int(arc4random_uniform(UInt32(ingredient.herbsList.count)))
        randomPastaIndex = Int(arc4random_uniform(UInt32(ingredient.pastaList.count)))
        randomSauceIndex = Int(arc4random_uniform(UInt32(ingredient.sauceList.count)))
        randomCheeseIndex = Int(arc4random_uniform(UInt32(ingredient.cheeseList.count)))
    
        currentRecipe.meat = ingredient.meatList[randomMeatIndex]
        currentRecipe.herb = ingredient.herbsList[randomHerbsIndex]
        currentRecipe.pasta = ingredient.pastaList[randomPastaIndex]
        currentRecipe.sauce = ingredient.sauceList[randomSauceIndex]
        currentRecipe.cheese = ingredient.cheeseList[randomCheeseIndex]
        fillOutIngredients(currentRecipe: currentRecipe)
        
        
        return currentRecipe
    }
    
    
    @IBAction func seeRecipe(_ sender: Any) {
//        if (recipeDisplayed == true){
//            performSegue(withIdentifier: "toRecipe", sender: self)
//        }
       
    }
    
    func fillOutIngredients(currentRecipe: Recipe) -> Void{
        currentRecipe.recipeIngredients = [String]()
        var meatIngredients = [String]()
        switch currentRecipe.meat{
            case "Chicken":
                meatIngredients.append("2 Chicken Thighs")
            case "Gound Beef":
                meatIngredients.append("1/4 Lb. Ground Beef")
            case "Ground Pork":
                meatIngredients.append("1/4 Lb. Ground Pork")
            case "Sausage":
                meatIngredients.append("1/4 Lb. Sausage")
            case "Bacon":
                meatIngredients.append("5 Slices of Bacon (Cut into Strips)")
            case "Turkey":
                meatIngredients.append("5 Slices of Turkey (Cut into Strips)")
            case "Ham":
                meatIngredients.append("5 Slices of Ham(Cut into Strips)")
            default:
                meatIngredients.append(currentRecipe.meat)
        }
        
        currentRecipe.recipeIngredients += meatIngredients
        
        var sauceIngredients = [String]()
        var prepTime: Int
        var cookTime: Int
        switch currentRecipe.sauce {
            case "Garlic Tomato Sauce":
                sauceIngredients.append("2 Cloves of Garlic")
                sauceIngredients.append("28 Oz. Can of Tomato")
                sauceIngredients.append("2 Tbsp Extra Virgin Olive Oil")
                sauceIngredients.append("Dried Red Chili Flakes (Optional)")
                prepTime = 5
                cookTime = 10
            case "Garlic Olive Oil":
                sauceIngredients.append("2 Cloves of Garlic")
                sauceIngredients.append("1/4 Cup Extra Virgin Olive Oil")
                prepTime = 5
                cookTime = 10
            case "Pesto":
                sauceIngredients.append("2 Cloves of Garlic")
                sauceIngredients.append("2 Cups Basil")
                sauceIngredients.append("1/4 Cup Parmesan Cheese")
                sauceIngredients.append("1/4 Cup Pine Nuts")
                sauceIngredients.append("1/4 Cup Extra Virgin Olive Oil")
                prepTime = 10
                cookTime = 10
            case "Butter":
                sauceIngredients.append( "4 Tbsp Of Butter")
                prepTime = 5
                cookTime = 10
            case "Carbonara":
                sauceIngredients.append("2 eggs")
                sauceIngredients.append("4 Slices of Bacon")
                sauceIngredients.append("1/4 Cup Parmesan")
                prepTime = 5
                cookTime = 10
            default:
                sauceIngredients.append(currentRecipe.sauce)
                prepTime = 10
                cookTime = 10
        }
        currentRecipe.recipeIngredients += sauceIngredients
        currentRecipe.prepTime = prepTime
        currentRecipe.cookTime = cookTime
        currentRecipe.recipeIngredients += [currentRecipe.herb, "1/2 pack of " + currentRecipe.pasta, currentRecipe.cheese]
        
    }
    
    
}

