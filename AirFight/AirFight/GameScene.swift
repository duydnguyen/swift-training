//
//  GameScene.swift
//  AirFight
//
//  Created by Tran Duc Hieu on 7/19/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    /* Dieu kien de contact:
        B1: them SKPhysicsContactDelegate vao class Gamescene
        B2: them dong physicsWorld.contactDelegate = self vao didMoveToView
        B3: Dinh nghia Ban Than
            bullet.physicsBody?.categoryBitMask = 1
            bullet.physicsBody?.contactTestBitMask = 2    
        va
            monster.physicsBody?.categoryBitMask = 2
            monster.physicsBody?.contactTestBitMask = 1
        B4: khi contact lam viec gi
            func didBeginContact(...){
                lam gi khi va cham
            }
    */
    
    var shipNode:SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        
        self.view?.showsPhysics = true
        physicsWorld.contactDelegate = self
        
//      set background
//      self.backgroundColor = UIColor.blueColor()
        
        var backgroundNode:SKSpriteNode = SKSpriteNode(imageNamed: "spacebattle.jpg")
        
        backgroundNode.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        backgroundNode.size = CGSize(width: self.size.width, height: self.size.height)
        addChild(backgroundNode)
            
        //Buoc 1- Tao may bay
        
        CreateShip()
        
        
        var timerBullet: NSTimer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("CreateBullet"), userInfo: nil, repeats: true)
        
        
        var timerMonster: NSTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("CreateMonster"), userInfo: nil, repeats: true)
        
        
        CreateMonster()
    }
    
    func CreateShip() {
        
        shipNode = SKSpriteNode(imageNamed: "Ship (2).png")
        shipNode.size = CGSize(width: 100, height: 100)
        
        shipNode.position = CGPoint(x: self.size.width/2, y:self.size.height/2)
        addChild(shipNode)
        
    }
    
    func CreateBullet() {
        
        var bullet:SKSpriteNode = SKSpriteNode(imageNamed: "Bullet0.png")
        shipNode.size = CGSize(width: bullet.size.width/2, height: bullet.size.height/2)
        
        bullet.position = shipNode.position
        bullet.zPosition = -1
        
        //bullet.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 50, height: 50))
        bullet.physicsBody = SKPhysicsBody(texture: bullet.texture, size: bullet.size)
        
        bullet.name = "Bullet"
        
        bullet.physicsBody?.dynamic = true
        bullet.physicsBody?.affectedByGravity = false
        
        bullet.physicsBody?.categoryBitMask = 1
        bullet.physicsBody?.contactTestBitMask = 2
        
        addChild(bullet)
        
        var moveToTop:SKAction = SKAction.moveToY(self.size.height + bullet.size.height/2, duration: 1)
        
        var removeNode:SKAction = SKAction.removeFromParent()
        
        // bullet sau khi lam xong action 1 se bi xoa di
        bullet.runAction(moveToTop, completion: {
            bullet.runAction(removeNode)
        })
    }
    
    func CreateMonster() {
        
        var monster:SKSpriteNode = SKSpriteNode(imageNamed: "Ship (1).png")
        var randomViTriX = arc4random_uniform(UInt32(self.size.width))
        
        monster.size = CGSize(width: 100, height: 60)
        monster.position = CGPoint(x: CGFloat(randomViTriX), y:self.size.height+50)
        
        monster.name = "Monter"
        
        monster.physicsBody = SKPhysicsBody(texture: monster.texture, size: monster.size)
        
        monster.physicsBody?.dynamic = true
        monster.physicsBody?.affectedByGravity = false
        
        monster.physicsBody?.categoryBitMask = 2
        monster.physicsBody?.contactTestBitMask = 1
        
        addChild(monster)
        
        var moveToBottom: SKAction = SKAction.moveToY(-monster.size.height, duration: 2)
        
        var removeNode:SKAction = SKAction.removeFromParent()
        
        // monster sau khi lam xong action 1 se bi xoa di
        monster.runAction(moveToBottom, completion: {
            monster.runAction(removeNode)
        })
    }
    
    func taoExplode(vitri:CGPoint) {
        //tao hieu ung no
        var nodeExplode:SKSpriteNode = SKSpriteNode(imageNamed: "Explo__000.png")
        nodeExplode.position = vitri
        nodeExplode.size = CGSize(width:  nodeExplode.size.width/2, height: nodeExplode.size.height/2)
        addChild(nodeExplode)
        
        var ao0:SKTexture = SKTexture(imageNamed: "Explo__000.png")
        var ao1:SKTexture = SKTexture(imageNamed: "Explo__001.png")
        var ao2:SKTexture = SKTexture(imageNamed: "Explo__002.png")
        var ao3:SKTexture = SKTexture(imageNamed: "Explo__003.png")
        var ao4:SKTexture = SKTexture(imageNamed: "Explo__004.png")
        var ao5:SKTexture = SKTexture(imageNamed: "Explo__005.png")
        var ao6:SKTexture = SKTexture(imageNamed: "Explo__006.png")
        var ao7:SKTexture = SKTexture(imageNamed: "Explo__007.png")
        var ao8:SKTexture = SKTexture(imageNamed: "Explo__008.png")
        var ao9:SKTexture = SKTexture(imageNamed: "Explo__009.png")
        
        // Tao action thay ao
        var actionThayAo:SKAction = SKAction.animateWithTextures([ao0, ao1, ao2, ao3, ao4, ao5, ao6, ao7, ao8, ao9], timePerFrame: 0.1)
        
        var removeNode:SKAction = SKAction.removeFromParent()
        
        // nodeExplode sau khi lam xong action 1 se lam gi do ...
        nodeExplode.runAction(actionThayAo, completion: {
            nodeExplode.runAction(removeNode)
        })
    }
    
    func vaCham(target1: SKSpriteNode, target2: SKSpriteNode, vitriExplode:CGPoint) {
        
        taoExplode(vitriExplode)
        target1.removeFromParent()
        target2.removeFromParent()
        
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        var firstTarget = contact.bodyA.categoryBitMask // vd: 1 hoac 2
        var secondTarget = contact.bodyB.categoryBitMask // vd: 2 hoac 1
        
        // contact.bodyA.node: bullet || monster
        // contact.bodyB.node: monster || bullet
        
        // vi tri va cham: contact.contactPoint
        
        if firstTarget + secondTarget == 3 {
            vaCham(contact.bodyA.node as! SKSpriteNode, target2: contact.bodyB.node as! SKSpriteNode, vitriExplode: contact.contactPoint)
            
        }
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            shipNode.position = location
        }
    }
   
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            shipNode.position = location
            
        }

    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
