//
//  ViewController.swift
//  BreakOut
//
//  Created by student8 on 4/26/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ballView: UIView!
    
    @IBOutlet weak var paddleView: UIView!
    
    var dynamicAnimator = UIDynamicAnimator()
    
    var pushBehavior = UIPushBehavior()
    
    var collisionBehavior = UICollisionBehavior()
    
    var ballDynamicBehavior: UIDynamicItemBehavior!
    
    var paddleDynamicBehavior = UIDynamicItemBehavior()
    
    var blockView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
    }
     
  

}

