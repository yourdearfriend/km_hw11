import Foundation

struct Animal {
    let status: String?
    let message: String?
    
    
    init(animalData: [String: Any]) {
        status = animalData["status"] as? String
        message = animalData["message"] as? String
    }

    static func getAnimal(from value: Any) -> Animal? {
        guard let animalData = value as? [String: Any] else { return nil }
        
        return Animal(animalData: animalData)
    }
}
