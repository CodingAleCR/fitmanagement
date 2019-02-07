//
//  WorkoutCell.swift
//  Fit Management
//
//  Created by Alejandro Ulate Fallas  on 12/30/18.
//  Copyright © 2018 Alejandro Ulate Fallas . All rights reserved.
//

import UIKit

class WorkoutCell: UITableViewCell {
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var workoutLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bind(workout: Workout) {
        workoutLabel.text = workout.type.rawValue
        durationLabel.text = "\(workout.duration) min."
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateLabel.text = dateFormatter.string(from: workout.date)
    }
}
