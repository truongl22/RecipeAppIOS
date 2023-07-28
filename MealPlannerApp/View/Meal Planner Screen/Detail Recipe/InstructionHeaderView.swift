//
//  InstructionHeaderView.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/13/23.
//

import UIKit

class InstructionHeaderView: UIView {
    private let recipeImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        //        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var recipeNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var tabs: [UIButton] = ["Ingredients", "Instructions"]
        .map { buttonTitle in
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            button.tintColor = .label
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }
    
    private lazy var sectionStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: tabs)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubViews(recipeImage,recipeNameLabel,sectionStack)
        initConstraints()
    }
    
    
    private func initConstraints(){
        NSLayoutConstraint.activate([
            recipeImage.topAnchor.constraint(equalTo: self.topAnchor),
            recipeImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            recipeImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            recipeNameLabel.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: 10),
            recipeNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            recipeNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            
            sectionStack.topAnchor.constraint(equalTo: recipeNameLabel.bottomAnchor, constant: 10),
            sectionStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            sectionStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            sectionStack.heightAnchor.constraint(equalToConstant: 34),
            sectionStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
    }
    
    public func configure(with viewModel: RecipeDetailViewViewModel){
        recipeNameLabel.text = viewModel.title
        viewModel.fetchRecipeImage{ [weak self]result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.recipeImage.image = image
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
