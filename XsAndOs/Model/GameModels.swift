//
//  GameModels.swift
//  XsAndOs
//
//  Created by Farid Bastoros on 2024-05-25.
//

import Foundation

enum GameType {
    case single, bot, peer, undetermined
    
    var description : String {
        switch self {
        case .single:
            return "Share your iphone/ipad and play against a friend. "
        case .bot:
            return "Play against this iphone/ipad. "
        case .peer:
            return "Invire someone near you who has this app running to play. "
        case .undetermined:
            return ""
        }
    }
}
