//
//  detailsViewController.swift
//  PowerBuilder
//
//  Created by Sharath Rajasekar on 10/9/18.
//  Copyright © 2018 Chicory LLC. All rights reserved.
//

import Foundation
import UIKit

class detailsViewController : UIViewController {
    @IBOutlet weak var leftWeights: UITextField!
    @IBOutlet weak var rightWeights: UITextField!
    @IBOutlet weak var totalReps: UITextField!
    @IBOutlet weak var exerciseLabel: UILabel!
    
    var detailsModel :Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let exerciseModel = detailsModel as? Exercise {
            exerciseLabel.text = exerciseModel.title
        }
    }
}
