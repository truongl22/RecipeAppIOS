//
//  BuildPlanCollectionViewManager.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 7/28/23.
//

import Foundation
import UIKit

extension BuildPlanViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let type = sections[section]
        switch type{
        case .fromYourRecipe(let viewModels):
            return 4
        case .cuisine(let viewModels):
            return viewModels.count
        case .breakfast(let viewModels):
            return viewModels.count
        case .maincourse(let viewModels):
            return viewModels.count
        case .dessert(let viewModels):
            return viewModels.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = sections[indexPath.section]
        switch type{
        case .fromYourRecipe(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FromYourRecipeCollectionViewCell.identifier, for: indexPath) as? FromYourRecipeCollectionViewCell else{
                fatalError("Unsupported Cell")
            }
            //            let model = viewModels[indexPath.row]
            cell.configure(with: "Breakfast")
            return cell
        case .cuisine(let viewModels):
            return showCellForEachMealTypes(collectionView: collectionView, cellForItemAt: indexPath, viewModels: viewModels)
        case .breakfast(let viewModels):
            return showCellForEachMealTypes(collectionView: collectionView, cellForItemAt: indexPath, viewModels: viewModels)
        case .maincourse(let viewModels):
            return showCellForEachMealTypes(collectionView: collectionView, cellForItemAt: indexPath, viewModels: viewModels)
        case .dessert(let viewModels):
            return showCellForEachMealTypes(collectionView: collectionView, cellForItemAt: indexPath, viewModels: viewModels)
        }
    }
    
    private func showCellForEachMealTypes(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, viewModels: [BuildPlanViewViewModel])  -> UICollectionViewCell{
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CuisineCollectionViewCell.identifier, for: indexPath) as? CuisineCollectionViewCell else{
            fatalError("Unsupported Cell")
        }
        let model = viewModels[indexPath.row]
        cell.configure(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let type = sections[indexPath.section]
        switch type{
        case .fromYourRecipe(let viewModels):
            break
        case .cuisine(viewModels: let viewModels):
            showInstructionsForEachMealTypes(collectionView: collectionView, cellForItemAt: indexPath, viewModels: viewModels)
        case .breakfast(let viewModels):
            showInstructionsForEachMealTypes(collectionView: collectionView, cellForItemAt: indexPath, viewModels: viewModels)
        case .maincourse(let viewModels):
            showInstructionsForEachMealTypes(collectionView: collectionView, cellForItemAt: indexPath, viewModels: viewModels)
        case .dessert(let viewModels):
            showInstructionsForEachMealTypes(collectionView: collectionView, cellForItemAt: indexPath, viewModels: viewModels)
        }
    }
    
    private func showInstructionsForEachMealTypes(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, viewModels: [BuildPlanViewViewModel]){
        collectionView.deselectItem(at: indexPath, animated: true)
        let recipeViewModel = viewModels[indexPath.row]
        let detailRecipeViewController = DetailRecipeViewController(viewModel: recipeViewModel)
        detailRecipeViewController.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailRecipeViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: HeaderCollectionReusableView.identifier,
            for: indexPath
        ) as? HeaderCollectionReusableView, kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        let section = indexPath.section
        let title = sections[section].title
        header.configure(with: title)
        return header
    }
    
    internal static func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection{
        let supplementaryViews = [
            NSCollectionLayoutBoundarySupplementaryItem( layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(50)),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)]
        
        switch sectionIndex {
        case 0:
            let item = NSCollectionLayoutItem( layoutSize: NSCollectionLayoutSize( widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 16, trailing: 8)
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(120)),
                subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = supplementaryViews
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
            return section
        case 1,2,3,4:
            return createLayoutRecipeForEachMealType(supplementaryViews: supplementaryViews)
        default:
            return createLayoutRecipeForEachMealType(supplementaryViews: supplementaryViews)
        }
    }
    
    private static func createLayoutRecipeForEachMealType(supplementaryViews: [NSCollectionLayoutBoundarySupplementaryItem]) -> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem( layoutSize: NSCollectionLayoutSize( widthDimension: .fractionalWidth(1.0),
                                                                               heightDimension: .fractionalHeight(1.0)))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.45),
                heightDimension: .absolute(220)),
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0)
        section.boundarySupplementaryItems = supplementaryViews
        return section
    }
}


