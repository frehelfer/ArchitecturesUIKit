//
//  HomeTableViewCell.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 07/02/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    // MARK: - Clousures
    
    // MARK: - Properties
    
    private lazy var imageService: ImageService = {
        let service = ImageService()
        
        service.onReceivedImage = { [weak self] image in
            self?.setupView(image)
        }
        
        return service
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .center
        view.spacing = 15
        view.distribution = .fill
        return view
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.opacity = 0
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        return spinner
    }()
    
    private lazy var labelStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 3
        view.distribution = .fill
        return view
    }()
    
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .label
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - Initializers
    
    static let identifier = "HomeTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    private func addSubViews() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(spinner)
        stackView.addArrangedSubview(image)
        
        stackView.addArrangedSubview(labelStackView)
        
        labelStackView.addArrangedSubview(firstLabel)
        labelStackView.addArrangedSubview(secondLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            spinner.heightAnchor.constraint(equalToConstant: 60),
            spinner.widthAnchor.constraint(equalToConstant: 60),

            image.heightAnchor.constraint(equalToConstant: 60),
            image.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    // MARK: - Actions
    
    private func setupView(_ image: UIImage) {
        self.image.image = image
        self.image.layer.opacity = 1
        
        spinner.stopAnimating()
    }
    
    public func setupCell(person: Person) {
        imageService.getImage(person: person)
        
        firstLabel.text = person.displayName
        secondLabel.text = person.details
    }
}
