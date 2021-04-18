//
//  FlagDetailsViewController.swift
//  TreasureHunt
//
//  Created by Ben Jenkyn on 2021-04-11.
//

import UIKit

class FlagDetailsViewController: UIViewController {

    public var flag = Flag.init(name: "",
                                address: "",
                                task: "",
                                tags: "",
                                description: "")
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var taskTxtView: UITextView!
    @IBOutlet weak var tagsLbl: UILabel!
    @IBOutlet weak var descriptionTxtView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = flag.name
        addressLbl.text = flag.address
        taskTxtView.text = flag.task
        tagsLbl.text = flag.tags
        descriptionTxtView.text = flag.description
    }
}
