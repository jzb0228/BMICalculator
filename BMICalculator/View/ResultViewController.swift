//
//  ResultViewController.swift
//  BMICalculator
//
//  Created by Justin Baik on 2/25/24.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!

    var bmiModel: BMIModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let bmiModel = bmiModel {
            resultLabel.text = String(format: "BMI: %.2f\nCategory: %@", bmiModel.bmi, bmiModel.category)
        }
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

