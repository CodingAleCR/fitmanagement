//
//  Workout.swift
//  Fit Management
//
//  Created by Alejandro Ulate Fallas  on 12/30/18.
//  Copyright © 2018 Alejandro Ulate Fallas . All rights reserved.
//

import Foundation

struct Workout {
    var duration : Int
    var date : Date
    var type : WorkoutType
}

enum WorkoutType: String, CaseIterable {
    case EMOM, Tabata, AMRAP, ForTime
}

extension Workout: CustomStringConvertible {
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from: date)
        return "Workout: Day: \(dateString), Duration: \(duration), Type: \(type)"
    }
}

