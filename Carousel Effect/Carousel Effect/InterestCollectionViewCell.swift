//
//  InterestCollectionViewCell.swift
//  Carousel Effect
//
//  Created by toaster on 2021/07/03.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    var interest:Interest!{
        didSet{
            updateUI()
        }
    }
    
    @IBOutlet private weak var featuredImageView: UIImageView!
    @IBOutlet private weak var interestTitleLabel: UILabel!
    
    fileprivate func updateUI(){
        interestTitleLabel?.text! = interest.title
        featuredImageView?.image! = interest.featuredImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
    
}
