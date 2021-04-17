//
//  FighterCVCell.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 14.04.2021.
//

import UIKit

final class FighterCVCell: UICollectionViewCell {
    
    @IBOutlet private weak var fighterImage: UIImageView!
    @IBOutlet private weak var fighterName: UILabel!
    @IBOutlet private weak var recordLabel: UILabel!
    @IBOutlet private weak var countryLabel: UILabel!
    @IBOutlet private weak var topPosition: UILabel!
    @IBOutlet private weak var pageComtrol: UIPageControl!
    
}


//MARK: - Configurable

extension FighterCVCell: Configurable {
    
    struct Model {
        let fighter: MainModel.FightersBlock
    }
    
    func configure(with model: Model) {
        
        fighterImage.sd_setImage(with: URL(string: model.fighter.image), completed: nil)
        fighterName.text = model.fighter.name
        recordLabel.text = model.fighter.record
        countryLabel.text = model.fighter.country
        topPosition.text = model.fighter.ratingPosition
    }
}
