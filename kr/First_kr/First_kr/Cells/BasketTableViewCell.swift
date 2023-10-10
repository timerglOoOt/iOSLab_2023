import UIKit

class BasketTableViewCell: UITableViewCell {
    private lazy var carModelNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    private lazy var carImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var carPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// reset cell fields
    override func prepareForReuse() {
        super.prepareForReuse()
        
        carModelNameLabel.text = nil
        carImageView.image = nil
        carPriceLabel.text = nil
    }
}

extension BasketTableViewCell {
    
    /// configure car cell with entering data
    /// - Parameter car: the car that owns the cell
    func configureCarCell(car: Car) {
        carPriceLabel.text =  "\(car.carPrice) ₽"
        carImageView.image = car.carImage
        carModelNameLabel.text = car.modelName
    }
    /// function to  car cells setup layout
    private func setupLayout() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(carImageView)
        contentView.addSubview(carModelNameLabel)
        contentView.addSubview(carPriceLabel)
        
        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            carImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            carImageView.heightAnchor.constraint(equalToConstant: 100),
            carImageView.widthAnchor.constraint(equalToConstant: 100),

            carModelNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            carModelNameLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 15),
            carModelNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            carPriceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            carPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
        ])
    }
}
