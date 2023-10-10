import UIKit

class BasketViewController: UIViewController {
    var basket: [Car] = DataService.shared.basket
    private var basketListView: BasketListView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBasketListView()
    }
}

extension BasketViewController {
    private func setupBasketListView() {
        view.backgroundColor = .white
        
        basketListView = BasketListView(frame: view.frame)
        view.addSubview(basketListView)
        basketListView.setupCarsDataSource(with: basket)
    }
}
