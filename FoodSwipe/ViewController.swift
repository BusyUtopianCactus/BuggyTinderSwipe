//
//  ViewController.swift
//  FoodSwipe
//
//  Created by Ilana Basman on 7/24/18.
//  Copyright © 2018 MakeSchool. All rights reserved.

import UIKit

import CoreLocation
import SnapKit
import MapKit
class ViewController: UIViewController {


    // MARK: Properties
    var foodChoiceRestart = ["Chinese", "Mexican", "Italian", "Japanese", "Mediterranean", "French", "Thai", "Spanish", "Indian", "Greek", "BBQ", "Burgers", "Sandwich", "Seafood", "Pizza", "Steak"]
    var deletedItemArray = [String]()
    var deletedItem: String = ""
    let locationManager = CLLocationManager()
    var restarterArray = [String]()
    
    // MARK: Undo button
    @IBAction func restartChoiceClicked(_ sender: UIBarButtonItem) {
        
        foodChoices.insert(deletedItem, at: index)
        foodPic.image = UIImage(named: deletedItem)
        foodCategory.text = deletedItem
        deniedCounterIndex = deniedCounterIndex - 1
        deniedFoodCounter.text = String(("Rejected: \(deniedCounterIndex)/16"))
        //foodChoices.append(deletedItem)
        print("Undo pressed: \(deletedItem)")
        print(foodChoices)
                print("Hi")
    }

    @IBAction func leftButtonClicked(_ sender: UIButton) {
        let deleteItem = foodChoices.remove(at: index)
        
        print("DELETE ITEM: \(deleteItem)")
        self.deletedItem = deleteItem
        resetChoices.isEnabled = true
        
        if deniedCounterIndex + approvedCounterIndex < 16 {
            deniedCounterIndex += 1
        }
        else {
            deniedCounterIndex += 1
            approvedCounterIndex -= 1
        }
        
        deniedFoodCounter.text = String(("Rejected: \(deniedCounterIndex)/16"))
        foodCounter.text = String(("Maybe: \(approvedCounterIndex)/16"))
        
        print("Swiped Left on Food Choices: \(foodChoices)")
        
        // FIXME: get the index value and pass it in
        index -= 1
        
        generateAnswer()
        
        
    }
    
    @IBAction func rightButtonClicked(_ sender: UIButton) {
        generateAnswer()
        // Increment the index
        lastChoice = Choice(operation:.right, value: nil)
        //currIndex += 1
        
        if approvedCounterIndex + deniedCounterIndex < 16 {
            approvedCounterIndex += 1
        }
        resetChoices.isEnabled = false
        foodCounter.text = String(("Maybe: \(approvedCounterIndex)/16"))
    }
    
    @IBAction func upButtonClicked(_ sender: UIButton) {
        if CLLocationManager.locationServicesEnabled() {
            print ("Its all on")
        } else {
            if let url = URL(string: "App-Prefs:root=Privacy&path=LOCATION") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        let latitude = ((self.locationManager.location?.coordinate.latitude))
        let longitude = ((self.locationManager.location?.coordinate.longitude))

        
        
        let urlString = "http://maps.apple.com/?q=\(foodChoices[index])+food+nearby&near=\(String(describing: latitude)),\(String(describing: longitude))@z=10"
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            
        }
    }
    

