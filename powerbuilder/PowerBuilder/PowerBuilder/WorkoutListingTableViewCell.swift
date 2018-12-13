//
//  workoutTableViewCell.swift
//  PowerBuilder
//
//  Created by Sharath Rajasekar on 10/9/18.
//  Copyright © 2018 Chicory LLC. All rights reserved.
//

import Foundation
import UIKit

class workoutTableViewCell : UITableViewCell {
    @IBOutlet weak var workoutTitleLabel: UILabel!
    
    func configureWith(exerciseTitle: String) {
        print(exerciseTitle)
        //workoutTitleLabel.text = exerciseTitle
    }
}


