//
//  InstructionTableViewCell.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/12/23.
//

import UIKit

class InstructionTableViewCell: UITableViewCell {
    static let identifier = "InstructionTableViewCell"
    
    private var exerciseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "3 x Leg Extension"
        label.textColor = .black
        return label
    }()
    
    private var bestSetLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "45 lb x 4"
        label.textColor = .black
        return label
    }()
    
    private func initConstraints(){
        
        NSLayoutConstraint.activate([
            exerciseLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            exerciseLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 2),
            bestSetLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            bestSetLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -2),
           
        ])
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews(exerciseLabel, bestSetLabel)
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
