import Foundation

struct BasketModel {
    let TotalSum: (_ cars:[Car]) -> Int = { cars in
        var sum = 0
        for i in cars {
            sum += i.carPrice
        }
        return sum
    }
    
    let TotalCount: (_ cars:[Car]) -> Int = { cars in
        return cars.count
    }
}
