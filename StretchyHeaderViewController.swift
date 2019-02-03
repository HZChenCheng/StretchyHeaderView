//
//  StretchyHeaderViewController.swift
//  StretchyHeaderView
//
//  Created by Apple on 2019/2/1.
//  Copyright © 2019 Chen. All rights reserved.
//

import UIKit

private let reuseCellIdentifier = "Cell"
private let reuseHeaderIdentifier = "Header"
private let padding: CGFloat = 16

class StretchyHeaderViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.contentInsetAdjustmentBehavior = .never
        
        setupCollectionViewLayout()
        setupCollectonView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate func setupCollectionViewLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        }
    }
    
    fileprivate func setupCollectonView() {
        collectionView.backgroundColor = UIColor.white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseCellIdentifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseHeaderIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseCellIdentifier, for: indexPath)
        cell.backgroundColor = UIColor.black
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 2*padding, height: 50)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffsetY = scrollView.contentOffset.y
        print("contentOffsetY is \(contentOffsetY)")

        if contentOffsetY > 0 {
            headerView?.animator.fractionComplete = 0
            return
        }
        headerView?.animator.fractionComplete = abs(contentOffsetY)/100
    }
    
    var headerView:HeaderView?
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseHeaderIdentifier, for: indexPath) as? HeaderView
        return headerView!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 340)
    }
    
}
