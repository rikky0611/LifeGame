//
//  Cell.swift
//  LifeGame
//
//  Created by 荒川陸 on 2016/05/22.
//  Copyright © 2016年 Riku Arakawa. All rights reserved.
//

import Foundation

struct Cell {
    
    enum State {
        case Alive
        case Dead
    }
    init(){
        self.state = .Dead
    }
    
    var state: State = .Dead
    
    mutating func toDead(){
        self.state = .Dead
    }
    
    mutating func toAlive(){
        self.state = .Alive
    }
}
