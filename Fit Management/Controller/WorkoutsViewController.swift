//
//  WorkoutsViewController.swift
//  Fit Management
//
//  Created by Alejandro Ulate Fallas  on 12/28/18.
//  Copyright © 2018 Alejandro Ulate Fallas . All rights reserved.
//

import UIKit

class WorkoutsViewController: UIViewController {
    
    @IBOutlet weak var workoutsTable: UITableView!
    private var workouts = [Workout]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let logoutBtn = UIBarButtonItem.init(title: "Salir", style: .plain, target: self, action: #selector(logout))
        
        navigationItem.rightBarButtonItem = logoutBtn
        
        workoutsTable.delegate = self
        workoutsTable.dataSource = self
    }
    
    @objc
    func logout() {
        dismiss(animated: true, completion: nil)
    }

    func addWorkout(workout: Workout) -> Void {
        workouts.append(workout)
        workoutsTable.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "workoutsToCreate" {
            if let createVC = segue.destination as? CreateWorkoutViewController {
                createVC.workoutCreatedHandler = addWorkout
            }
        } else {
            if let detailVC = segue.destination as? WorkoutDetailViewController {
                if let workout = sender as? Workout {
                    detailVC.workout = workout
                }
            }
        }
    }
}

extension WorkoutsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = workoutsTable.dequeueReusableCell(withIdentifier: "workoutCell", for: indexPath) as? WorkoutCell {
            cell.bind(workout: workouts[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            workouts.remove(at: indexPath.row)
            workoutsTable.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "workoutsToDetail", sender: workouts[indexPath.row])
    }
}
