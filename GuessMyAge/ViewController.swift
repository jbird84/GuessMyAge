//
//  ViewController.swift
//  GuessMyAge
//
//  Created by Kinney Kare on 1/3/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data = try! await loadData()
        print(data)
    }

    @IBAction func checkAgeButtonTapped(_ sender: Any) {
        
    }
 
    async func loadData() -> Data {
        let url = URL(string: "https://www.example.com/data.json")!
        return try Data(contentsOf: url)
      }
    
}

