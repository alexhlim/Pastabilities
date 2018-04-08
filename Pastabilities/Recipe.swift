//
//  Recipe.swift
//  Recipe Generator
//
//  Created by Alexander Lim on 1/30/18.
//  Copyright © 2018 Alexander Lim. All rights reserved.
//

import Foundation

class IngredientsLists{
    var meatList = ["Chicken", "Ground Beef", "Ground Pork", "Sausage", "Bacon", "Turkey", "Ham"]
    var herbsList = ["Parsely", "Rosemary", "Sage", "Oregano", "Basil", "Thyme"]
    var pastaList = ["Angel Hair", "Gnocchi", "Conchiglie", "Farfalle", "Fettuccine", "Linguine", "Orecchiette", "Pappardelle", "Penne", "Rigatoni", "Tagliatelle", "Spaghetti", "Ziti"]
    var sauceList = ["Garlic Tomato Sauce", "Garlic Olive Oil", "Pesto", "Butter", "Carbonara"]
    var cheeseList = ["Parmigiano Reggiano", "Pecorino Romano", "Ricotta"]
}

class Recipe{
    
    var meat: String
    var herb: String
    var pasta: String
    var sauce: String
    var cheese: String
    var prepTime: Int
    var cookTime: Int
    var recipeIngredients = [String]()
    var sauceIngredients = [String]()
    
    init() {
        self.meat = ""
        self.herb = ""
        self.pasta = ""
        self.sauce = ""
        self.cheese = ""
        prepTime = 0
        cookTime = 0
        recipeIngredients = []
        sauceIngredients = []
    }
    
}
