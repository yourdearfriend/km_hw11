//
//  ViewController.swift
//  km_hw11
//
//  Created by Konstantin on 27.09.2020.
//

import UIKit

class DogsUICollectionViewController: UICollectionViewController {
    
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
        print(userAction)
//        switch userAction {
//        case .shiba:
//            print("shiba")
//            NetworkingManager.shared.fetchData(from: URLSExamples.shiba.rawValue) { dog in
//                self.dog = dog
//            }
//            nextVC()
//        case .akita:
//            NetworkingManager.shared.fetchData(from: URLSExamples.akita.rawValue) { dog in
//                self.dog = dog
//            }
//            nextVC()
//        case .eksimo:
//            NetworkingManager.shared.fetchData(from: URLSExamples.eksimo.rawValue) { dog in
//                self.dog = dog
//            }
//            nextVC()
//        case .husky:
//            NetworkingManager.shared.fetchData(from: URLSExamples.husky.rawValue) { dog in
//                self.dog = dog
//            }
//            nextVC()
//        case .dachshund:
//            NetworkingManager.shared.fetchData(from: URLSExamples.dachshund.rawValue) { dog in
//                self.dog = dog
//            }
//            nextVC()
//        case .mix:
//            NetworkingManager.shared.fetchData(from: URLSExamples.mix.rawValue) { dog in
//                self.dog = dog
//            }
//            nextVC()
//        case .random:
//            NetworkingManager.shared.fetchData(from: URLSExamples.random.rawValue) { dog in
//                self.dog = dog
//            }
//            nextVC()
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dogVC = segue.destination as! DogViewController
        dogVC.dog = self.dog
    }
    
    func nextVC() {
        performSegue(withIdentifier: "dogSegue", sender: nil)
    }
}


extension DogsUICollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width / 2.5 , height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
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
