//
//  FighterCell.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 14.04.2021.
//

import UIKit

class FighterCell: UITableViewCell {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



//MARK: - Configurable

extension FighterCell: Configurable {
    
    struct Model {
        let fighters: [MainModel.FightersBlock]
    }
    
    func configure(with model: Model) {
        
    }
}

