//
//  HomeView.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 6/29/23.
//

import UIKit

class TodayView: UIView {
    private let cardTableViewManager = CardTableViewManager()

//    private var cardsTableView: UITableView = {
//        let tableView = UITableView(frame: .zero, style: .plain)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
////        tableView.separatorStyle = .none
//        tableView.register(TodayWorkOutTableViewCell.self, forCellReuseIdentifier: TodayWorkOutTableViewCell.identifier)
//        return tableView
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemBackground
//        self.addSubViews(cardsTableView)
//        setUpCardCollectionView()

        initConstraints()
   
    }
//    
    private func initConstraints(){
        NSLayoutConstraint.activate([
//            cardsTableView.topAnchor.constraint(equalTo: topAnchor),
//            cardsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            cardsTableView.leftAnchor.constraint(equalTo: leftAnchor),
//            cardsTableView.rightAnchor.constraint(equalTo: rightAnchor),
        ])
    }
//    
//    private func setUpCardCollectionView(){
//        cardsTableView.dataSource = cardTableViewManager
//        cardsTableView.delegate = cardTableViewManager
//    }
//    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
