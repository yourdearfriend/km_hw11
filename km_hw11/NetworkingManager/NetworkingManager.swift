
import UIKit
import Alamofire


enum URLSExamples: String {
    case shiba = "https://dog.ceo/api/breed/shiba/images/random"
    case akita = "https://dog.ceo/api/breed/akita/images/random"
    case eksimo = "https://dog.ceo/api/breed/eksimo/images/random"
    case husky = "https://dog.ceo/api/breed/husky/images/random"
    case dachshund = "https://dog.ceo/api/breed/dachshund/images/random"
    case mix = "https://dog.ceo/api/breed/mix/images/random"
    case random = "https://dog.ceo/api/breeds/image/random"
}

class NetworkingManager {
    
    static let shared = NetworkingManager()
    
    private init() {}
    
    func fetchData(from URL: String, with complition: @escaping (Animal?) -> Void) {
        AF.request(URL)
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let animal = Animal.getAnimal(from: value) ?? nil
                    DispatchQueue.main.async {
                        complition(animal ?? nil)
                    }
                case .failure(let value):
                    print(value)
                }
            }
    }
}

class ImageManager {
    
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
}
