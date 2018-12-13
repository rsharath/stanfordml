//
//  workoutViewController.swift
//  PowerBuilder
//
//  Created by Sharath Rajasekar on 10/9/18.
//  Copyright © 2018 Chicory LLC. All rights reserved.
//

import UIKit

struct Exercise{
    let title: String
}

class workoutViewController: UIViewController {    
 
    var dataSource: [Any] = [
        Exercise(title: "Upright Rows"),
        Exercise(title: "Heavy Pants")
    ]
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.dataSource = self
        tblView.delegate = self
        tblView.register(UINib(nibName:"workoutTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "workoutCell")
    }
    
    private func constructCellModel(cellModel: Any, tableView: UITableView)->UITableViewCell {

        var cell  = UITableViewCell()
        
        switch cellModel {
        case let exerciseModel as Exercise:
            
            if let exerciseCell = tableView.dequeueReusableCell(withIdentifier: "workoutCell") as? workoutTableViewCell {
                exerciseCell.configureWith(exerciseTitle: exerciseModel.title)
                cell = exerciseCell
            }
        default:
            print("Couldn't map a cell, using default")
        }
        
        return cell
    }
}

extension workoutViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let detailViewController = mainStoryboard.instantiateViewController(withIdentifier: "detailsViewController") as? detailsViewController else {
            return
        }
        
        detailViewController.detailsModel = dataSource[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension workoutViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = dataSource[indexPath.row]
        let cell = constructCellModel(cellModel: cellModel, tableView: tableView)
        return cell
    }
}
