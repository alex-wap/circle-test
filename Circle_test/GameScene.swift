//
//  GameScene.swift
//  Circle_test
//
//  Created by Jennifer Zeller on 9/9/16.
//  Copyright (c) 2016 Alex. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
    
    let manager = CMMotionManager()
    var crosshair = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        scene?.backgroundColor = SKColor.blackColor()

        let OuterRing = SKShapeNode(circleOfRadius: 100 ) // Size of Circle
        OuterRing.position = CGPointMake(frame.midX, frame.midY)  //Middle of Screen
        OuterRing.zPosition = -1.0
        OuterRing.strokeColor = SKColor.blackColor()
        OuterRing.glowWidth = 1.0
        OuterRing.fillColor = SKColor.whiteColor()
        self.addChild(OuterRing)
        
        let OuterRing2 = SKShapeNode(circleOfRadius: 80 ) // Size of Circle
        OuterRing2.position = CGPointMake(frame.midX, frame.midY)  //Middle of Screen
        OuterRing2.zPosition = -1.0
        OuterRing2.strokeColor = SKColor.whiteColor()
        OuterRing2.glowWidth = 1.0
        OuterRing2.fillColor = SKColor.blackColor()
        self.addChild(OuterRing2)
        
        let MiddleRing = SKShapeNode(circleOfRadius: 60 ) // Size of Circle
        MiddleRing.position = CGPointMake(frame.midX, frame.midY)  //Middle of Screen
        MiddleRing.zPosition = -1.0
        MiddleRing.strokeColor = SKColor.blackColor()
        MiddleRing.glowWidth = 1.0
        MiddleRing.fillColor = SKColor.blueColor()
        self.addChild(MiddleRing)
        
        let InnerRing = SKShapeNode(circleOfRadius: 40 ) // Size of Circle
        InnerRing.position = CGPointMake(frame.midX, frame.midY)  //Middle of Screen
        InnerRing.zPosition = -1.0
        InnerRing.strokeColor = SKColor.blackColor()
        InnerRing.glowWidth = 1.0
        InnerRing.fillColor = SKColor.redColor()
        self.addChild(InnerRing)
        
        let BullsEye = SKShapeNode(circleOfRadius: 20 ) // Size of Circle
        BullsEye.position = CGPointMake(frame.midX, frame.midY)  //Middle of Screen
        BullsEye.zPosition = -1.0
        BullsEye.strokeColor = SKColor.blackColor()
        BullsEye.glowWidth = 1.0
        BullsEye.fillColor = SKColor.yellowColor()
        self.addChild(BullsEye)
        
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval=0.1
        manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()){
            (data,error) in
            
            self.physicsWorld.gravity = CGVectorMake(CGFloat((data?.acceleration.x)!*5),CGFloat((data?.acceleration.y)!*5))
        }
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)

        crosshair = SKSpriteNode(imageNamed: "crosshairs.png")
        crosshair.position = CGPointMake(frame.midX-500, frame.midY-500)
        crosshair.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        crosshair.physicsBody!.affectedByGravity = true
        
        

//        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
//        myLabel.text = "Hello, World!"
//        myLabel.fontSize = 45
//        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
//        
//        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
    
        for touch in touches {
            let location = touch.locationInNode(self)
            let shape = SKShapeNode(circleOfRadius: 50)
            shape.strokeColor = SKColor.blackColor()
            shape.fillColor = SKColor.greenColor()
            shape.xScale = 0.5
            shape.yScale = 0.5
            shape.position = location
           
         let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
       
          shape.runAction(SKAction.repeatActionForever(action))
           runAction(SKAction.playSoundFileNamed("174436__drminky__laser-gun-ice-beam.caf", waitForCompletion: false))
            self.addChild(shape)
           
        }
    }
    
//    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        runAction(SKAction.playSoundFileNamed("215438__taira-komori__shoot02.caf", waitForCompletion: false))
//    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
