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
        setupImageView(url: dog?.message ?? "https://www.youarecurrent.com/wp-content/uploads/2014/09/PETS-Mikesell.jpg")
    }
    
    private func setupImageView(url: String) {
        DispatchQueue.main.async {
            guard let imageData = ImageManager.shared.fetchImage(from: url) else { return }
            DispatchQueue.main.async {
                self.dogView.image = UIImage(data: imageData)
                self.activityIndicator.stopAnimating()
                self.dogView.isHidden = false
            }
        }
    }
}
