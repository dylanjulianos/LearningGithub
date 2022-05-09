//
//  ViewController.swift
//  NanoChallenge1
//
//  Created by Dylan Juliano Santoso on 26/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldOutlet: UITextField!
    var textFieldValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressButton(_ sender: Any) {
        textFieldValue = textFieldOutlet.text
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as? SecondViewController
        nextVC?.receivedData = textFieldValue
    }
    
}

