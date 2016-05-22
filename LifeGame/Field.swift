//
//  Field.swift
//  LifeGame
//
//  Created by 荒川陸 on 2016/05/22.
//  Copyright © 2016年 Riku Arakawa. All rights reserved.
//

import Foundation

class Field {
    
    enum State {
        case Alive
        case Dead
    }
    static var line = [State](count: 50, repeatedValue: .Dead)
    var array = [[State]](count: 50, repeatedValue: line)
    
    init(newArray:[[State]]){
        self.array = newArray
    }
    
}
