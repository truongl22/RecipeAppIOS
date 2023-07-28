//
//  WorkoutAndGroceriesTableViewManager.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/20/23.
//

import Foundation
import UIKit

protocol WorkoutAndGroceriesTableViewManagerProtocol: AnyObject{
    func selected(modelType: String)
}

class WorkoutAndGroceriesTableViewManager<ViewModel>: NSObject, UITableViewDataSource, UITableViewDelegate {
    public weak var delegate: WorkoutAndGroceriesTableViewManagerProtocol?
    
    var viewModels: [ViewModel] = []

//    init(viewModels: [ViewModel]) {
//        self.viewModels = viewModels
//    }
    
    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WorkoutAndGroceriesTableViewCell<ViewModel>.self), for: indexPath) as! WorkoutAndGroceriesTableViewCell<ViewModel>
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("t;t;t;t")
        delegate?.selected(modelType: String(describing: WorkoutAndGroceriesTableViewCell<ViewModel>.self))
        
        // Implement any action you want to perform when a cell is selected
        // For example:
        // let selectedViewModel = viewModels[indexPath.row]
        // handleSelection(for: selectedViewModel)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! WorkoutHeaderView
        tableView.sectionHeaderHeight = 26
 
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
