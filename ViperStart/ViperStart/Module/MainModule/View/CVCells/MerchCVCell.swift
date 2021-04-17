//
//  MerchCVCell.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 14.04.2021.
//

import UIKit

class MerchCVCell: UICollectionViewCell {
    
    @IBOutlet private weak var merchImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
}


//MARK: - Configurable

extension MerchCVCell: Configurable {
    
    struct Model {
        let merch: MainModel.MerchBlock
    }
    
    func configure(with model: Model) {
        
        merchImage.sd_setImage(with: URL(string: model.merch.image), completed: nil)
        nameLabel.text = model.merch.name
        priceLabel.text = model.merch.price
    }
}
