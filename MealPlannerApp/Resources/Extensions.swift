//
//  Extensions.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/4/23.
//

import Foundation
import UIKit

extension UIView{
    func addSubViews(_ views: UIView...){
        for i in views{
            addSubview(i)
        }
    }
    
    func pin(to supperView: UIView){
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: supperView.topAnchor),
            bottomAnchor.constraint(equalTo: supperView.bottomAnchor),
            leftAnchor.constraint(equalTo: supperView.leftAnchor),
            rightAnchor.constraint(equalTo: supperView.rightAnchor)
        ])
    }
}
