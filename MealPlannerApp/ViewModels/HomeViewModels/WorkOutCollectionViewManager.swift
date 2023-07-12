//
//  WorkOutTableViewManager.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/5/23.
//

import Foundation
import UIKit

//final class WorkOutTableViewManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
//
//    var tableData: [[String]] = [
//        ["A1", "B1", "C1", "D1"],
//        ["A2", "B2", "C2", "D2"],
//        ["A3", "B3", "C3", "D3"],
//        ["A3", "B3", "C3", "D3"],
//        ["A3", "B3", "C3", "D3"],
//        ["A3", "B3", "C3", "D3"],
//        ["A3", "B3", "C3", "D3"],
//        ["A3", "B3", "C3", "D3"]
//        // ... Add more rows and columns as needed
//    ]
//
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return tableData.count * tableData[0].count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WorkOutScheduleCollectionViewCell.identifier, for: indexPath) as? WorkOutScheduleCollectionViewCell else{
//            fatalError("Unsupported Cell")
//        }
//        let row = indexPath.item / tableData[0].count
//        let col = indexPath.item % tableData[0].count
//
//        // Set the data for the cell
//        cell.titleLabel.text = tableData[row][col]
//
//        return cell
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        // Calculate the row and column indices based on the indexPath
//        let row = indexPath.item / tableData[0].count
//        let col = indexPath.item % tableData[0].count
//
//        // Check if the cell is "A1", "A2", or "A3" and set a smaller size
//        if row == 0 && col == 0 || row == 1 && col == 0 || row == 2 && col == 0 || row == 3 && col == 0 || row == 4 && col == 0
//            || row == 5 && col == 0 || row == 6 && col == 0 || row == 7 && col == 0 || row == 8 && col == 0{
//            return CGSize(width: 40, height: 40) // Set the smaller size for "A1", "A2", "A3" cells
//        }
//        if row == 0 && col == 1 || row == 1 && col == 1 || row == 2 && col == 1 || row == 3 && col == 1 || row == 4 && col == 1
//            || row == 5 && col == 1 || row == 6 && col == 1 || row == 7 && col == 1 || row == 8 && col == 1{
//            return CGSize(width: 175, height: 40) // Set the smaller size for "A1", "A2", "A3" cells
//        }
//        if row == 0 && col == 3 || row == 1 && col == 3 || row == 2 && col == 3 || row == 3 && col == 3 || row == 4 && col == 3
//            || row == 5 && col == 3 || row == 6 && col == 3 || row == 7 && col == 3 || row == 8 && col == 3{
//            return CGSize(width: 60, height: 40) // Set the smaller size for "A1", "A2", "A3" cells
//        }
//
//        return CGSize(width: 80, height: 40) // Set the regular size for other cells
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        // Adjust the section insets to provide proper spacing for the smaller cells
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        // Adjust the minimum interitem spacing to provide proper spacing for the smaller cells
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        // Adjust the minimum line spacing to provide proper spacing for the smaller cells
//        return 0
//    }
//
//
//
    
    
    //    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //        return 1
    //    }
    //
    //    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WorkOutScheduleCollectionViewCell.identifier, for: indexPath) as? WorkOutScheduleCollectionViewCell else{
    //            fatalError("Unsupported Cell")
    //        }
    //
    //        return cell
    //    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        let bounds = UIScreen.main.bounds
    //        let width = (bounds.width - 80)
    //        return CGSize(
    //            width: width,
    //            height: width
    //            //            width: 100,
    //            //            height: width * 1.25
    //        )
    //    }
    
    
    
//}
