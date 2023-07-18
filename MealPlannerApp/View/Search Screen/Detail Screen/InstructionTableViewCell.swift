//
//  InstructionTableViewCell.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/12/23.
//

import UIKit

class InstructionTableViewCell: UITableViewCell {
    static let identifier = "InstructionTableViewCell"
    
    private var instructionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "3 x Leg Extension"
        label.textColor = .black
        return label
    }()
    
    private func initConstraints(){
        
        NSLayoutConstraint.activate([
            instructionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            instructionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 2),
        ])
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews(instructionLabel)
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
//    public func configure(with viewModel: RecipeDetailViewViewModel){
//        viewModel.fetchRecipeImage{ [weak self]result in
//            switch result {
//            case .success(let data):
//                DispatchQueue.main.async {
//                    let image = UIImage(data: data)
//                    print(image)
//                    self?.recipeImageResult.image = image
//                }
//            case .failure(let error):
//                print(String(describing: error))
//            }
//
//        }
//    }

}
