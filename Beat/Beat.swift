//
//  Beat.swift
//  Beat
//
//  Created by Sebastian Aguirre on 8/23/18.
//  Copyright © 2018 SeaCap. All rights reserved.
//

import Foundation

open class Beat {
    
    public var action : ()->() = {}
    
    public var numberOfActions : Int
    
    let queue : DispatchQueue
    
    let startDate : Date
    
    let delay : TimeInterval
    
    private var _on = false
    
    public var on:Bool{
        set{
            if !_on && newValue{
                _on = newValue
                runningAction()
            }
            _on = newValue
        }
        get{
            return _on
        }
    }
    
    required public init(queue: DispatchQueue = DispatchQueue.main,
                         delay: Double = 0.5,
                         startDate: Date = Date(),
                         numberOfActions: Int = -1,
                         action: @escaping ()->() = {}) {
        self.queue = queue
        self.delay = delay
        self.startDate = startDate
        self.numberOfActions = numberOfActions
        self.action = action
    }
    
    func runningAction() {
        
        if numberOfActions != 0 && on{
            self.action()
            let popTime = DispatchTime.now() + Double(delay)
            
            numberOfActions -= 1
            
            queue.asyncAfter(deadline: popTime,
                             execute:
                {
                    self.runningAction()
            })
            
        }
    }
}

