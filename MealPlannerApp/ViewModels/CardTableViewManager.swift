//
//  CardTableViewManager.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/5/23.
//

import Foundation
import UIKit

final class CardTableViewManager: NSObject, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodayWorkOutTableViewCell.identifier, for: indexPath) as! TodayWorkOutTableViewCell
        return cell
    }
    
  
    
}
