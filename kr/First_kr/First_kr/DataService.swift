import Foundation
import UIKit

final class DataService {
    static let shared: DataService = DataService()
    
    var cars: [Car] = [Car(modelName: "Granta", carPrice: 699900, carImage: UIImage(named: "granta") ?? .actions), Car(modelName: "Vesta", carPrice: 1239900, carImage: UIImage(named: "vesta") ?? .actions), Car(modelName: "Niva Travel", carPrice: 1092900, carImage: UIImage(named: "niva_travel") ?? .actions), Car(modelName: "Niva Legend", carPrice: 829900, carImage: UIImage(named: "niva_legend") ?? .actions), Car(modelName: "Largus", carPrice: 950900, carImage: UIImage(named: "largus") ?? .actions)]
    var basket: [Car] = []
    
    func addToBasket(car: Car) {
        basket.append(car)
    }
}
