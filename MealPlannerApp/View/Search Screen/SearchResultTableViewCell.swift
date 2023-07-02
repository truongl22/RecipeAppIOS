//
//  SearchResultTableViewCell.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 6/29/23.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    static let identifier = "SearchResultTableViewCell"
    
    private let wrapperCellSearchResultView: UITableViewCell = {
        let wrapper = UITableViewCell()
        wrapper.backgroundColor = .white
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        return wrapper
    }()
    
    private let labelTitleSearchResult: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(wrapperCellSearchResultView)
        initConstraints()
    }
    
    
    private func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellSearchResultView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellSearchResultView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellSearchResultView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellSearchResultView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            labelTitleSearchResult.topAnchor.constraint(equalTo: wrapperCellSearchResultView.topAnchor, constant: 8),
            labelTitleSearchResult.leadingAnchor.constraint(equalTo: wrapperCellSearchResultView.leadingAnchor, constant: 16),
            labelTitleSearchResult.trailingAnchor.constraint(equalTo: wrapperCellSearchResultView.trailingAnchor, constant:  -16),
            labelTitleSearchResult.heightAnchor.constraint(equalToConstant: 20),
            
            wrapperCellSearchResultView.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
