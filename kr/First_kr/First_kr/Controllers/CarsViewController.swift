import UIKit

class CarsViewController: UIViewController {
    private let dataService = DataService.shared
    private var carsListView: CarsListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCarsListView()
        setupNavbar()
    }
}

extension CarsViewController {
    /// connect CarsListView with CarsViewController
    private func setupCarsListView() {
        view.backgroundColor = .white
        
        carsListView = CarsListView(frame: view.frame)
        view.addSubview(carsListView)
        carsListView.setupCarsDataSource(with: dataService.cars)
    }
    
    private func setupNavbar() {
        let basketAction: UIAction = UIAction { _ in
            self.navigationController?.pushViewController(BasketViewController(), animated: true)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "basket"), primaryAction: basketAction)
    }
}
