//
//  MainModel.swift
//  ViperStart
//
//  Created by Асельдер Гаджиев on 14.04.2021.
//

import Foundation

struct MainModel: Codable {
    
    let mainEventBlock: MainEventBlock
    let fightersBlock: [FightersBlock]
    let lastEvent: [LastEvent]
    let merchBlock: [MerchBlock]
    
    struct MainEventBlock: Codable {
        let id: String
        let image: String
        let stream: String
        let title: String
        let date: String
        let time: String
        
        private enum CodingKeys: String, CodingKey {
            case id
            case image
            case stream
            case title
            case date
            case time
        }
        
        init(from decoder: Decoder) throws {
            
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.id = try container.decode(.id)
            self.image = try container.decode(.image)
            self.stream = try container.decode(.stream)
            self.title = try container.decode(.title)
            self.date = try container.decode(.date)
            self.time = try container.decode(.time)
        }
    }
    
    
    struct FightersBlock: Codable {
        
        let id: String
        let image: String
        let name: String
        let record: String
        let country: String
        let ratingPosition: String
        
        private enum CodingKeys: String, CodingKey {
            
            case id
            case image
            case name
            case record
            case country
            case ratingPosition
        }
        
        init(from decoder: Decoder) throws {
            
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.id = try container.decode(.id)
            self.image = try container.decode(.image)
            self.name = try container.decode(.name)
            self.record = try container.decode(.record)
            self.country = try container.decode(.country)
            self.ratingPosition = try container.decode(.ratingPosition)
        }
    }
    
    struct LastEvent: Codable {
        
        let id: String
        let title: String
        let videoId: String
        let images: [String]
        let date: String
        let description: String
        
        private enum CodingKeys: String, CodingKey {
            case id
            case title
            case videoId
            case images
            case date
            case description
        }
        
        init(from decoder: Decoder) throws {
            
            let container = try decoder.container(keyedBy: CodingKeys.self)

            self.id = try container.decode(.id)
            self.title = try container.decode(.title)
            self.videoId = try container.decode(.videoId)
            self.images = try container.decode(.images)
            self.date = try container.decode(.date)
            self.description = try container.decode(.description)
        }
    }
    
    struct MerchBlock: Codable {
        
        let id: String
        let image: String
        let name: String
        let price: String
        let size: String
        
        private enum CodingKeys: String, CodingKey {
            case id
            case image
            case name
            case price
            case size
        }
        
        init(from decoder: Decoder) throws {
            
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.id = try container.decode(.id)
            self.image = try container.decode(.image)
            self.name = try container.decode(.name)
            self.price = try container.decode(.price)
            self.size = try container.decode(.size)
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case mainEventBlock
        case fightersBlock
        case lastEvent
        case merchBlock
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.mainEventBlock = try container.decode(.mainEventBlock)
        self.fightersBlock = container.decodeSafelyArray(of: FightersBlock.self, forKey: .fightersBlock)
        self.lastEvent = container.decodeSafelyArray(of: LastEvent.self, forKey: .lastEvent)
        self.merchBlock = container.decodeSafelyArray(of: MerchBlock.self, forKey: .merchBlock)
    }
}

