//
//  FlagDetailsViewController.swift
//  TreasureHunt
//
//  Created by Ben Jenkyn on 2021-04-11.
//

import UIKit
import Cosmos

class FlagDetailsViewController: UIViewController {

    public var flag = Flag.init(name: "",
                                address: "",
                                task: "",
                                tags: "",
                                description: "",
                                rating: 0.0)
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var taskTxtView: UITextView!
    @IBOutlet weak var tagsLbl: UILabel!
    @IBOutlet weak var descriptionTxtView: UITextView!
    @IBOutlet weak var ratingView: CosmosView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = flag.name
        addressLbl.text = flag.address
        taskTxtView.text = flag.task
        tagsLbl.text = flag.tags
        descriptionTxtView.text = flag.description
        ratingView.rating = flag.rating
    }
}
