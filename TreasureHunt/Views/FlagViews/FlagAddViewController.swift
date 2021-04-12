//
//  FlagAddViewController.swift
//  TreasureHunt
//
//  Created by Ben Jenkyn on 2021-04-11.
//

import UIKit
import FirebaseDatabase

class FlagAddViewController: UIViewController {
    private let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    public var TeammateData: ((String?, String?, String?) -> Void)?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var taskTextField: UITextView!
    @IBOutlet weak var tagsTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    @IBAction func saveTeamMemberBtn(_ sender: UIButton) {

        let name = nameTextField.text
        let address = addressTextField.text
        let task = taskTextField.text
        let tags = tagsTextField.text
        let description = descriptionTextView.text
        
        if name != "" && address != "" && task != "" && tags != "" && description != ""{
            //TeamViewController.setTeammate(name: name, phoneNo: phone, email: email)
            
    
            let flagObject: [String:Any] = [
                "name": name ?? "" as NSObject,
                "address": address ?? "",
                "task": task ?? "",
                "tags": tags ?? "",
                "description": description ?? ""
            ]

            
            ref.child("flags").childByAutoId().setValue(flagObject)
            dismiss(animated: true, completion: nil)
        }
    }
    
}
