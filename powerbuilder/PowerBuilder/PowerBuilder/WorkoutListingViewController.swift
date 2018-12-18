//
//  WorkoutListingViewController.swift
//  PowerBuilder
//
//  Created by Sharath Rajasekar on 10/9/18.
//  Copyright © 2018 Chicory LLC. All rights reserved.
//

import UIKit

struct Exercise {
    let date: Date
    let day: String
    let name: String
    let leftWeight: Int
    let rightWeight: Int
    let totalReps: Int
    let repsOnly: Bool
    let workout: String
    let diet: Bool
}

class WorkoutListingViewController: UIViewController {

    var dataSource: [Any] = []

    private func initDataSource() {

                //remember I am doing an init of date to nulls
        
                switch workoutInFocus {
                    case "Ab Ripper X":
                        dataSource = [
                            Exercise(date: Date(), day: "", name: "In & Outs", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Ab Ripper X", diet: false),
                            Exercise(date: Date(), day: "", name: "Seated Bicycle", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Ab Ripper X", diet: false),
                            Exercise(date: Date(), day: "", name: "Reverse Bicycle", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Ab Ripper X", diet: false),
                            Exercise(date: Date(), day: "", name: "In & Outs", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Ab Ripper X", diet: false),
                            Exercise(date: Date(), day: "", name: "Seated Bicycle", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Ab Ripper X", diet: false),
                            Exercise(date: Date(), day: "", name: "Reverse Bicycle", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Ab Ripper X", diet: false),
                            Exercise(date: Date(), day: "", name: "Seated Crunchy Frog", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Ab Ripper X", diet: false),
                            Exercise(date: Date(), day: "", name: "Cross Leg Sit Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Ab Ripper X", diet: false),
                            Exercise(date: Date(), day: "", name: "Fifer Scissor", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Ab Ripper X", diet: false),
                            Exercise(date: Date(), day: "", name: "In & Outs", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Ab Ripper X", diet: false),
                            Exercise(date: Date(), day: "", name: "Hip Rock & Raise", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Ab Ripper X", diet: false),
                            Exercise(date: Date(), day: "", name: "Pulse Up", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Ab Ripper X", diet: false),
                            Exercise(date: Date(), day: "", name: "Roll Up/V Combo", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Ab Ripper X", diet: false),
                            Exercise(date: Date(), day: "", name: "Oblique V-Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Ab Ripper X", diet: false),
                            Exercise(date: Date(), day: "", name: "Leg Climbs", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Ab Ripper X", diet: false),
                            Exercise(date: Date(), day: "", name: "Mason Twist", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Ab Ripper X", diet: false)
                        ]
                        break
                    case "Chest & Back":
                        dataSource = [
                            Exercise(date: Date(), day: "", name: "Standard Push-Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Wide Front Pull Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Military Push-Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Reverse Grip Chin-Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Wide Fly Push-Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Closed Grip Pull Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Decline Push-Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Heavy Pants", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Diamond Push-Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Lawnmovers", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Dive Bomber Push-Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Back Flys", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Wide Front Pull Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Standard Push-Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Reverse Grip Chin-Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Military Push-Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Closed Grip Pull Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Wide Fly Push-Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Heavy Pants", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Decline Push-Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Lawnmovers", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Diamond Push-Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Back Flys", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Chest & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Dive Bomber Push-Ups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Chest & Back", diet: false)
                        ]
                    break
                    case "Plyometrics":
                    break
                    case "Shoulders & Arms":
                        dataSource = [
                            Exercise(date: Date(), day: "", name: "Alternating Shoulder Press", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "In & Out Bicep Curls", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Two Arm Tricep Kickback", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Alternating Shoulder Press", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "In & Out Bicep Curls", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Two Arm Tricep Kickback", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Deep Swimmer Press", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Full Supination Concentration Curl", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Two Arm Tricep Kickback", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Deep Swimmer Press", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Full Supination Concentration Curl", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Chair Dips", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Upright Rows", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Static Arm Curls", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Flip Grip Twist Tricep Kickback", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Upright Rows", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Static Arm Curls", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Flip Grip Twist Tricep Kickback", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Seated Two Angle Shoulder Flys", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Crouching Cohen Curls", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Lying Down Tricep Extension", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Seated Two Angle Shoulder Flys", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Crouching Cohen Curls", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Lying Down Tricep Extension", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "In & Out Straight-Arm Shoulder Flys", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Congdon Curls", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Side Tri-Rise", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "In & Out Straight-Arm Shoulder Flys", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Congdon Curls", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: false, workout: "Shoulders & Arms", diet: false),
                            Exercise(date: Date(), day: "", name: "Side Tri-Rise", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Shoulders & Arms", diet: false)
                        ]
                    break
                    case "YogaX":
                        dataSource = [
                            Exercise(date: Date(), day: "", name: "Upright Rows", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "YogaX", diet: false),
                            Exercise(date: Date(), day: "", name: "Heavy Pants", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "YogaX", diet: false),
                            Exercise(date: Date(), day: "", name: "Standard Pushups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "YogaX", diet: false)
                        ]
                    break
                    case "Legs & Back":
                        dataSource = [
                            Exercise(date: Date(), day: "", name: "Upright Rows", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Legs & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Heavy Pants", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Legs & Back", diet: false),
                            Exercise(date: Date(), day: "", name: "Standard Pushups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Legs & Back", diet: false)
                        ]
                    break
                    case "KenpoX":
                        dataSource = [
                            Exercise(date: Date(), day: "", name: "Upright Rows", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "KenpoX", diet: false),
                            Exercise(date: Date(), day: "", name: "Heavy Pants", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "KenpoX", diet: false),
                            Exercise(date: Date(), day: "", name: "Standard Pushups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "KenpoX", diet: false)
                        ]
                    break
                    case "Rest/Stretch":
                        dataSource = [
                            Exercise(date: Date(), day: "", name: "Upright Rows", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Rest/Stretch", diet: false),
                            Exercise(date: Date(), day: "", name: "Heavy Pants", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Rest/Stretch", diet: false),
                            Exercise(date: Date(), day: "", name: "Standard Pushups", leftWeight: 0, rightWeight: 0, totalReps:0, repsOnly: true, workout: "Rest/Stretch", diet: false)
                        ]
                    break
                default:
                    print ("this should never happen")
                 }
    }
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var todaysDateLabel: UILabel!
    @IBAction func dietEnabled(_ sender: UISwitch) {
        didDietToday = sender.isOn
    }
    @IBOutlet weak var dietSlider: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.dataSource = self
        tblView.delegate = self
        dietSlider.isOn = didDietToday
        tblView.register(UINib(nibName:"WorkoutListingTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ExerciseCell")

        workoutLabel.text = workoutInFocus
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        todaysDateLabel.text = formatter.string(from: Date())
        initDataSource()
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        //save data and go to previous screen
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    private func constructCellModel(cellModel: Any, tableView: UITableView)->UITableViewCell {

        var cell  = UITableViewCell()
        
        switch cellModel {
        case let exerciseModel as Exercise:
            
            if let exerciseCell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell") as? WorkoutListingTableViewCell {
                exerciseCell.configureWith(exerciseTitle: exerciseModel.name)
                cell = exerciseCell
            }
        default:
            print("Couldn't map a cell, using default")
        }
        
        return cell
    }

}

extension WorkoutListingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let detailViewController = mainStoryboard.instantiateViewController(withIdentifier: "ExerciseDetailsViewController") as? ExerciseDetailsViewController else {
            return
        }
        
        detailViewController.detailsModel = dataSource[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension WorkoutListingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = dataSource[indexPath.row]
        let cell = constructCellModel(cellModel: cellModel, tableView: tableView)
        return cell
    }
}
