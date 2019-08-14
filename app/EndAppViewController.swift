//
//  EndAppViewController.swift
//  app
//
//  Created by Elizabeth Song on 8/7/19.
//  Copyright © 2019 elizabeth. All rights reserved.
//

import UIKit

class EndAppViewController: UIViewController {
    //getting ViewController variables
    let myCustomViewController = ViewController.init(nibName: nil, bundle: nil)
    //lazy var getValue : [String : Int] = myCustomViewController.pointValue
  
    @IBOutlet weak var endLabel: UILabel!
    
    override func viewDidLoad() {
        //check if dictionary imported
        //print("Here's the dictionary from before: \(getValue)")
        print("Here's the dictionary: \(pointValue)")
        
        //now need to make quoteLabel.text = greatest max for person
        //right now we will assume there is one person, so they will be winning
        //iterate over dictionary
        var maximum = pointValue["person1"]
        var max_key = "person1"
        //for (author, point) in getValue{
        for (author, point) in pointValue{
            if point > maximum ?? -100 {
                //print(point)
                //print(maximum)
                maximum = point
                max_key = author
            }
        }
        print(max_key)
        
        endLabel.text = max_key
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func homeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
