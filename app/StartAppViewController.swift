//
//  StartAppViewController.swift
//  app
//
//  Created by Elizabeth Song on 8/7/19.
//  Copyright © 2019 elizabeth. All rights reserved.
//

import UIKit

class StartAppViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startButton(_ sender: Any) {
        performSegue(withIdentifier: "startingApp", sender: self)
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
