//
//  BMIModel.swift
//  BMICalculator
//
//  Created by Justin Baik on 2/25/24.
//

import Foundation

enum MeasurementUnit {
    case metric
    case imperial
}

struct BMIModel {
    var feet: Double = 0
    var inches: Double = 0
    var weight: Double = 0
    var unit: MeasurementUnit = .imperial
    

    var height: Double {
        switch unit {
        case .imperial:
            return (feet * 12 + inches) // Assuming measurement input is imperial
        case .metric:
            return feet + (inches / 100)// Assuming measurement input is metric
        }
    }

    var bmi: Double {
        switch unit {
        case .imperial:
            return (weight / (height * height)) * 703
        case .metric:
            return (weight / (height * height))
        }
    }

    var category: String {
        if bmi < 18.5 {
            return "Underweight"
        } else if bmi < 24.9 {
            return "Normal Weight"
        } else if bmi < 29.9 {
            return "Overweight"
        } else {
            return "Obese"
        }
    }
}
