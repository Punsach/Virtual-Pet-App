//
//  Pet.swift
//  PetApp
//
//  Created by Puneet Sachdeva on 9/24/17.
//  Copyright © 2017 Puneet Sachdeva. All rights reserved.
//

import Foundation

class Pet{
    private var happiness:Int 
    private var food:Int
    private var totalHappy:Int
    private var totalFood:Int
    private (set) var species:Species
    
    enum Species{
        case dog
        case cat
        case bird
        case fish
        case bunny
    }
    
    func feed(){
        food += 1
        totalFood += 1
        
    }
    
    func play(){
        if(food > 0){
            food -= 1
            happiness += 1
            totalHappy += 1
        }
    }
    
    func getSpecies() -> Species{
        return self.species
    }
    
    func getTotalHappy() -> Int{
        return totalHappy
    }
    
    func getHappy() -> Int{
        return happiness
    }
    
    func getFood() -> Int{
        return food
    }
    
    func getTotalFood() -> Int{
        return totalFood
    }

    
    init(species: Species) {
        self.species = species
        happiness = 0
        food = 0
        totalHappy = 0
        totalFood = 0
    }
    
    
}
