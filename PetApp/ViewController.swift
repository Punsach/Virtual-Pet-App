//
//  ViewController.swift
//  PetApp
//
//  Created by Puneet Sachdeva on 9/23/17.
//  Copyright © 2017 Puneet Sachdeva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var foodLevel: DisplayView!
    @IBOutlet weak var happinessLevel: DisplayView!
    @IBOutlet weak var totalHappiness: UILabel!
    @IBOutlet weak var totalFood: UILabel!
    var current:Pet!
    
    
    var Pets = ["dog": Pet(species: .dog), "cat": Pet(species: .cat), "bird": Pet(species: .bird), "fish": Pet(species: .fish), "bunny": Pet(species: .bunny)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        current = Pets["dog"]
        petImage.image = #imageLiteral(resourceName: "dog")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func Feed(_ sender: Any) {
        if(current.getFood() == 10){
            let alert = UIAlertController(title: "Your pet is full!", message: "Your pet cannot eat anymore", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else{
            current.feed()
            updateView()
        }
    }
    
    func rollOver(){
        petImage.transform = petImage.transform.rotated(by: CGFloat(Double.pi))
        let when = DispatchTime.now() + 0.5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.petImage.transform = self.petImage.transform.rotated(by: CGFloat(Double.pi))
        }
    }
    
    @IBAction func Play(_ sender: Any) {
        if(current.getFood() == 0){
            let alert = UIAlertController(title: "Your pet is tired!", message: "You need to feed your pet", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if(current.getTotalHappy() % 10 == 0){
            current.play()
            rollOver()
            updateView()
        }
        else{
            current.play()
            updateView()
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SwitchDog(_ sender: Any) {
        current = Pets["dog"]
        changeCurrentPet()
        updateView()
    }
    @IBAction func SwitchFish(_ sender: Any) {
        current = Pets["fish"]
        changeCurrentPet()
        updateView()
    }
    @IBAction func SwitchBunny(_ sender: Any) {
        current = Pets["bunny"]
        changeCurrentPet()
        updateView()
    }
    @IBAction func SwitchBird(_ sender: Any) {
        current = Pets["bird"]
        changeCurrentPet()
        updateView()
    }
    @IBAction func SwitchCat(_ sender: Any) {
        current = Pets["cat"]
        changeCurrentPet()
        updateView()
    }
    
    func changeCurrentPet(){
        switch current.species{
            case .dog:
                petImage.image = #imageLiteral(resourceName: "dog")
            case .cat:
                petImage.image = #imageLiteral(resourceName: "cat")
            case .bird:
                petImage.image = #imageLiteral(resourceName: "bird")
            case .fish:
                petImage.image = #imageLiteral(resourceName: "fish")
            case .bunny:
                petImage.image = #imageLiteral(resourceName: "bunny")
        }
    }
    
    func updateView(){
        totalHappiness.text = String(current.getTotalHappy())
        totalFood.text = String(current.getTotalFood())
        
        happinessLevel.animateValue(to: CGFloat(Double(current.getHappy())/10))
        foodLevel.animateValue(to: CGFloat(Double(current.getFood())/10))
        
    }
}

