//
//  FifthViewController.swift
//  Custom-Video-Player
//
//  Created by Lakshay Chhabra on 22/04/18.
//  Copyright © 2018 Lakshay Chhabra. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    var rating = ""
    @IBOutlet var feedbackTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: .UIKeyboardWillChangeFrame, object: nil)
        self.hideKeyboardWhenTappedAround()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        feedbackTextField.resignFirstResponder()
    }

    //keyboard hide
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        
        feedbackTextField.returnKeyType = .done
    }

    @IBAction func badReviewButton(_ sender: Any) {
        rating = "Bad"
    }
    
    @IBAction func goodReviewButton(_ sender: Any) {
        rating = "Good"
    }
    @IBAction func awesomeReviewButton(_ sender: Any) {
        rating = "Awesome"
    }
    
    @IBAction func submitButton(_ sender: Any) {
        feedbackTextField.text = ""
        print(feedbackTextField)
    }
    @objc func keyboardWillChange(notification: NSNotification) {
        
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let curFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let targetFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = targetFrame.origin.y - curFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
            self.feedbackTextField.frame.origin.y+=deltaY
            
        },completion: nil)
    }
        
}
