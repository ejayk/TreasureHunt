//
//  ViewController.swift
//  TreasureHunt
//
//  Created by Esther Kim on 2021-03-10.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    @IBOutlet var menuBtns: [UIButton]!
    
    @IBAction func handle(_ sender: UIButton) {
        menuBtns.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
