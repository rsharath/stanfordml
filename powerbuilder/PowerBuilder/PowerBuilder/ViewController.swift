//
//  ViewController.swift
//  PowerBuilder
//
//  Created by Sharath Rajasekar on 10/9/18.
//  Copyright © 2018 Chicory LLC. All rights reserved.
//

import UIKit
import CoreData

var workoutInFocus = ""
var didDietToday = false

class ViewController: UIViewController {
    
    private let exerciseList = ["Ab Ripper X", "Chest & Back", "Plyometrics", "Shoulders & Arms", "YogaX", "Legs & Back", "KenpoX", "Rest/Stretch"]
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var exercisePicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        exercisePicker.dataSource = self
        exercisePicker.delegate = self
        
        let today = Date()
        let weekday = Calendar.current.component(.weekday, from:today)
        let month = Calendar.current.component(.month, from:today)
        let date = Calendar.current.component(.day, from:today)
        
        dateLabel.text = "\(Calendar.current.weekdaySymbols[weekday-1]) \(Calendar.current.shortMonthSymbols[month-1]) \(date)"
    }
    
    @IBAction func letsGoTapped(_ sender: Any) {
        let mainNavigationController = storyboard?.instantiateViewController(withIdentifier: "MainNavigationController") as! MainNavigationController
            present(mainNavigationController, animated:true, completion: nil)
    }
    
    @IBAction func showProgressTapped(_ sender: Any) {
        let calendarViewController = storyboard?.instantiateViewController(withIdentifier: "CalendarViewController") as! CalendarViewController
        present(calendarViewController, animated:true, completion: nil)
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return exerciseList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // user has selected the row, now go to next screen
        // exerciseList[row]
        workoutInFocus = exerciseList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return exerciseList[row]
    }
    
    
}
