//
//  SearchResultTableViewCell.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 6/29/23.
//

import UIKit

class SearchResultCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SearchResultCollectionViewCell"
    
    private let recipeImageResult: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let recipeNameLabel: UILabel = {
        let name = UILabel()
        name.textColor = .label
        name.font = .systemFont(ofSize: 18, weight: .medium)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubViews(recipeImageResult, recipeNameLabel)
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initConstraints(){
        recipeImageResult.pin(to: contentView)
        NSLayoutConstraint.activate([
            recipeNameLabel.heightAnchor.constraint(equalToConstant: 50),
            recipeNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            recipeNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            recipeNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        ])
        recipeNameLabel.backgroundColor = .red
        recipeImageResult.backgroundColor = .green
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        recipeImageResult.image = nil
        recipeNameLabel.text = nil
    }
    
    public func configure(with viewModel: SearchRecipesCollectionViewCellViewModel){
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
