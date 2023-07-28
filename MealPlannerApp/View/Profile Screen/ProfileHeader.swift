//
//  ProfileHeader.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/18/23.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    static let identifier = "ProfileHeader"

    private let imageProfile: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.circle")
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        label.text = "Tomtruong22"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var tabs: [UIButton] = ["Recipe Posts", "Workout Posts"]
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
        addSubViews(imageProfile,userNameLabel,sectionStack)
        initConstraints()
    }
    
    
    private func initConstraints(){
        NSLayoutConstraint.activate([
            imageProfile.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageProfile.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 20),
//            imageProfile.rightAnchor.constraint(equalTo: self.rightAnchor),
            imageProfile.widthAnchor.constraint(equalToConstant: 100),
            imageProfile.heightAnchor.constraint(equalToConstant: 100),
            
            userNameLabel.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 8),
            userNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 14),
            userNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -14),
            
            sectionStack.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor,constant: 8),
            sectionStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 42),
            sectionStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -42),
            sectionStack.heightAnchor.constraint(equalToConstant: 34),
            sectionStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
    }
    
//    public func configure(with viewModel: RecipeDetailViewViewModel){
//        recipeNameLabel.text = viewModel.title
//        viewModel.fetchRecipeImage{ [weak self]result in
//            switch result {
//            case .success(let data):
//                DispatchQueue.main.async {
//                    let image = UIImage(data: data)
//                    self?.recipeImage.image = image
//                }
//            case .failure(let error):
//                print(String(describing: error))
//            }
//        }
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
