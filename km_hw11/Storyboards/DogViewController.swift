//
//  DogViewController.swift
//  km_hw11
//
//  Created by Konstantin on 27.09.2020.
//

import UIKit

class DogViewController: UIViewController {

    @IBOutlet var dogView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var dog: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func awwwButtonPressed(_ sender: UIButton) {
        
    }
}