    @IBAction func restartAppButton(_ sender: UIBarButtonItem) {
        if didSwipe == false {
            didSwipe = true
            
        }
        
//        var foodChoices1 = ["Chinese", "Mexican", "Italian", "Japanese", "Mediterranean", "French", "Thai", "Spanish", "Indian", "Greek", "BBQ", "Burgers", "Sandwich", "Seafood", "Pizza", "Steak"]
        
        foodChoices.append(contentsOf: deletedItemArray)
        print(foodChoices)
        foodChoices = foodChoices.filter{$0 != "Chinese"}
        foodChoices.insert("Chinese", at: 0)
        foodChoices = foodChoices.filter{$0 != "Mexican"}
        foodChoices.insert("Mexican", at: 1)
        foodChoices = foodChoices.filter{$0 != "Italian"}
        foodChoices.insert("Italian", at: 2)
        foodChoices = foodChoices.filter{$0 != "Japanese"}
        foodChoices.insert("Japanese", at: 3)
        foodChoices = foodChoices.filter{$0 != "Mediterranean"}
        foodChoices.insert("Mediterranean", at: 4)
        foodChoices = foodChoices.filter{$0 != "French"}
        foodChoices.insert("French", at: 5)
        foodChoices = foodChoices.filter{$0 != "Thai"}
        foodChoices.insert("Thai", at: 6)
        foodChoices = foodChoices.filter{$0 != "Spanish"}
        foodChoices.insert("Spanish", at: 7)
        foodChoices = foodChoices.filter{$0 != "Indian"}
        foodChoices.insert("Indian", at: 8)
        foodChoices = foodChoices.filter{$0 != "Greek"}
        foodChoices.insert("Greek", at: 9)
        foodChoices = foodChoices.filter{$0 != "BBQ"}
        foodChoices.insert("BBQ", at: 10)
        foodChoices = foodChoices.filter{$0 != "Burgers"}
        foodChoices.insert("Burgers", at: 11)
        foodChoices = foodChoices.filter{$0 != "Sandwich"}
        foodChoices.insert("Sandwich", at: 12)
        foodChoices = foodChoices.filter{$0 != "Seafood"}
        foodChoices.insert("Seafood", at: 13)
        foodChoices = foodChoices.filter{$0 != "Pizza"}
        foodChoices.insert("Pizza", at: 14)
        foodChoices = foodChoices.filter{$0 != "Steak"}
        foodChoices.insert("Steak", at: 15)
        
        print(foodChoices)
        
//        var foodChoices = ["Chinese", "Mexican", "Italian", "Japanese", "Mediterranean", "French", "Thai", "Spanish", "Indian", "Greek", "BBQ", "Burgers", "Sandwich", "Seafood", "Pizza", "Steak"]
        
        //foodChoices = fullfoodChoices()
        //foodChoices.append(contentsOf: deletedItemArray)
//
//        //let restarterArray = foodChoices.append(contentsOf: deletedItemArray)
//        if restarterArray.count >= 16 {
//            restartWholeApp.isEnabled = false
//        } else {
//            restartWholeApp.isEnabled = true
//        }
//        print(restarterArray.count)
//        print("This is: \(restarterArray)")

        
        
        
        
        if foodChoices.count >= 16 {
            restartWholeApp.isEnabled = false
                    }
        if foodChoices.count <= 16 {
            restartWholeApp.isEnabled = true
        }
        deletedItemArray = []
        print("Guess what \(deletedItemArray)")
        index = -1
        updateIndex()
        
        generateAnswer()
//        foodPic.image = UIImage(named: foodChoices[1])
//        foodCategory.text = foodChoices[1]

        approvedCounterIndex = 0
        deniedCounterIndex = 0
        deniedFoodCounter.text = String(("Rejected: \(approvedCounterIndex)/16"))
        foodCounter.text = String(("Maybe: \(deniedCounterIndex)/16"))
        print (foodChoices)
        print(foodChoices.count)
    }
    
    @IBOutlet weak var restartWholeApp: UIBarButtonItem!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var resetChoices: UIBarButtonItem!

    @IBOutlet weak var deniedFoodCounter: UILabel!
    @IBOutlet weak var foodCounter: UILabel!
    @IBOutlet weak var foodPic: UIImageView!

    @IBOutlet weak var foodCategoryHeight: NSLayoutConstraint!

    @IBOutlet weak var foodCategory: UITextField!
    
    var approvedCounterIndex = 0
    var deniedCounterIndex = 0
    var swipeUp: UISwipeGestureRecognizer!
    var swipeRight: UISwipeGestureRecognizer!
    var swipeLeft: UISwipeGestureRecognizer!
    var index = 0
    var didSwipe = false
    var foodChoices = ["Chinese", "Mexican", "Italian", "Japanese", "Mediterranean", "French", "Thai", "Spanish", "Indian", "Greek", "BBQ", "Burgers", "Sandwich", "Seafood", "Pizza", "Steak"]{
        didSet{
            if foodChoices.count == 2{
                self.performSegue(withIdentifier: "finalChooser", sender: nil)
            }
        }
    }
    var lastChoice: Choice?
    struct Choice {
        var operation: Operation
        var value: String!
    }
    enum Operation {
        case right
        case left
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        generateAnswer()
        foodCounter.text = String(("Maybe: 0/16"))
        deniedFoodCounter.text = String(("Rejected: 0/16"))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        resetChoices.isEnabled = false
       
        
        
        
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.requestAlwaysAuthorization()
        
        swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipedToRight))
        swipeRight!.direction = .right
        self.view.addGestureRecognizer(swipeRight!)
        
        swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipedToLeft))
        swipeLeft!.direction = .left
        self.view.addGestureRecognizer(swipeLeft!)
        
        swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeToUp))
        swipeUp!.direction = .up
        self.view.addGestureRecognizer(swipeUp!)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func swipeToUp() {
        if didSwipe == false {
            didSwipe = true
        
        }
        if CLLocationManager.locationServicesEnabled() {
            print ("Its all on")
        } else {
            if let url = URL(string: "App-Prefs:root=Privacy&path=LOCATION") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
                    let urlString = "http://maps.apple.com/?q=\(foodChoices[index])+food+nearby"
        //&sll=\(latitude),\(longitude)"
                    if let url = URL(string: urlString) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    //}
                }
            //}
        //}
        
    }
    
    @objc func swipedToRight() {
        if didSwipe == false {
            didSwipe = true
        }
        
        generateAnswer()
        //print (index)
        // Increment the index
        lastChoice = Choice(operation:.right, value: nil)
        //currIndex += 1
        
        //FIXME: fix this
        if approvedCounterIndex + deniedCounterIndex < 16 {
                approvedCounterIndex += 1
        }
        resetChoices.isEnabled = false
        foodCounter.text = String(("Maybe: \(approvedCounterIndex)/16"))
        
    }
    
    
    
    @objc func swipedToLeft() {
        
        if didSwipe == false {
            didSwipe = true
        }
        
            let deleteItem = foodChoices.remove(at: index)
        
        // Searchterms: how to search an array for an element swift
        
            // check if the deleted item is not in the array
            // if not in array: then append
            deletedItemArray.append(deleteItem)
            //foodChoices.remove(at: index)
            print("DELETE ITEM: \(deleteItem)")
            self.deletedItem = deleteItem
            resetChoices.isEnabled = true
        
        //FIXME: fix this
        if deniedCounterIndex + approvedCounterIndex < 16 {
            deniedCounterIndex += 1
        }
        else {
            deniedCounterIndex += 1
            approvedCounterIndex -= 1
        }

        
        
        
        deniedFoodCounter.text = String(("Rejected: \(deniedCounterIndex)/16"))
        foodCounter.text = String(("Maybe: \(approvedCounterIndex)/16"))

        print("Swiped Left on Food Choices: \(foodChoices)")
        
        // FIXME: get the index value and pass it in
        index -= 1
        
        generateAnswer()
        
        
        // Set the max index again
        // Get the currentIndex
        // Increment the index Set the current index value
    }
    
    func selectedChoices(arrayOfFood: [String]) {
        var selectedFood = [String]()
        
        let randFood = foodCategory.text!
        print("Right: \(randFood)")
        
        if !selectedFood.contains(randFood) {
            selectedFood.append(randFood)
        }
        
        print("Swiped right on Food Choices: \(foodChoices)")
        print("Food Choices: \(foodChoices.count)")
    }
    func updateIndex() {
        index += 1
        if index >= foodChoices.count {
            index = 0
        }
    }
    
    func generateAnswer() {
        updateIndex()
        
        foodPic.isHidden = false
        
        if foodChoices.count == 2 {
            
            //instructionLabel.isHidden = true
            print("One choice is: \(foodChoices[0])")
            print("Another choice is: \(foodChoices[1])")

            self.view.removeGestureRecognizer(swipeUp)
            self.view.removeGestureRecognizer(swipeLeft)
            self.view.removeGestureRecognizer(swipeRight)
            foodPic.isHidden = true
            
        if foodChoices.count == 1 {
            print("\(foodChoices)")

            foodCategory.text = foodChoices[0]
            foodCategoryHeight.constant = 98

            foodPic.isHidden = false
            
            self.view.removeGestureRecognizer(swipeUp)
            self.view.removeGestureRecognizer(swipeLeft)
            self.view.removeGestureRecognizer(swipeRight)
            
            }
        }

        print("\(foodChoices.count)")
        print("\(foodChoices)")
        
        foodPic.image = UIImage(named: foodChoices[index])
        foodCategory.text = foodChoices[index]

    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        switch identifier {
        case "finalChooser":
            let destination = segue.destination as! finalFoodChooserViewController
            destination.foodArray = self.foodChoices
        default:
            print("that didn't work")
        }
        
    }
    
}


