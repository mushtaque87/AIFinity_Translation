//
//  MenuVC_DataModel.swift
//  Pronounciation
//
//  Created by Mushtaque Ahmed on 12/11/17.
//  Copyright © 2017 Mushtaque Ahmed. All rights reserved.
//

import UIKit

private let reuseIdentifier = "menucell"

class MenuVC_DataModel: NSObject, UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var lessonList : Array<String>!
    var viewController : UIViewController!
    override init() {
    lessonList = ["Alphabet", "Number", "Places", "Nouns", "Adverbs", "Adjective" ,  "hello world"]
    
    }
    
     // MARK: UICollectionViewDataSource
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return lessonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier , for: indexPath) as! Menu_Cell
        cell.lessonTitle.text = lessonList[indexPath.row]
        // Configure the cell
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
     func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        let lesson : String  = lessonList[indexPath.row]
        switch lesson {
        case "Own Text":
            let transDetailViewController: TransDetailViewController = TransDetailViewController(nibName: "TransDetailViewController", bundle: nil)
            viewController.present(transDetailViewController, animated: true, completion: nil)
            transDetailViewController.fillDescriptionView(word: lessonList[indexPath.row] as String)
            break
        default:
            let transDetailViewController: TransDetailViewController = TransDetailViewController(nibName: "TransDetailViewController", bundle: nil)
            viewController.present(transDetailViewController, animated: true, completion: nil)
            transDetailViewController.fillDescriptionView(word: lessonList[indexPath.row] as String)
        }
        return true
    }
    
    
    
    
     // MARK: UICollectionViewDelegateFlowLayout
    fileprivate let sectionInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
    fileprivate let itemsPerRow: CGFloat = 3
    
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
}
