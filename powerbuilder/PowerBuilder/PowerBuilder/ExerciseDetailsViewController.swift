//
//  ExerciseDetailsViewController.swift
//  PowerBuilder
//
//  Created by Sharath Rajasekar on 10/9/18.
//  Copyright © 2018 Chicory LLC. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ExerciseDetailsViewController : UIViewController, UITextFieldDelegate {
    
    var exerciseContainer : [ExerciseRecord] = []
    var seedcontainer : [ExerciseRecord] = []
    let formatter = DateFormatter()

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var leftWeights: UITextField!
    @IBOutlet weak var rightWeights: UITextField!
    @IBOutlet weak var totalReps: UITextField!
    @IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var historyDate: UILabel!
    @IBOutlet weak var historyLeft: UILabel!
    @IBOutlet weak var historyRight: UILabel!
    @IBOutlet weak var historyReps: UILabel!
    
    @IBOutlet weak var labelSaysRight: UILabel!
    @IBOutlet weak var labelSaysLeft: UILabel!
    var detailsModel :Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //seed data now
        //seeddata()
        
        if let exerciseModel = detailsModel as? Exercise {
            exerciseLabel.text = exerciseModel.name
            workoutLabel.text = workoutInFocus
            let isRepsOnly = exerciseModel.repsOnly
            //set history date, left, right and reps from database
            
            //fixup UI elements
            totalReps.font = totalReps.font!.withSize(30)
            totalReps.tintColor = .red
            //totalReps.becomeFirstResponder()
            //todo: figure out how to click out of keyboard!!
            
            exerciseContainer.removeAll()
            
            do {
                // massage fetch request
                let fetchreq = NSFetchRequest<NSFetchRequestResult>(entityName:"ExerciseRecord")
                
                // filter by name && date
                fetchreq.predicate = NSPredicate(format: "name = %@", "\(exerciseModel.name)")
                fetchreq.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
                fetchreq.fetchLimit = 1

                // now query core data for details of my last workout
                exerciseContainer += try  appDelegate.persistentContainer.viewContext.fetch(fetchreq) as! [ExerciseRecord]

                // get the count
                let index = exerciseContainer.count
                
                if (index != 0) {
                    // found an entry, I've done this exercise before
                    let lastDate = exerciseContainer[index-1].date
                    let weekday = Calendar.current.component(.weekday, from:lastDate!)
                    let month = Calendar.current.component(.month, from:lastDate!)
                    let date = Calendar.current.component(.day, from:lastDate!)
                    historyDate.text = "Last exercised: \(Calendar.current.weekdaySymbols[weekday-1]) \(Calendar.current.shortMonthSymbols[month-1]) \(date)"
                    historyLeft.text = String(exerciseContainer[index-1].leftWeights) + " lbs"
                    historyRight.text = String(exerciseContainer[index-1].rightWeights) + " lbs"
                    historyReps.text = "Last time: " + String(exerciseContainer[index-1].totalReps)
                }
                else {
                    // didn't find an entry, first time I am doing this exercise then
                    historyDate.text = ""
                    historyLeft.text = "0 lbs"
                    historyRight.text = "0 lbs"
                    historyReps.text = "0"
                }
            } catch {
                print (error.localizedDescription)
            }// end catch
            
            //if repsonly dont display weights
            if (isRepsOnly) {
                leftWeights.isHidden = true
                rightWeights.isHidden = true
                labelSaysLeft.isHidden = true
                labelSaysRight.isHidden = true
            }
            
            
        } // end if
    } // end viewDidLoad()
    
    func seeddata() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let exerciseEntity = NSEntityDescription.entity(forEntityName: "ExerciseRecord", in: managedContext)!
        
        
        self.formatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        let seed1 = NSManagedObject(entity: exerciseEntity, insertInto: managedContext)
        seed1.setValue(self.formatter.date(from: "2018/10/01 17:30"), forKey: "date")
        seed1.setValue("Oct 01,2018", forKey: "day")
        seed1.setValue("Chest & Back", forKey: "workout")

        let seed2 = NSManagedObject(entity: exerciseEntity, insertInto: managedContext)
        seed2.setValue(self.formatter.date(from: "2018/10/03 17:30"), forKey: "date")
        seed2.setValue("Oct 03,2018", forKey: "day")
        seed2.setValue("Plyometrics", forKey: "workout")
        
        let seed3 = NSManagedObject(entity: exerciseEntity, insertInto: managedContext)
        seed3.setValue(self.formatter.date(from: "2018/10/05 17:30"), forKey: "date")
        seed3.setValue("Oct 05,2018", forKey: "day")
        seed3.setValue("Shoulders & Arms", forKey: "workout")
        
        let seed4 = NSManagedObject(entity: exerciseEntity, insertInto: managedContext)
        seed4.setValue(self.formatter.date(from: "2018/10/10 17:30"), forKey: "date")
        seed4.setValue("Oct 10,2018", forKey: "day")
        seed4.setValue("Chest & Back", forKey: "workout")

        let seed5 = NSManagedObject(entity: exerciseEntity, insertInto: managedContext)
        seed5.setValue(self.formatter.date(from: "2018/10/11 17:30"), forKey: "date")
        seed5.setValue("Oct 11,2018", forKey: "day")
        seed5.setValue("Plyometrics", forKey: "workout")

        let seed6 = NSManagedObject(entity: exerciseEntity, insertInto: managedContext)
        seed6.setValue(self.formatter.date(from: "2018/10/12 17:30"), forKey: "date")
        seed6.setValue("Oct 12,2018", forKey: "day")
        seed6.setValue("Shoulders & Arms", forKey: "workout")

        let seed7 = NSManagedObject(entity: exerciseEntity, insertInto: managedContext)
        seed7.setValue(self.formatter.date(from: "2018/10/17 17:30"), forKey: "date")
        seed7.setValue("Oct 17,2018", forKey: "day")
        seed7.setValue("Chest & Back", forKey: "workout")

        let seed8 = NSManagedObject(entity: exerciseEntity, insertInto: managedContext)
        seed8.setValue(self.formatter.date(from: "2018/10/18 17:30"), forKey: "date")
        seed8.setValue("Oct 18,2018", forKey: "day")
        seed8.setValue("Plyometrics", forKey: "workout")

        let seed9 = NSManagedObject(entity: exerciseEntity, insertInto: managedContext)
        seed9.setValue(self.formatter.date(from: "2018/10/19 17:30"), forKey: "date")
        seed9.setValue("Oct 19,2018", forKey: "day")
        seed9.setValue("Shoulders & Arms", forKey: "workout")

        let seed10 = NSManagedObject(entity: exerciseEntity, insertInto: managedContext)
        seed10.setValue(self.formatter.date(from: "2018/10/20 17:30"), forKey: "date")
        seed10.setValue("Oct 20,2018", forKey: "day")
        seed10.setValue("Legs & Back", forKey: "workout")

        let seed11 = NSManagedObject(entity: exerciseEntity, insertInto: managedContext)
        seed11.setValue(self.formatter.date(from: "2018/10/25 17:30"), forKey: "date")
        seed11.setValue("Oct 25,2018", forKey: "day")
        seed11.setValue("Chest & Back", forKey: "workout")

        let seed12 = NSManagedObject(entity: exerciseEntity, insertInto: managedContext)
        seed12.setValue(self.formatter.date(from: "2018/10/26 17:30"), forKey: "date")
        seed12.setValue("Oct 26,2018", forKey: "day")
        seed12.setValue("Plyometrics", forKey: "workout")

        let seed13 = NSManagedObject(entity: exerciseEntity, insertInto: managedContext)
        seed13.setValue(self.formatter.date(from: "2018/10/27 17:30"), forKey: "date")
        seed13.setValue("Oct 27,2018", forKey: "day")
        seed13.setValue("Shoulders & Arms", forKey: "workout")

        let seed14 = NSManagedObject(entity: exerciseEntity, insertInto: managedContext)
        seed14.setValue(self.formatter.date(from: "2018/10/28 17:30"), forKey: "date")
        seed14.setValue("Oct 28,2018", forKey: "day")
        seed14.setValue("Ab Ripper X", forKey: "workout")

        let seed15 = NSManagedObject(entity: exerciseEntity, insertInto: managedContext)
        seed15.setValue(self.formatter.date(from: "2018/10/29 17:30"), forKey: "date")
        seed15.setValue("Oct 29,2018", forKey: "day")
        seed15.setValue("Ab Ripper X", forKey: "workout")

        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    @IBAction func saveTapped(_ sender: Any) {        
        appDelegate.persistentContainer.performBackgroundTask{ (backgroundContext) in
            
            let exerciseEntity = ExerciseRecord(context: backgroundContext)
            
            // dispatch UIlabel updates to main thread
            DispatchQueue.main.async {
                
                // 
                // set todays' date
                exerciseEntity.date = Date()
                
                self.formatter.dateFormat = "MMM dd,yyyy"
                exerciseEntity.day = self.formatter.string(from: Date())
                self.formatter.dateFormat = "HH:mm"

                // set values
                exerciseEntity.name = self.exerciseLabel.text
                exerciseEntity.workout = workoutInFocus
                exerciseEntity.leftWeights = Int16(self.leftWeights.text!) ?? 0
                exerciseEntity.rightWeights = Int16(self.rightWeights.text!) ?? 0
                exerciseEntity.totalReps = Int16(self.totalReps.text!) ?? 0
                exerciseEntity.diet = didDietToday
                print("setting diet to: \(didDietToday)")

                // debug
                print (exerciseEntity.day!)
                print (exerciseEntity.name!)
                print (exerciseEntity.workout!)
                print (exerciseEntity.leftWeights)
                print (exerciseEntity.rightWeights)
                print (exerciseEntity.totalReps)
                
            }
            
            do {
                // some error checking is needed here to make sure you only save 1 entry per day so insert first time, update subsequent times if this button is pressed on same day
                try backgroundContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }// end appDelegate
    }// end saveTapped
    
    // call this method when the user clicks on the view outside the UITextField
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}// end class
