//
//  ViewController.swift
//  RGB
//
//  Created by Sergey Novoselov on 19.07.2020.
//  Copyright © 2020 Sergey Novoselov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var viewLabel: UIView!
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup view
        viewLabel.layer.cornerRadius = 10
        viewLabel.backgroundColor = UIColor.init(red: 0.0,
                                                 green: 0.25,
                                                 blue: 0.5,
                                                 alpha: 1)
        
        //Setup sliders
        redSlider.value = 0
        redSlider.maximumValue = 1
        redSlider.minimumValue = 0
        redSlider.minimumTrackTintColor = .red
        
        greenSlider.value = 0.25
        greenSlider.maximumValue = 1
        greenSlider.minimumValue = 0
        greenSlider.minimumTrackTintColor = .green
        
        blueSlider.value = 0.50
        blueSlider.maximumValue = 1
        blueSlider.minimumValue = 0
        blueSlider.minimumTrackTintColor = .blue
        
        //Setup labels
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        
        //Setup text filds
        redTextField.delegate = self
        
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
        
        let toolbar = UIToolbar().ToolbarKeyboard(mySelector: #selector(ViewController.dismissKeyboard))
        
        redTextField.inputAccessoryView = toolbar
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            redLabel.text = String(format: "%.2f", redSlider.value)
            redTextField.text = String(format: "%.2f", redSlider.value)
            changeColor()
        case 1:
            greenLabel.text = String(format: "%.2f", greenSlider.value)
            greenTextField.text = String(format: "%.2f", greenSlider.value)
            changeColor()
        case 2:
            blueLabel.text = String(format: "%.2f", blueSlider.value)
            blueTextField.text = String(format: "%.2f", blueSlider.value)
            changeColor()
        default: break
        }
    }
    
    @IBAction func redTextFieldAction() {
    }
    @IBAction func greenTextFieldAction() {
    }
    @IBAction func blueTextFieldAction() {
    }
    
    func changeColor () {
        viewLabel.backgroundColor = UIColor.init(red: CGFloat(redSlider.value),
                                                 green: CGFloat(greenSlider.value),
                                                 blue: CGFloat(blueSlider.value),
                                                 alpha: 1)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        redTextField.resignFirstResponder()
        return true
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIToolbar {
    func ToolbarKeyboard(mySelector: Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.blue
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: UIBarButtonItem.Style.plain,
                                         target: self,
                                         action: mySelector)
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
}
