//
//  finalFoodChooserViewController.swift
//  FoodSwipe
//
//  Created by Ilana Basman on 8/1/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import Canvas

class finalFoodChooserViewController: UIViewController {
    
    
    // MARK: Properties
    var deletedItem: String = ""
    
    //    @IBOutlet var foodChooser: UISwipeGestureRecognizer!
    
    // MARK: Undo button
//    @IBAction func restartChoiceClicked(_ sender: UIBarButtonItem) {
//        foodChoices.insert(deletedItem, at: index)
//        foodChoices.append(deletedItem)
//        print("Undo pressed: \(deletedItem)")
//        print(foodChoices)
//        //        let deleteItem = foodChoices.remove(at: index)
//        //        //foodChoices.remove(at: index)
//        //        print("\(deleteItem)")
//        //        foodChoices.append(deleteItem)
//        //        print("\(foodChoices)")
//        print("Hi")
//    }
    @IBAction func rightButtonClicked(_ sender: UIButton) {
        let randFood = lastFoodRight.text!
        if let index = foodChoices.index(of:randFood) {
            foodChoices.remove(at: index)
            foodCategoryHeight.constant = 48
            rightButtonClicked.isHidden = true
            lastFoodLeft.isHidden = true
            lastFoodRight.isHidden = true
            leftFoodPic.isHidden = true
            rightFoodPic.isHidden = true
        }
        generateAnswer()
    }
    @IBAction func leftButtonClicked(_ sender: UIButton) {
        let randFood = lastFoodLeft.text!
        if let index = foodChoices.index(of:randFood) {
            foodChoices.remove(at: index)
            foodCategoryHeight.constant = 48
            leftButtonClicked.isHidden = true
            lastFoodRight.isHidden = true
            lastFoodLeft.isHidden = true
            rightFoodPic.isHidden = true
            leftFoodPic.isHidden = true
        }
        generateAnswer()
    }
    
//    @IBOutlet weak var resetChoices: UIBarButtonItem!
    @IBOutlet weak var rightFoodPic: UIImageView!
    @IBOutlet weak var leftFoodPic: UIImageView!
    @IBOutlet weak var foodPic: UIImageView!
    @IBOutlet weak var rightButtonClicked: UIButton!
    @IBOutlet weak var leftButtonClicked: UIButton!
    @IBOutlet weak var rightButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var leftButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var foodCategoryHeight: NSLayoutConstraint!
    @IBOutlet weak var lastFoodRight: UITextField!
    @IBOutlet weak var lastFoodLeft: UITextField!
    @IBOutlet weak var foodCategory: UITextField!
    
    
    
    var swipeDown: UISwipeGestureRecognizer!
    var swipeRight: UISwipeGestureRecognizer!
    var swipeLeft: UISwipeGestureRecognizer!
    var index = 0
    var didSwipe = false
    var foodChoices = ["Chinese", "Mexican", "Italian", "Japanese", "Mediterranean", "French", "Thai", "Spanish", "Indian", "Greek", "BBQ", "Burgers", "Sandwich", "Seafood", "Pizza", "Steak"]
    var foodArray = [""]
    
    var lastChoice: Choice?
    struct Choice {
        var operation: Operation
        var value: String!
    }
    enum Operation {
        case right
        case left
    }
    
    //var maxIndex: Int = 0
    //        let randomIndex = Int(arc4random_uniform(maxIndex))
    //var currIndex = 0
    //    if startingIndex == maxIndex {
    //    startingIndex = 0
    //    }
    
    //    func getMaxInd() {
    //        maxIndex = foodChoices.count
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print (foodArray)
        leftFoodPic.image = UIImage(named: foodArray[0])
        rightFoodPic.image = UIImage(named: foodArray[1])
        //        getMaxInd() // set the initial max index
        //        func getMaxIndex() {
        //        maxIndex = foodChoices.count
        
        //let foodCategoryChoice = foodCategory.text
//        foodCategoryHeight.constant = 25
        
