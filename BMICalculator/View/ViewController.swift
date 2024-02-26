//
//  ViewController.swift
//  BMICalculator
//
//  Created by Justin Baik on 2/25/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var feetTextField: UITextField!
    @IBOutlet weak var inchesTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var unitSwitch: UISwitch!

    @IBOutlet weak var feetLabel: UILabel!
    @IBOutlet weak var inchesLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!

    var bmiModel = BMIModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set initial labels based on the selected unit
        updateLabels()
    }

    @IBAction func calculateBMI(_ sender: UIButton) {
        if let feetText = feetTextField.text, let inchesText = inchesTextField.text, let weightText = weightTextField.text,
                  let feet = Double(feetText), let inches = Double(inchesText), let weight = Double(weightText),
                  feet >= 0, inches >= 0, weight > 0 {

            bmiModel.feet = feet
            bmiModel.inches = inches
            bmiModel.weight = weight
            bmiModel.unit = unitSwitch.isOn ? .imperial : .metric

            performSegue(withIdentifier: "resultSegue", sender: self)

        } else {
            showAlert(title: "Invalid Input", message: "Please enter valid values for height and weight.")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            if let resultViewController = segue.destination as? ResultViewController {
                resultViewController.bmiModel = bmiModel
            }
        }
    }

    @IBAction func clearInputs(_ sender: UIButton) {
        feetTextField.text = ""
        inchesTextField.text = ""
        weightTextField.text = ""
    }

    @IBAction func switchValueChanged(_ sender: UISwitch) {
        // Update labels when the switch value changes
        updateLabels()
    }

    private func updateLabels() {
        feetLabel.text = unitSwitch.isOn ? "Feet" : "Meters"
        inchesLabel.text = unitSwitch.isOn ? "Inches" : "Centimeters"
        weightLabel.text = unitSwitch.isOn ? "Pounds" : "Kilograms"
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

