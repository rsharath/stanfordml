//
//  WorkoutListingTableViewCell.swift
//  PowerBuilder
//
//  Created by Sharath Rajasekar on 10/9/18.
//  Copyright © 2018 Chicory LLC. All rights reserved.
//

import Foundation
import UIKit

class WorkoutListingTableViewCell : UITableViewCell {
    
    @IBOutlet weak var exerciseLabel: UILabel!
    
    func configureWith(exerciseTitle: String) {
        print(exerciseTitle)
        exerciseLabel.text = exerciseTitle
    }
}


