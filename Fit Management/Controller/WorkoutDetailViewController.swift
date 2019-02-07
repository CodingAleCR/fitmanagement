//
//  WorkoutDetailViewController.swift
//  Fit Management
//
//  Created by Alejandro Ulate Fallas  on 12/30/18.
//  Copyright © 2018 Alejandro Ulate Fallas . All rights reserved.
//

import UIKit

class WorkoutDetailViewController: UIViewController {
    
    var workout: Workout!

    @IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bind()
    }
    

    func bind() {
        workoutLabel.text = workout.type.rawValue
        durationLabel.text = "\(workout.duration) min."
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateLabel.text = dateFormatter.string(from: workout.date)
    }
}
