//
//  FeedCell.swift
//  Animals
//
//  Created by Diggo Silva on 15/10/24.
//

import UIKit

class FeedCell: UITableViewCell {
    static let identifier: String = "FeedCell"
    
    lazy var avatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(systemName: "person.crop.circle")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.text = "Name"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(animal: Animal) {
        nameLabel.text = animal.name
        
        switch animal.type {
        case .mamifero:
            avatarImageView.image = UIImage(systemName: animal.image)?.withTintColor(.systemPurple, renderingMode: .alwaysOriginal)
        case .reptil:
            avatarImageView.image = UIImage(systemName: animal.image)?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        case .aves:
            avatarImageView.image = UIImage(systemName: animal.image)?.withTintColor(.systemBrown, renderingMode: .alwaysOriginal)
        case .insetos:
            avatarImageView.image = UIImage(systemName: animal.image)?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        case .peixes:
            avatarImageView.image = UIImage(systemName: animal.image)?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        case .outros:
            avatarImageView.image = UIImage(systemName: animal.image)?.withTintColor(.systemIndigo, renderingMode: .alwaysOriginal)
        }
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        addSubview(avatarImageView)
        addSubview(nameLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
}
