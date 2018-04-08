//
//  RecipeViewController.swift
//  Recipe Generator
//
//  Created by Alexander Lim on 1/31/18.
//  Copyright © 2018 Alexander Lim. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
   
    @IBOutlet weak var Steps: UITextView!
    
    @IBOutlet weak var mainIngredients: UITableView!
    
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    @IBOutlet weak var directionsLabel: UILabel!
    @IBOutlet weak var prepTime: UIImageView!
    @IBOutlet weak var cookTime: UIImageView!
    @IBOutlet weak var totalTime: UIImageView!
    @IBOutlet weak var prepLabel: UILabel!
    @IBOutlet weak var cookLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    
    override func viewDidLoad() {
        
        prepTime.image = (#imageLiteral(resourceName: "prep"))
        cookTime.image = (#imageLiteral(resourceName: "cook"))
        totalTime.image = (#imageLiteral(resourceName: "clock"))
    
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        prepLabel.text = String(currentRecipe.prepTime) + " m"
        cookLabel.text = String(currentRecipe.cookTime) + " m"
        totalTimeLabel.text = String(currentRecipe.prepTime + currentRecipe.cookTime) + " m"
        self.mainIngredients.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0)
        var sauceStep: String
        switch currentRecipe.sauce {
        case "Garlic Tomato Sauce":
            sauceStep = "4. Give the pan a good wipe and reheat the pan. Add olive oil, 2 minced garlic cloves and a pinch of dried chili flakes. Just as the garlic starts to brown, add the can crushed/pureed tomatoes. Season with salt, pepper, and 3/4 of your " + currentRecipe.herb.lowercased() + ". Keep 1/4 of " + currentRecipe.herb.lowercased() + " to garnish."
        case "Garlic Olive Oil":
            sauceStep = "4. In the same pan, add 2 tablespoons olive oil and 2 cloves sliced garlic. Set heat to medium-low. When garlic starts to turn golden, take oil off the heat."
        case "Pesto":
            sauceStep = "4. In a pestal and mortar or food processor, add 2 garlic cloves, 1/4 cup of pine nuts, 1/4 cup of paremesan, and 1 cup basil and mix until ingredients are broken down. Slowly incorporate  1/2 a cup of olive oil while mixing. When the sauce is nice and thick, season with salt and pepper to taste."
        case "Butter":
            sauceStep = "4. Clean out the pan, then heat to the same pan to medium-low and add butter. Once the butter starts to bubble, add 3/4 of your " + currentRecipe.herb.lowercased() + ". Simmer for about 1 minute."
        case "Carbonara":
            sauceStep = "4. In a separate bowl, whisk 2 eggs, 1/4 cup of parmesan, and pepper."
        default:
            sauceStep = "4. If needed, heat " + currentRecipe.sauce.lowercased() + " and keep warm until pasta is ready."
        }
        
        Steps.text = " 1. Pour 4-6 quarts of salted water in your pot. Once water is boiling, add a pinch of salt and pour in " + currentRecipe.pasta.lowercased() + "(cook for 1-2 minutes less than instructions on package for al-dente). Save a cup of pasta water for later! \n\n 2. While the " + currentRecipe.pasta.lowercased() + " is cooking, cut your " + currentRecipe.meat.lowercased() + " to your desired size. \n\n 3. Heat a large pan on medium high heat. Drizzle 2 tablespoons of olive oil and sautée the " + currentRecipe.meat.lowercased() + ".  Transfer to another dish when done. \n\n " + sauceStep + "\n\n 5. Transfer cooked pasta into your sauce pan and mix. Add pasta water if the sauce looks dry. \n\n 6. Incorporate " + currentRecipe.meat.lowercased() + " in sauce. \n\n 7. Tear/Grate over fresh " + currentRecipe.cheese.lowercased() + " and garnish with " + currentRecipe.herb.lowercased() + "."
        
    }
    
    
    @IBAction func backToHomeView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == mainIngredients){
            return currentRecipe.recipeIngredients.count;
        }
        else {
            return currentRecipe.sauceIngredients.count;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.font = Steps.font
        if (tableView == mainIngredients){
            cell.textLabel?.text = "❏ " + currentRecipe.recipeIngredients[indexPath.row]
        }
        else{
            cell.textLabel?.text = currentRecipe.sauceIngredients[indexPath.row]
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 30;
    }


}
