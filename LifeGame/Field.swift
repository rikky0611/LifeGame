//
//  Field.swift
//  LifeGame
//
//  Created by 荒川陸 on 2016/05/22.
//  Copyright © 2016年 Riku Arakawa. All rights reserved.
//

import Foundation

class Field {
    
    static var line = Array(count: 50, repeatedValue: Cell())
    var array = Array(count: 50, repeatedValue: line)
    
    init () {}
    
    init(oldField: Field){
        for i in 0..<50{
            for j in 0..<50{
                array[i][j] = setNewCell(x: i, y: j, oldField: oldField)
            }
        }
    }
    
    //一つ前のセルから新しいセルを作る
    func setNewCell(x x: Int, y: Int, oldField: Field) -> Cell {
        var cell: Cell! = Cell()
        let cnt = oldField.cntAlive(x: x, y: y)
        if oldField.array[x][y].state == Cell.State.Alive {
            if cnt == 2 || cnt == 3 {
                cell.toAlive()
            } else {
                //cell.toDead()
            }
            
        } else {
            if cnt == 3 {
                cell.toAlive()
            } else {
                //cell.toDead()
            }
        }
        return cell
    }
    
    //自分の周りの生きているマスを計算
    func cntAlive(x x:Int,y:Int) -> Int {
        var cnt: Int = 0
        for i in (-1...1){
            for j in (-1...1){
                if inField(x: x+i, y: y+j) {
                    if array[x+i][y+j].state == .Alive{
                        cnt += 1
                    }
                }
            }
        }
        
        if array[x][y].state == .Alive{
            cnt -= 1
        }
        
        return cnt
    }
    
    //フィールド内のマスであるかどうか
    func inField(x x:Int,y:Int) -> Bool {
        return x>=0 && x<=49 && y>=0 && y<=49
    }
    
}
