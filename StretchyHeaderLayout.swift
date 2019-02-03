//
//  StretchyHeaderLayout.swift
//  StretchyHeaderView
//
//  Created by Apple on 2019/2/2.
//  Copyright © 2019 Chen. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attributes) in
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader && attributes.indexPath.section == 0 {
                
                guard let collectionView = collectionView else {return}
                let contentOffY = collectionView.contentOffset.y
                if contentOffY > 0 {
                    return
                }
                
                let width = collectionView.frame.width
//                print("width is \(width)")
                let height = attributes.frame.height - contentOffY
                
                attributes.frame = CGRect(x: 0, y: contentOffY, width: width, height: height)
            }
        })
        
        return layoutAttributes

    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
