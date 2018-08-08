//
//  SwipeDemo.swift
//  FoodSwipe
//
//  Created by Ilana Basman on 8/7/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//
import UIKit
import Swipey
class SwipeDemo: UIViewController, SwipeDeckDelegate {
    
    // MARK: Lifecycle
    var foodChoices = ["Chinese", "Mexican", "Italian", "Japanese", "Mediterranean", "French", "Thai", "Spanish", "Indian", "Greek", "BBQ", "Burgers", "Sandwich", "Seafood", "Pizza", "Steak"]
    let colors = [UIColor.yellow,
                  UIColor.green,
                  UIColor.red,
                  UIColor.gray,
                  UIColor.orange,
                  UIColor.white,
                  UIImage(named: "Chinese")]
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeDeck = SwipeDeck(frame: CGRect(x: 51, y: 162, width: 312, height: 472))
        swipeDeck.delegate = self
        swipeDeck.backgroundColor = UIColor.white
        view.addSubview(swipeDeck)
    }
    
    // MARK: Swipe Deck
    
    func numberOfCards(swipeDeck: SwipeDeck) -> Int {
        // Return the number of cards you'll need for your swipe deck
        return 16
    }
    
    func cardFor(index: Int, swipeDeck: SwipeDeck) -> SwipeCard {
        // Produce a swipe card, like dequeueing a table view cell
        let swipeCard = swipeDeck.produceSwipeCard()
        // Customize the swipe card
        swipeCard.backgroundColor = UIColor.blue
        // Return the swipe card
        return swipeCard
    }
    
    func positiveSwipe(swipeDeck: SwipeDeck) {
        // React to a positive swipe
        print("positive swipe")
    }
    
    func negativeSwipe(swipeDeck: SwipeDeck) {
        // React to a negative swipe
        print("negative swipe")
    }
}
