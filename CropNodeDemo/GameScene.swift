//
//  GameScene.swift
//  CropNodeDemo
//
//  Created by Stephen Brennan on 8/2/16.
//  Copyright (c) 2016 Stephen Brennan. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var cropper : SKCropNode!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Tap!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
        cropper = SKCropNode()
        cropper.maskNode = SKNode()
        
        let emitter = SKEmitterNode(fileNamed: "Magic")!
        cropper.addChild(emitter)
        self.addChild(cropper)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            if let mn = cropper.maskNode {
                let location = touch.locationInNode(mn)
                
                let sprite = SKSpriteNode(imageNamed:"Spaceship")
                
                sprite.xScale = 0.5
                sprite.yScale = 0.5
                sprite.position = location
                
                let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
                
                sprite.runAction(SKAction.repeatActionForever(action))
                
                mn.addChild(sprite)
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
