//
//  View.swift
//  LifeGame
//
//  Created by 荒川陸 on 2016/05/22.
//  Copyright © 2016年 Riku Arakawa. All rights reserved.
//

import Foundation
import UIKit

class gameView: UIView {
    
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    let screenHeight = UIScreen.mainScreen().bounds.size.height
    
    func drawField(field: Field){
        
        let boardSize = CGSizeMake(screenWidth,screenWidth)
        let boardOrigin = CGPointMake(0,20)
        self.frame.origin = boardOrigin
        self.frame.size = boardSize
        
        let btnSize = boardSize.width/50.0
        
        // placing buttons
        for y in 0 ..< 50 {
            for x in 0 ..< 50 {
                let btn = UIButton(frame: CGRectMake(btnSize * CGFloat(x),btnSize * CGFloat(y),btnSize, btnSize))
                btn.layer.borderWidth = 1.0
                btn.layer.borderColor = UIColor.grayColor().CGColor
                if field.array[x][y].state == Cell.State.Alive {
                    btn.backgroundColor = UIColor.greenColor()
                } else {
                    btn.backgroundColor = UIColor.blackColor()
                }
                
                self.addSubview(btn)
                btn.tag = y*50 + x
                btn.addTarget(self, action:Selector("onBtnClick:") , forControlEvents: .TouchUpInside)
            }
        }
        
        // onBtnClicks
        func onBtnClick(btn: UIButton, field:Field){
            let x = btn.tag % 50
            let y = btn.tag / 50
            if field.array[x][y].state == Cell.State.Alive {
                field.array[x][y].state = Cell.State.Dead
                btn.backgroundColor = UIColor.blackColor()
            } else {
                field.array[x][y].state = Cell.State.Alive
                btn.backgroundColor = UIColor.greenColor()
            }
            
        }
        
    }
    
    
    
//    // onBtnClicks
//    func onBtnClick(btn: UIButton){
//        let x = btn.tag % 50
//        let y = btn.tag / 50
//    }
    
}
