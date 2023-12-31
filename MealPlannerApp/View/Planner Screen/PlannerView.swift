//
//  HomeView.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 6/29/23.
//

import UIKit


/// Try to put delegate and datasource to viewcontroller instead of view model
///
//class PlannerView: UIView {
//    private let cardCollectionViewManager = CardCollectionViewManager()
//
//    private var cardsCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .secondarySystemBackground
//        collectionView.register(TodayWorkOutCollectionViewCell.self, forCellWithReuseIdentifier: TodayWorkOutCollectionViewCell.identifier)
//        collectionView.register(MealPlannerCollectionViewCell.self, forCellWithReuseIdentifier: MealPlannerCollectionViewCell.identifier)
//        collectionView.register(GroceryCollectionViewCell.self, forCellWithReuseIdentifier: GroceryCollectionViewCell.identifier)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        return collectionView
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        translatesAutoresizingMaskIntoConstraints = false
//        self.backgroundColor = .secondarySystemBackground
//        self.addSubViews(cardsCollectionView)
//        setUpCardCollectionView()
//        initConstraints()
//
//    }
//
//    private func initConstraints(){
//        cardsCollectionView.pin(to: self)
//    }
//
//    private func setUpCardCollectionView(){
//        cardsCollectionView.dataSource = cardCollectionViewManager
//        cardsCollectionView.delegate = cardCollectionViewManager
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}

protocol PlannerViewProtocol: AnyObject{
    func pushScreenWorkOutOrGroceries(view: PlannerView, modelType: String)
}

class PlannerView: UIView {
    
    private let workoutAndGroceriesTableViewManager = WorkoutAndGroceriesTableViewManager<Any>()
    
    public weak var delegate: PlannerViewProtocol?

    var cardsCollectionView: UICollectionView?
    
    private func createCardsCollectionView() -> UICollectionView{
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.register(TodayWorkOutCollectionViewCell.self, forCellWithReuseIdentifier: TodayWorkOutCollectionViewCell.identifier)
        collectionView.register(MealPlannerCollectionViewCell.self, forCellWithReuseIdentifier: MealPlannerCollectionViewCell.identifier)
        collectionView.register(GroceryCollectionViewCell.self, forCellWithReuseIdentifier: GroceryCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .secondarySystemBackground
        let cardsCollectionView = createCardsCollectionView()
        self.cardsCollectionView = cardsCollectionView
        self.addSubViews(cardsCollectionView)
        workoutAndGroceriesTableViewManager.delegate = self

        initConstraints()
   
    }
    
    private func initConstraints(){
        guard let cardsCollectionView = cardsCollectionView else{
            return
        }
        NSLayoutConstraint.activate([
            cardsCollectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            cardsCollectionView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            cardsCollectionView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            cardsCollectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension PlannerView: WorkoutAndGroceriesTableViewManagerProtocol{
    func selected(modelType: String) {
        print("ttttt")
        delegate?.pushScreenWorkOutOrGroceries(view: self, modelType: modelType)
    }
}
