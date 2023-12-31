//
//  TodayWorkOutTableViewCell.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/11/23.
//

import UIKit

class TodayWorkOutTableViewCell: UITableViewCell {
    static let identifier = "TodayWorkOutTableViewCell"
    
    private var checkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "checkmark.square.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.setImage(UIImage(named: "checkmark.square"), for: .selected)
        button.addTarget(self, action: #selector(checkboxButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func checkboxButtonTapped(_ sender: UIButton) {
        print("bbb")
        sender.isSelected = !sender.isSelected
    }
    
    private var exerciseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "3 x Leg Extension"
        label.textColor = UIColor(red: 0.00, green: 0.12, blue: 0.17, alpha: 1.00)
        return label
    }()
    
    private var bestSetLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "45 lb x 4"
        label.textColor = UIColor(red: 0.00, green: 0.12, blue: 0.17, alpha: 1.00)
        return label
    }()
    
    private func initConstraints(){
        
        NSLayoutConstraint.activate([
            checkButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4),
            exerciseLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            exerciseLabel.leftAnchor.constraint(equalTo: checkButton.rightAnchor, constant: 16),
            bestSetLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            bestSetLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
           
        ])
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews(exerciseLabel, bestSetLabel,checkButton)
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }

}
