//
//  GameInfo.swift
//  ARShooting
//
//  Created by 後閑諒一 on 2020/05/31.
//  Copyright © 2020 nargok. All rights reserved.
//

import SwiftUI

enum GameState {
    
    case menu
    
    case placingContent
    
    case stage1
        
    case stage2
    
    case endGame
    
}

final class GameInfo: ObservableObject {
    @Published var gameState: GameState = .menu
}
