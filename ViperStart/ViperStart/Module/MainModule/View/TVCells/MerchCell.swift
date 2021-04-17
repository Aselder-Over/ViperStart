//
//  MerchCell.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 14.04.2021.
//

import UIKit

class MerchCell: UITableViewCell {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}



//MARK: - Configurable

extension MerchCell: Configurable {
    
    struct Model {
        let merchs: [MainModel.MerchBlock]
    }
    
    func configure(with model: Model) {

    }
}
