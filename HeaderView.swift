//
//  HeaderView.swift
//  StretchyHeaderView
//
//  Created by Apple on 2019/2/1.
//  Copyright © 2019 Chen. All rights reserved.
//

import UIKit
import SnapKit

class HeaderView: UICollectionReusableView {
    
    var imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "car"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.red
        
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        setupVisualEffectView()
    }
    
    var animator:UIViewPropertyAnimator!
    
    fileprivate func setupVisualEffectView() {
        
            animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear) { [weak self] in
            
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffctView = UIVisualEffectView(effect: blurEffect)
            self?.addSubview(visualEffctView)
            visualEffctView.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        }
        
//        animator.startAnimation()
//        animator.fractionComplete = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
