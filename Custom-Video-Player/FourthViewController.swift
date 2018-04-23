//
//  FourthViewController.swift
//  Custom-Video-Player
//
//  Created by Lakshay Chhabra on 22/04/18.
//  Copyright © 2018 Lakshay Chhabra. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func skipRestButton(_ sender: Any) {
        performSegue(withIdentifier: "toScreen1from4", sender: self)
    }
    @IBAction func StopExerciseButton(_ sender: Any) {
        
        performSegue(withIdentifier: "toScreen5From4", sender: self)
    }
}
