//
//  SecondViewController.swift
//  NanoChallenge1
//
//  Created by Dylan Juliano Santoso on 26/04/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    var receivedData: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        print(receivedData ?? "kosong")
        dataLabel.text = receivedData
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressButton(_ sender: Any) {
        self.dismiss(animated: true)
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
