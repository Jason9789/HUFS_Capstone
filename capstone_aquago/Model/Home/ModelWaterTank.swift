//
//  ModelWaterTank.swift
//  capstone_aquago
//
//  Created by 전판근 on 2021/05/16.
//

import Foundation

struct ModelWaterTank: Codable {
    var tank: String!
    var fish: String!
    
//    init(titleWaterTank: String, titleFish: String) {
//        self.titleWaterTank = titleWaterTank
//        self.titleFish = titleFish
//    }
}

extension ModelWaterTank: Hashable {
    
    static func == (lhs: ModelWaterTank, rhh: ModelWaterTank) -> Bool {
        return lhs.tank == rhh.tank && lhs.fish == rhh.fish
    }
}
