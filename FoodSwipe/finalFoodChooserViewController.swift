//
//  finalFoodChooserViewController.swift
//  FoodSwipe
//
//  Created by Ilana Basman on 8/1/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import UIKit


import MapKit
import CoreLocation

class finalFoodChooserViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    // MARK: Properties
    var deletedItem: String = ""
    
    @IBAction func rightChoiceClicked(_ sender: Any) {
        
        let latitude = ((self.locationManager.location?.coordinate.latitude)!)
        let longitude = ((self.locationManager.location?.coordinate.longitude)!)
        print(longitude)
        print(latitude)
//        if (UIApplication.shared.canOpenURL(URL(string:"https://www.google.com/maps/search/")!)) {
//            UIApplication.shared.open(URL(string:
//                "comgooglemaps://?q=food%20\(foodArray[1])&center=\(latitude),\(longitude)")!)
//                //"comgooglemaps://?q=\(foodArray[1])%20food&center=\(latitude),\(longitude)")!)
//        } else {
//            UIApplication.shared.open(URL(string:
//                "https://www.google.com/maps/search/?api=1&query=food%20\(foodArray[1])&center=\(latitude),\(longitude)")!)
        let urlString = "http://maps.apple.com/?q=\(foodArray[1])+food"
        //&sll=\(latitude),\(longitude)"
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    @IBAction func leftChoiceClicked(_ sender: Any) {
        let latitude = ((self.locationManager.location?.coordinate.latitude)!)
        let longitude = ((self.locationManager.location?.coordinate.longitude)!)
        print(longitude)
        print(latitude)
//        if (UIApplication.shared.canOpenURL(URL(string:"https://www.google.com/maps/search/")!)) {
//            UIApplication.shared.open(URL(string:
//                "comgooglemaps://?q=food%20\(foodArray[0])&center=\(latitude),\(longitude)")!)
//            //"comgooglemaps://?q=\(foodArray[1])%20food&center=\(latitude),\(longitude)")!)
//        } else {
//            UIApplication.shared.open(URL(string:
//                "https://www.google.com/maps/search/?api=1&query=food%20\(foodArray[0])&center=\(latitude),\(longitude)")!)
//        }
        let urlString = "http://maps.apple.com/?q=\(foodArray[0])+food"
        //&sll=\(latitude),\(longitude)"
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    }
  
    @IBOutlet weak var rightFoodPic: UIImageView!
    @IBOutlet weak var leftFoodPic: UIImageView!
   // @IBOutlet weak var foodPic: UIImageView!
    @IBOutlet weak var rightButtonClicked: UIButton!
    @IBOutlet weak var leftButtonClicked: UIButton!
    
    @IBOutlet weak var lastFoodRight: UITextField!
    @IBOutlet weak var lastFoodLeft: UITextField!
 
    
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print (foodArray)
        leftFoodPic.image = UIImage(named: foodArray[0])
        rightFoodPic.image = UIImage(named: foodArray[1])
        lastFoodLeft.text = foodArray[0]
        lastFoodRight.text = foodArray[1]
        
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        //locationManager.stopUpdatingLocation()
        locationManager.requestAlwaysAuthorization()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
       
        
//        let latitude = self.locationManager.location?.coordinate.latitude
//        let longitude = self.locationManager.location?.coordinate.longitude
//        var self.lat = Double(latitude)
//        var self.long = Double(longitude)
        
//        print(Double(latitude!))
//        print(Double(longitude!))
//        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
//            UIApplication.shared.open(URL(string:
//                "comgooglemaps://?q=japanese%20food&center=\(lat),\(long)")!)
//        } else {
//            print("Can't use comgooglemaps://");
//        }
        
//        view.bringSubview(toFront: rightButtonClicked)
//        view.bringSubview(toFront: leftButtonClicked)
        
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
    
//    func selectedChoices(arrayOfFood: [String]) {
//        var selectedFood = [String]()
//
//        let randFood = foodCategory.text!
//        print("Right: \(randFood)")
//
//        if !selectedFood.contains(randFood) {
//            selectedFood.append(randFood)
//        }
//
//        print("Swiped right on Food Choices: \(foodChoices)")
//        print("Food Choices: \(foodChoices.count)")
//    }
//    func updateIndex() {
//        index += 1
//        if index >= foodChoices.count {
//            index = 0
//        }
//    }
    
    func generateAnswer() {
       // updateIndex()
        //let maxIndex = foodChoices.count
        //let randomIndex = Int(arc4random_uniform(UInt32(maxIndex)))
        //foodPic.isHidden = false
//        leftButtonClicked.isEnabled = false
//        rightButtonClicked.isEnabled = false
//        if foodChoices.count == 2 {
//            //instructionLabel.isHidden = true
//
//            print("\(foodChoices)")
//            leftButtonClicked.isEnabled = true
//            rightButtonClicked.isEnabled = true
//            lastFoodRight.text = foodChoices[0]
//            print(foodChoices[0])
//            lastFoodLeft.text = foodChoices[1]
//            print(foodChoices[1])
//            //foodCategoryHeight.constant = 0
//            rightButtonClicked.isHidden = false
//            leftButtonClicked.isHidden = false
//            //instructionLabel.isHidden = true
//            self.view.removeGestureRecognizer(swipeDown)
//            self.view.removeGestureRecognizer(swipeLeft)
//            self.view.removeGestureRecognizer(swipeRight)
//            foodPic.isHidden = true
//            rightFoodPic.image = UIImage(named: foodChoices[0])
//            leftFoodPic.image = UIImage(named: foodChoices[1])
//
//
//            if foodChoices.count == 1 {
//                if (rightButtonClicked != nil) {
//                    performSegue(withIdentifier: "rightFoodChoice", sender: nil)
//                } else {
//                    performSegue(withIdentifier: "leftFoodChoice", sender: nil)
//                }
//
//                print("\(foodChoices)")
//                lastFoodRight.text = foodChoices[0]
//                lastFoodLeft.text = foodChoices[1]
//                //foodCategoryHeight.constant = 98
//                rightButtonClicked.isEnabled = false
//                leftButtonClicked.isEnabled = false
//                foodPic.isHidden = false
//                //finalChoice.text = foodChoices[0]
//                self.view.removeGestureRecognizer(swipeDown)
//                self.view.removeGestureRecognizer(swipeLeft)
//                self.view.removeGestureRecognizer(swipeRight)
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
                
//            }
//        }
//
//        print("\(foodChoices.count)")
//        print("\(foodChoices)")
//        foodPic.image = UIImage(named: foodChoices[0])
//        //foodCategory.text = foodChoices[0]
//
    }
    
    
}

