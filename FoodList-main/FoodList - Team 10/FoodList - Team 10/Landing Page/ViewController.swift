//
//  ViewController.swift
//  FoodList - Team 10
//
//  Created by Kevin  Sam Andaria on 08/04/22.
//

import UIKit

class ViewController: UIViewController {

  
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func GoToHomeBtn(_ sender: Any) {
        let namestoryboard =  UIStoryboard(name: "Main", bundle: nil)
        let vc = namestoryboard.instantiateViewController(withIdentifier: "HomePage")
            as! HomePage
        self.navigationController!.pushViewController(vc, animated: true)
    }
    

}


    
    

