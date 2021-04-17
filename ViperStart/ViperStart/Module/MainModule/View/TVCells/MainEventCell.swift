//
//  MainEventCell.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 14.04.2021.
//

import UIKit

class MainEventCell: UITableViewCell {
    
    private var stramURL = ""

    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var fighterImage: UIImageView!
    
    
}


//MARK: - Configurable

extension MainEventCell: Configurable {
    
    struct Model {
        let mainEvent: MainModel.MainEventBlock
    }
    
    func configure(with model: Model) {
        
        fighterImage.sd_setImage(with: URL(string: model.mainEvent.image), completed: nil)
        eventNameLabel.text = model.mainEvent.title
        eventDateLabel.text = model.mainEvent.date
        timeLabel.text = model.mainEvent.time
        stramURL = model.mainEvent.stream
        
    }
}
