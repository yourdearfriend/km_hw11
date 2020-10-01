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
        setupImageView(url: dog?.message ?? "www.ya.ru")
    }
    
    @IBAction func awwwButtonPressed(_ sender: UIButton) {
        NetworkingManager.shared.fetchData(from: dog?.message ?? "www.ya.ru") { dog in
            self.dog = dog
        }
        setupImageView(url: dog?.message ?? "www.ya.ru")
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dog = nil
    }
    
}
