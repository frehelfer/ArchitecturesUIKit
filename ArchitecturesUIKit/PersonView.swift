//
//  PersonView.swift
//  ArchitecturesUIKit
//
//  Created by Frédéric Helfer on 09/02/23.
//

import UIKit

class PersonView: UIView {
    
    // MARK: - Clousures
    
    // MARK: - Properties
    
    private lazy var imageService: ImageService = {
        let service = ImageService()
        
        service.onReceivedImage = { [weak self] image in
            self?.setupView(image)
        }
        
        return service
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 15
        view.distribution = .fill
        return view
    }()
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        return spinner
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.opacity = 0
        image.layer.borderWidth = 15
        image.layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
        return image
    }()
    
    private lazy var labelStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 17
        view.distribution = .fill
        return view
    }()
    
    private lazy var bioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var detailsStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 7
        view.distribution = .fill
        return view
    }()
    
    private lazy var experienceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var contactLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Initializers
    init(person: Person) {
        super.init(frame: .zero)
        
        imageService.getImage(person: person)
        setupView(person: person)
        
        backgroundColor = .systemGray5
        addSubViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    private func setupView(person: Person) {
        bioLabel.text = person.bio
        detailsLabel.text = person.details
        
        let boldAttribute = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .bold)]
        
        let experienceText = NSMutableAttributedString(string: "Experience: ", attributes: boldAttribute)
        experienceText.append(NSAttributedString(string: "\(person.experience) years"))
        experienceLabel.attributedText = experienceText
        
        let rateText = NSMutableAttributedString(string: "Rate: ", attributes: boldAttribute)
        rateText.append(NSAttributedString(string: "\(person.rate)"))
        rateLabel.attributedText = rateText
        
        let contactText = NSMutableAttributedString(string: "Contact: ", attributes: boldAttribute)
        contactText.append(NSAttributedString(string: "\(person.email)"))
        contactLabel.attributedText = contactText
    }
    
    private func addSubViews() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(spinner)
        stackView.addArrangedSubview(image)
        
        stackView.addArrangedSubview(labelStackView)
        
        labelStackView.addArrangedSubview(bioLabel)
        labelStackView.addArrangedSubview(detailsLabel)
        
        labelStackView.addArrangedSubview(detailsStackView)
        
        detailsStackView.addArrangedSubview(experienceLabel)
        detailsStackView.addArrangedSubview(rateLabel)
        detailsStackView.addArrangedSubview(contactLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            // ScrollView
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // StackView
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            labelStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            labelStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
            
            spinner.heightAnchor.constraint(equalToConstant: 300),
            spinner.widthAnchor.constraint(equalToConstant: 300),
            
            image.heightAnchor.constraint(equalToConstant: 300),
            image.widthAnchor.constraint(equalToConstant: 300),
            
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

        // TODO: add coisas
    }
    
}
