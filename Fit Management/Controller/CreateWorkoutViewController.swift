//
//  CreateWorkoutViewController.swift
//  Fit Management
//
//  Created by Alejandro Ulate Fallas  on 12/30/18.
//  Copyright © 2018 Alejandro Ulate Fallas . All rights reserved.
//

import UIKit

class CreateWorkoutViewController: UIViewController {

    @IBOutlet weak var workoutPicker: UIPickerView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var workoutCreatedHandler: ((Workout) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        workoutPicker.delegate = self
        workoutPicker.dataSource = self
        
        updateDuration()
    }
    
    @IBAction func createWorkout(_ sender: UIBarButtonItem) {
        let duration = Int(durationSlider.value)
        let date = datePicker.date
        let type = WorkoutType.allCases[workoutPicker.selectedRow(inComponent: 0)]
        let workout = Workout(duration: duration, date:date, type: type)
        
        workoutCreatedHandler?(workout)
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func duration_changed(_ sender: UISlider) {
        updateDuration()
    }
    
    func updateDuration() {
        let duration = Int(durationSlider.value)
        durationLabel.text = "Duración: \(duration) minutos."
    }
}

extension CreateWorkoutViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return WorkoutType.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return WorkoutType.allCases[row].rawValue
    }
}
