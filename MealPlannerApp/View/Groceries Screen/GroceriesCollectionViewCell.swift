//
//  GroceriesView.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/23/23.
//

import UIKit

protocol ChangeCheckButtonGroceryDelegate: AnyObject{
    func changeButton(checked: Bool, indexPath: Int)
}

class GroceriesCollectionViewCell: UICollectionViewListCell {
    static let identifier = "GroceriesCollectionViewCell"
    private var groceryyy: GroceriesViewViewModel!
    private var indexPath: Int?
    
    public weak var delegate: ChangeCheckButtonGroceryDelegate?
    
    
    private let groceryItem: UILabel = {
        let name = UILabel()
        name.textColor = .label
        name.font = .systemFont(ofSize: 16, weight: .medium)
        name.backgroundColor = .secondarySystemBackground
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let quantityItem: UILabel = {
        let name = UILabel()
        name.textColor = .label
        name.font = .systemFont(ofSize: 16, weight: .medium)
        name.backgroundColor = .secondarySystemBackground
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private var checkButton: UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(systemName: "checkmark.square")?.withRenderingMode(.alwaysOriginal), for: .normal)
//        button.setImage(UIImage(named: "checkmark.square"), for: .selected)
        button.addTarget(self, action: #selector(checkboxButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func checkboxButtonTapped(_ sender: UIButton) {
        if !groceryyy.hasCheck{
            delegate?.changeButton(checked: true, indexPath: indexPath!)
        }
        else{
            delegate?.changeButton(checked: false, indexPath: indexPath!)
        }
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubViews(checkButton,groceryItem,quantityItem)
        initConstraints()
    }
    
    public func configure(with viewModel: GroceriesViewViewModel, indexPath: Int){
        groceryItem.text = viewModel.item
        quantityItem.text = viewModel.quantity
        if !viewModel.hasCheck{
            checkButton.setImage(UIImage(systemName: "checkmark.square")?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        else{
            checkButton.setImage(UIImage(systemName: "checkmark.square.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        
        self.indexPath = indexPath
        self.groceryyy = viewModel
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        groceryItem.text = nil
        quantityItem.text = nil
    }
    
    
    private func initConstraints(){
        //        recipeImageResult.pin(to: contentView)
        
        NSLayoutConstraint.activate([
            checkButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            checkButton.widthAnchor.constraint(equalToConstant: 54),
            checkButton.heightAnchor.constraint(equalToConstant: 54),
            
            groceryItem.centerYAnchor.constraint(equalTo: centerYAnchor),
            groceryItem.leftAnchor.constraint(equalTo: checkButton.rightAnchor, constant: 16),
            
            quantityItem.centerYAnchor.constraint(equalTo: centerYAnchor),
            quantityItem.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
