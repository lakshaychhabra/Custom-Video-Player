//
//  ThirdViewController.swift
//  Custom-Video-Player
//
//  Created by Lakshay Chhabra on 22/04/18.
//  Copyright © 2018 Lakshay Chhabra. All rights reserved.
//

import UIKit


class ThirdViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var timeLabel: UILabel!
    static var reps : String = ""
    @IBOutlet var picker: UIPickerView!
    var seconds = 5
    let repDone = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
        runTimer()
        
    }
    
        func runTimer() {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ThirdViewController.updateTimer)), userInfo: nil, repeats: true)
        }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return repDone.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return repDone[row]
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ThirdViewController.reps = repDone[row]
        
    }
    
    
    @IBAction func continueToNextButton(_ sender: Any) {
        performSegue(withIdentifier: "toScreen1From3", sender: self)
    }
    
    @objc func updateTimer(){
        seconds -= 1
        timeLabel.text = "00:0\(seconds)"
        if seconds == 0 {
            timer.invalidate()
            performSegue(withIdentifier: "toScreen4From3", sender: self)
            
        }
    }
    
}
