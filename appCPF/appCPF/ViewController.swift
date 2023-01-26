//
//  ViewController.swift
//  appCPF
//
//  Created by ALYSSON DODO on 26/01/23.
//

import UIKit
import TLCustomMask

class ViewController: UIViewController {
    
    @IBOutlet weak var cpfTextField: UITextField!
    
    
    var customMaskCPF: TLCustomMask?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cpfTextField.delegate = self
        customMaskCPF = TLCustomMask(formattingPattern: "$$$.$$$.$$$-$$")
        
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
        case cpfTextField:
            if let text: String = customMaskCPF?.formatStringWithRange(range: range, string: string){
                self.cpfTextField.text = text
                return false
            }else{
                return true
            }
        default:
            return true
        }
    }
}
