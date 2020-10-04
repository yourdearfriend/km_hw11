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
    
    var dogURL: URLSExamples?
    var dog: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkingManager.shared.fetchData(from: dogURL?.rawValue ?? URLSExamples.random.rawValue) { dog in
            self.dog = dog
        }
        setupImageView(url: dog?.message ?? URLSExamples.typical.rawValue)
    }
    
    @IBAction func updateButtonPressed(_ sender: UIBarButtonItem) {
        NetworkingManager.shared.fetchData(from: dogURL?.rawValue ?? URLSExamples.random.rawValue) { dog in
            self.dog = dog
        }
        setupImageView(url: dog?.message ?? URLSExamples.typical.rawValue)
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
