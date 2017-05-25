//
//  ViewController.swift
//  BreakOut
//
//  Created by student8 on 4/26/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    @IBOutlet weak var ballView: UIView!
    
    @IBOutlet weak var paddleView: UIView!
    
    var dynamicAnimator = UIDynamicAnimator()
    
    var pushBehavior = UIPushBehavior()
    
    var collisionBehavior = UICollisionBehavior()
    
    var ballDynamicBehavior: UIDynamicItemBehavior!
    
    var paddleDynamicBehavior = UIDynamicItemBehavior()
    
    var blockDynamicBehavior = UIDynamicItemBehavior()
    
    var blockView: UIView!
    
    var block1: UIView!
    
    var block2: UIView!
    
    var block3: UIView!
    
    var block4: UIView!
    
    var block5: UIView!
    
    var block6: UIView!
    
    var block7: UIView!
    
    var block8: UIView!
    
    var block9: UIView!
    
    var block10: UIView!
    
    var blockArray:[UIView]!
    
    @IBOutlet weak var startButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ballView.layer.cornerRadius = 12.0

        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        blockDynamicBehavior.density = 1000
        
        setUpViews()
        
        addDynamicAnimations(array: [block1,block2,block3,block4,block5,block6,block7,block8,block9,block10])

    

    }
     
    func setUpViews()
    {
        
       let screenWidth = Float(UIScreen.main.bounds.width)
        
       let blockWidth = (screenWidth - 30)/5
        
        block1 = UIView(frame: CGRect(x: 5, y: 15, width: Int(blockWidth), height: 20))
        block1.backgroundColor = UIColor.blue
        view.addSubview(block1)
        
        block2 = UIView(frame: CGRect(x: Int(5 + 5 + blockWidth), y: 15, width: Int(blockWidth), height: 20))
        block2.backgroundColor = UIColor.blue
        view.addSubview(block2)
        
        block3 = UIView(frame: CGRect(x: Int(5 + 10 + (2 * blockWidth)), y: 15, width: Int(blockWidth), height: 20))
        block3.backgroundColor = UIColor.blue
        view.addSubview(block3)
        
        block4 = UIView(frame: CGRect(x: Int(5 + 15 + (3 * blockWidth)), y: 15, width: Int(blockWidth), height: 20))
        block4.backgroundColor = UIColor.blue
        view.addSubview(block4)
        
        block5 = UIView(frame: CGRect(x: Int(5 + 20 + (4 * blockWidth)), y: 15, width: Int(blockWidth), height: 20))
        block5.backgroundColor = UIColor.blue
        view.addSubview(block5)
        
        block6 = UIView(frame: CGRect(x: 5, y: 40, width: Int(blockWidth), height: 20))
        block6.backgroundColor = UIColor.blue
        view.addSubview(block6)
        
        block7 = UIView(frame: CGRect(x: Int(5 + 5 + blockWidth), y: 40, width: Int(blockWidth), height: 20))
        block7.backgroundColor = UIColor.blue
        view.addSubview(block7)
        
        block8 = UIView(frame: CGRect(x: Int(5 + 10 + (2 * blockWidth)), y: 40, width: Int(blockWidth), height: 20))
        block8.backgroundColor = UIColor.blue
        view.addSubview(block8)
        
        block9 = UIView(frame: CGRect(x: Int(5 + 15 + (3 * blockWidth)), y: 40, width: Int(blockWidth), height: 20))
        block9.backgroundColor = UIColor.blue
        view.addSubview(block9)
        
        block10 = UIView(frame: CGRect(x: Int(5 + 20 + (4 * blockWidth)), y: 40, width: Int(blockWidth), height: 20))
        block10.backgroundColor = UIColor.blue
        view.addSubview(block10)
        
        blockArray = [block1, block2, block3, block4, block5, block6, block7, block8, block9, block10]
        
    }
    
    func addDynamicAnimations(array: [UIView])
        
    {
        
         ballDynamicBehavior = UIDynamicItemBehavior(items: [ballView])
        
        ballDynamicBehavior.resistance = 0.0
        ballDynamicBehavior.friction = 0.0
        ballDynamicBehavior.elasticity = 1.0
        ballDynamicBehavior.allowsRotation = false
        
        dynamicAnimator.addBehavior(ballDynamicBehavior)
        
        
         collisionBehavior = UICollisionBehavior(items: [paddleView, ballView, block1, block2, block3,block4,block5,block6,block7,block8,block9,block10])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionMode = .everything
        collisionBehavior.collisionDelegate = self
        dynamicAnimator.addBehavior(collisionBehavior)
        
          paddleDynamicBehavior = UIDynamicItemBehavior(items: [paddleView])
        
        paddleDynamicBehavior.density = 10000
        paddleDynamicBehavior.allowsRotation = false
        paddleDynamicBehavior.friction = 0
        paddleDynamicBehavior.elasticity = 1.0
        dynamicAnimator.addBehavior(paddleDynamicBehavior)
        
         blockDynamicBehavior = UIDynamicItemBehavior(items: [block1,block2,block3,block4,block5,block6,block7,block8,block9,block10])
        
        blockDynamicBehavior.density = 10000
        blockDynamicBehavior.elasticity = 1.0
        dynamicAnimator.addBehavior(blockDynamicBehavior)
        

    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        let pushBehavior =  UIPushBehavior(items: [ballView], mode: .instantaneous)
        pushBehavior.pushDirection = CGVector(dx: 0.5, dy: 0.5)
        dynamicAnimator.addBehavior(pushBehavior)
        sender.isEnabled = false
        startButton.isHidden = true
        
        
        pushBehavior.magnitude = 0.2
    }
    
    
    @IBAction func paddleMove(_ sender: UIPanGestureRecognizer) {
        
        paddleView.center = CGPoint(x: sender.location(in: self.view).x, y: paddleView.center.y)
        
        dynamicAnimator.updateItem(usingCurrentState: paddleView)
    
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        for block in blockArray
        {
            if (item1.isEqual(block) && item2.isEqual(ballView)) || (item2.isEqual(block) && item1.isEqual(ballView))
            {
                self.collisionBehavior.removeItem(block)
                block.removeFromSuperview()
                print(block.center)
                
               
            }
            dynamicAnimator.updateItem(usingCurrentState: block)
        }
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        print("A ball colided with a boundry at \(p)")
        
        if item.isEqual(ballView)
        {
            if p.y > paddleView.center.y
                
            {
                
                dynamicAnimator.removeAllBehaviors()
                gameOverAlert()
                
            }
 
        }
        
    }

    func gameOverAlert()
    {
        
        let alert = UIAlertController(title: "You Lose", message: "Play Again", preferredStyle: UIAlertControllerStyle.actionSheet)

        let okButton = UIAlertAction(title: "OK", style: .default) { (action) in
            
            // Do nothing
            
        }
        
        alert.addAction(okButton)
        
        let resetButton = UIAlertAction(title: "Reset", style: .default) { (action) in
            
             self.reset()
            
        }
        
        alert.addAction(resetButton)

        self.present(alert, animated: true, completion: nil)

    
    
    }
    
    func reset()
    {
        print("In Reset")
        
        setUpViews()
        
        startButton.isHidden = false
        
        startButton.isEnabled = true
    }

  
    
       
    }



