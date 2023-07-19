//
//  CardTableViewManager.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/5/23.
//

//import Foundation
//import UIKit
//
//final class CardCollectionViewManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 3
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath.item == 0{
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayWorkOutCollectionViewCell.identifier, for: indexPath) as? TodayWorkOutCollectionViewCell else{
//                fatalError("Unsupported Cell")
//            }
//            return cell
//        }
//        
//        if indexPath.item == 1{
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MealPlannerCollectionViewCell.identifier, for: indexPath) as? MealPlannerCollectionViewCell else{
//                fatalError("Unsupported Cell")
//            }
//            return cell
//        }
//        
//        else{
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroceryCollectionViewCell.identifier, for: indexPath) as? GroceryCollectionViewCell else{
//                fatalError("Unsupported Cell")
//            }
//            return cell
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let bounds = UIScreen.main.bounds
//        let width = (bounds.width - 22)
//        return CGSize(
//            width: width,
//            height: width * 1.006
//        )
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
//        delegate?.selectedRecipe()
//    }
    
    
    
    
    
//}
