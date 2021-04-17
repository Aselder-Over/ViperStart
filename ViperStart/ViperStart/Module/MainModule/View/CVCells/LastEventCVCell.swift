//
//  LastEventCVCell.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 14.04.2021.
//

import UIKit

class LastEventCVCell: UICollectionViewCell {
    
    @IBOutlet private weak var lastEventImage: UIImageView!
    @IBOutlet private weak var nameEventLabel: UILabel!
    @IBOutlet private weak var eventDateLabel: UILabel!
    @IBOutlet private weak var pageControl: UIPageControl!
    
}


//MARK: - Configurable

extension LastEventCVCell: Configurable {
    
    struct Model {
        let lastEvent: MainModel.LastEvent
    }
    
    func configure(with model: Model) {
        
        lastEventImage.sd_setImage(with: URL(string: model.lastEvent.images[0]), completed: nil)
        nameEventLabel.text = model.lastEvent.title
        eventDateLabel.text = model.lastEvent.date
    }
}