        //        self.foodPic.contentMode = .scaleAspectFill
        //        self.rightFoodPic.contentMode = .scaleAspectFill
        //        self.leftFoodPic.contentMode = .scaleAspectFill
//        swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipedToRight))
//        swipeRight!.direction = .right
//        self.view.addGestureRecognizer(swipeRight!)
//
//        swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipedToLeft))
//        swipeLeft!.direction = .left
//        self.view.addGestureRecognizer(swipeLeft!)
//
//        swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeToDown))
//        swipeDown!.direction = .down
//        self.view.addGestureRecognizer(swipeDown!)
//        // Do any additional setup after loading the view, typically from a nib.
//    }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    @objc func swipeToDown() {
//        if didSwipe == false {
//            didSwipe = true
//        }
//        index = foodChoices.count
//        self.view.removeGestureRecognizer(swipeLeft)
//        self.view.removeGestureRecognizer(swipeRight)
//        resetChoices.isEnabled = false
//        //instructionLabel.isHidden = true
//        updateIndex()
//        //FIXME: Print out the food that was swiped up on
//        print(foodChoices)
//        //currIndex += 1
//    }
//
//    @objc func swipedToRight() {
//        if didSwipe == false {
//            didSwipe = true
//        }
//        generateAnswer()
//        // Increment the index
//        lastChoice = Choice(operation:.right, value: nil)
//        //currIndex += 1
//    }
//
//    @objc func swipedToLeft() {
//        if didSwipe == false {
//            didSwipe = true
//        } else {
//            //let randFood = foodCategory.text!
//            // print("Left: \(randFood)")
//
//            let deleteItem = foodChoices.remove(at: index)
//            //foodChoices.remove(at: index)
//            print("DELETE ITEM: \(deleteItem)")
//            self.deletedItem = deleteItem
//            //foodChoices.append(deleteItem)
//            // print("\(foodChoices)")
//            //at: (Int(foodChoices[0])))
//        }
//
//
//        print("Swiped Left on Food Choices: \(foodChoices)")
//
//        // FIXME: get the index value and pass it in
//        index -= 1
//        generateAnswer()
//
//
//        // Set the max index again
//        // Get the currentIndex
//        // Increment the index Set the current index value
//    }
    
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
        //let maxIndex = foodChoices.count
        //let randomIndex = Int(arc4random_uniform(UInt32(maxIndex)))
        //foodPic.isHidden = false
        leftButtonClicked.isEnabled = false
        rightButtonClicked.isEnabled = false
        if foodChoices.count == 2 {
            //instructionLabel.isHidden = true
            
            print("\(foodChoices)")
            leftButtonClicked.isEnabled = true
            rightButtonClicked.isEnabled = true
            lastFoodRight.text = foodChoices[0]
            print(foodChoices[0])
            lastFoodLeft.text = foodChoices[1]
            print(foodChoices[1])
            //foodCategoryHeight.constant = 0
            rightButtonClicked.isHidden = false
            leftButtonClicked.isHidden = false
            //instructionLabel.isHidden = true
            self.view.removeGestureRecognizer(swipeDown)
            self.view.removeGestureRecognizer(swipeLeft)
            self.view.removeGestureRecognizer(swipeRight)
            foodPic.isHidden = true
            rightFoodPic.image = UIImage(named: foodChoices[0])
            leftFoodPic.image = UIImage(named: foodChoices[1])
            
            
            if foodChoices.count == 1 {
                if (rightButtonClicked != nil) {
                    performSegue(withIdentifier: "rightFoodChoice", sender: nil)
                } else {
                    performSegue(withIdentifier: "leftFoodChoice", sender: nil)
                }
                
                print("\(foodChoices)")
                lastFoodRight.text = foodChoices[0]
                lastFoodLeft.text = foodChoices[1]
                foodCategoryHeight.constant = 98
                rightButtonClicked.isEnabled = false
                leftButtonClicked.isEnabled = false
                foodPic.isHidden = false
                //finalChoice.text = foodChoices[0]
                self.view.removeGestureRecognizer(swipeDown)
                self.view.removeGestureRecognizer(swipeLeft)
                self.view.removeGestureRecognizer(swipeRight)
                //            let lat = Double(37.773972)
                //            let long = Double(-122.431297)
                //            let fileURL = "https://api.yelp.com/v3/businesses/search?term=\(foodChoices[0])food"
                //            //&latitude=37.786882&longitude=-122.399972
                //            let parameters : Parameters = ["radius": "10000", "latitude": "\(lat)", "longitude": "\(long)"]
                //            let headers: [String : String] = ["Authorization": "Bearer mAly6n1Ufi8rlspSODzjdwUtMdADumgGWO1bhqaVozycE57NFz7q7-mKCnWkzaPMFSWR-Y3nUz-IoRwJ0HpefIYUEzu_mrIOmLus4E5agb4Jmj7NsXwuOD8mSGBfW3Yx"]
                //            Alamofire.request(fileURL, method: .get, parameters: parameters, headers: headers).responseJSON {
                //                response in
                //                if let receivedString = response.result.value {
                //                    print()
                //                    print("Here \(receivedString)")
                //                }
                //            }
                
            }
        }
        
        print("\(foodChoices.count)")
        print("\(foodChoices)")
        foodPic.image = UIImage(named: foodChoices[0])
        foodCategory.text = foodChoices[0]
        
    }
    
    
}

