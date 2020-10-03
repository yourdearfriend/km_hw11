//
//  ViewController.swift
//  km_hw11
//
//  Created by Konstantin on 27.09.2020.
//

import UIKit

class DogsUICollectionViewController: UICollectionViewController {
    
    
    private let itemsPerRow: CGFloat = 2
    private let sectionInserts = UIEdgeInsets(top: 16,
                                              left: 16,
                                              bottom: 16,
                                              right: 16)
    private let userActions = UserActions.allCases
    var dog: Animal?
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DogViewCell
        
        let userAction = userActions[indexPath.item]
        cell.dogNameLabel.text = userAction.rawValue

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        switch userAction {
        case .shiba:
            print("shiba")
            NetworkingManager.shared.fetchData(from: URLSExamples.shiba.rawValue) { dog in
                self.dog = dog
            }
        case .akita:
            NetworkingManager.shared.fetchData(from: URLSExamples.akita.rawValue) { dog in
                self.dog = dog
            }
        case .eksimo:
            NetworkingManager.shared.fetchData(from: URLSExamples.eksimo.rawValue) { dog in
                self.dog = dog
            }
        case .husky:
            NetworkingManager.shared.fetchData(from: URLSExamples.husky.rawValue) { dog in
                self.dog = dog
            }
        case .dachshund:
            NetworkingManager.shared.fetchData(from: URLSExamples.dachshund.rawValue) { dog in
                self.dog = dog
            }
        case .mix:
            NetworkingManager.shared.fetchData(from: URLSExamples.mix.rawValue) { dog in
                self.dog = dog
            }
        case .random:
            NetworkingManager.shared.fetchData(from: URLSExamples.random.rawValue) { dog in
                self.dog = dog
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dogVC = segue.destination as! DogViewController
        dogVC.dog = dog
    }
}


extension DogsUICollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        print(paddingWidth)
        let availableWidth = collectionView.frame.width - paddingWidth
        print(availableWidth)
        let widthPerItem = availableWidth / itemsPerRow
        print(widthPerItem)
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}

extension DogsUICollectionViewController {
    enum UserActions: String, CaseIterable {
        case shiba = "Shiba"
        case akita = "Akita"
        case eksimo = "Eksimo"
        case husky = "Husky"
        case dachshund = "Dachshund"
        case mix = "Mix"
        case random = "Random"
    }
}
