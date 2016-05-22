//
//  ViewController.swift
//  LifeGame
//
//  Created by 荒川陸 on 2016/05/22.
//  Copyright © 2016年 Riku Arakawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var initField: Field = Field()
    var oldField: Field!
    var newField: Field!
    var timer: NSTimer!
    var cnt = 0.0
    var initialView = gameView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for i in 0..<50 {
            for j in 0..<50 {
                if i % 2 == 0{
                    initField.array[i][j].state = Cell.State.Alive
                } else {
                    initField.array[i][j].state = Cell.State.Dead
                }
            }
        }
        
        initialView.drawField(initField)
        self.view.addSubview(initialView)
        
        oldField = initField
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.onUpdate(_:)), userInfo: nil, repeats: true)
    }
    
    
    
    func onUpdate(timer : NSTimer){
        loop()
    }
    
    func loop(){
        newField = Field(oldField: oldField)
        initialView.drawField(newField)
        oldField = newField
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

