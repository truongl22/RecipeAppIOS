//
//  WorkOutManager.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/11/23.
//

import Foundation
import UIKit

final class WorkOutManager: NSObject, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodayWorkOutTableViewCell.identifier, for: indexPath) as? TodayWorkOutTableViewCell else{
            fatalError("Unsupported Cell")
        }
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView:UIView =  WorkoutHeaderView()
//        return headerView
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                                                                "sectionHeader") as! WorkoutHeaderView
        
        
        return view
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Check if the current row is the last row in the section
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            // Remove the separator insets for the last row
            cell.separatorInset = UIEdgeInsets(top: 0, left: tableView.bounds.size.width, bottom: 0, right: 0)
        } else {
            // Reset the separator insets for other rows
            cell.separatorInset = UIEdgeInsets.zero
        }
    }
    
}
