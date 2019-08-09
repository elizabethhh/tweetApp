//
//  ViewController.swift
//  app
//
//  Created by Elizabeth Song on 8/7/19.
//  Copyright © 2019 elizabeth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //array will store the keys from the Dict
    var quotes : [String] = []
    var pointValue : [String: Int] = [:]
    var tweetDict = [
        "text1": "person1",
        "text2": "person2",
        "text3": "person1",
        "text4": "person4"
    ]
    //starts at 1 to display first index
    var counter = 1
    
    
    
    
    @IBOutlet weak var quoteLabel: UILabel!
   
    override func viewDidLoad() {
        //fill in quotes array and pointValue dictionary
        for (quote,author) in tweetDict{
            //quoteLabel.text = quote
            quotes.append(quote)
            pointValue[author] = 0
        }
        print(quotes)
        print(pointValue)
        print("Label should be: \(quotes[0])")
        quoteLabel.text = quotes[0]
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func homeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //technically a left swipe - saying no
    @IBAction func swipeRight(_ sender: Any) {
        
        //finished all the quotes
        if counter >= quotes.count{
            performSegue(withIdentifier: "endingGame", sender: self)
            quoteLabel.text = quotes[quotes.count-1]
        }
        //still have not finished all quotes
        else{
            quoteLabel.text = quotes[counter]
            print("Count: \(counter) and \(quotes[counter])") //just checking
            
            //need to decrease by 1 for the author the tweet is by
            //author is retrieved from tweetDict[quotes[counter]]
            //quotes[counter] = the current tweet that we have
            print("\(tweetDict[quotes[counter]]) is the person who is tweeting.")
            

            counter += 1
        }
        
    }
    @IBAction func swipeLeft(_ sender: Any) {
        
        //finished all the quotes
        if counter >= quotes.count{
            performSegue(withIdentifier: "endingGame", sender: self)
            quoteLabel.text = quotes[quotes.count-1]
        }
        //still have not finished all quotes
        else{
            quoteLabel.text = quotes[counter]
            print("Count: \(counter) and \(quotes[counter])")  //just checking
            counter += 1
        }
        
    }
    
}

