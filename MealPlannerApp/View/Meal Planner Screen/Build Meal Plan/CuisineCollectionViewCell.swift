//
//  CuisineCollectionViewCell.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/25/23.
//

import UIKit

class CuisineCollectionViewCell: UICollectionViewCell {
    static let identifier = "CuisineCollectionViewCell"
    
    private let recipeImageResult: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let recipeNameLabel: UILabel = {
        let name = UILabel()
        name.textColor = .label
        name.font = .systemFont(ofSize: 16, weight: .medium)
        name.backgroundColor = .secondarySystemBackground
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubViews(recipeImageResult, recipeNameLabel)
        initConstraints()
        styleForCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styleForCell(){
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 4.0
        contentView.layer.shadowOpacity = 0.4
    }
    
    private func initConstraints(){
//        recipeImageResult.pin(to: contentView)
        
        NSLayoutConstraint.activate([
            recipeNameLabel.heightAnchor.constraint(equalToConstant: 40),
            recipeNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            recipeNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            recipeNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            
            recipeImageResult.bottomAnchor.constraint(equalTo: recipeNameLabel.topAnchor, constant: -3),
            recipeImageResult.topAnchor.constraint(equalTo: contentView.topAnchor),
            recipeImageResult.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            recipeImageResult.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            
        ])

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        recipeImageResult.image = nil
        recipeNameLabel.text = nil
    }
    
    public func configure(with viewModel: BuildPlanViewViewModel){
        recipeNameLabel.text = viewModel.foodName
        viewModel.fetchRecipeImage{ [weak self]result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.recipeImageResult.image = image
                }
            case .failure(let error):
                print(String(describing: error))
            }
            
        }
    }
}
