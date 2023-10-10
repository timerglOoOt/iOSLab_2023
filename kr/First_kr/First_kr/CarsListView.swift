import UIKit

class CarsListView: UIView {
    private lazy var catalogNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.text = "Список доступных машин"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var carsTableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.register(CarTableViewCell.self, forCellReuseIdentifier: "CarTableViewCell")
        table.rowHeight = 90
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var carsDataSource: [Car] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CarsListView {
    func setupCarsDataSource(with data: [Car]) {
        carsDataSource = data
    }
    
    private func setupLayout() {
        addSubview(catalogNameLabel)
        addSubview(carsTableView)
        
        NSLayoutConstraint.activate([
            catalogNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            catalogNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            carsTableView.topAnchor.constraint(equalTo: catalogNameLabel.bottomAnchor, constant: 20),
            carsTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            carsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            carsTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

extension CarsListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carsDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarTableViewCell", for: indexPath) as! CarTableViewCell
        let car = carsDataSource[indexPath.row]
        cell.configureCarCell(car: car)
        return cell
    }
}
