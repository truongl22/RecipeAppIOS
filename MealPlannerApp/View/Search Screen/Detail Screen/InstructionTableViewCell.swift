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
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private var stepNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews(instructionLabel,stepNumberLabel)
        initConstraints()
    }
    
    private func initConstraints(){
        
        NSLayoutConstraint.activate([
            stepNumberLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4),
            stepNumberLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            instructionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            instructionLabel.leftAnchor.constraint(equalTo: stepNumberLabel.rightAnchor, constant: 10),
            instructionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -4),
            instructionLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -4)
        ])
//
//        instructionLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        
    }
    
    public func configure(with viewModel: StepArray){
        print(viewModel)
        instructionLabel.text = viewModel.step
        stepNumberLabel.text = String(viewModel.number)
   
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

}
