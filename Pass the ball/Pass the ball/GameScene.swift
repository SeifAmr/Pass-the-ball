//
//  GameScene.swift
//  Pass the ball
//
//  Created by Seif Amr Kassem on 4/10/20.
//  Copyright © 2020 Seif Amr Kassem. All rights reserved.
//

import SpriteKit
import GameplayKit

struct ColliderType  {
    
    static let ball: UInt32 = 1
    static let wall: UInt32 = 2
    
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
   var ball = SKSpriteNode()
   var enemy = SKSpriteNode()
   var main = SKSpriteNode()
   var wall = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        main = self.childNode(withName: "main") as! SKSpriteNode
        wall = self.childNode(withName: "wall") as! SKSpriteNode
        self.physicsWorld.contactDelegate = self
        
        
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 30, dy: 20))
        
        
//        wall.physicsBody?.categoryBitMask = ColliderType.wall
        ball.physicsBody?.categoryBitMask = ColliderType.ball
        wall.physicsBody?.collisionBitMask = ColliderType.ball
        wall.physicsBody?.contactTestBitMask = ColliderType.ball
        
        
        
//        if ball.position.x == (wall.position.x-40) {
//
//                          wall.position.x = wall.position.x - 80
//print("ndjsjndjndf")
//                     }
//
//        if ball.position.x == (wall.position.x + 40) && ball.position.x == wall.position.y  {
//
//                   wall.position.x = wall.position.x + 80
//            print("dkmfkmkgmk")
//
//              }
//
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
        
        
    }
    
    
    func didbeginContact(contact: SKPhysicsContact){
        
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        
        if contact.bodyA.node?.name == "player"{
            
            firstBody = contact.bodyA
            secondBody = contact.bodyB
            
        }
        else {
            
            firstBody =  contact.bodyB
            secondBody = contact.bodyA
            
        }
        
        
        
        if firstBody.node?.name == "wall" && secondBody.node?.name == "ball"{
            
            print("HERE WE GO")
            
            
        }
        
    }
//    func playing2PlayerGame() {
//
//
//           life1.isHidden = true
//           life2.isHidden = true
//           life3.isHidden = true
//           life4.isHidden = true
//           life5.isHidden = true
//
//           if ball.position.y <= main.position.y - 25 {
//               addScore(playerWhoWon: enemy)
//
//           }
//           else if ball.position.y >= enemy.position.y + 25 {
//               addScore(playerWhoWon: main)
//           }
//       }
    
     
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    for touch in touches {
        let location = touch.location(in: self)
     
            if location.x < 0 {
                enemy.run(SKAction.moveTo(y: location.y, duration: 0.2))
            }
            if location.x > 0 {
                main.run(SKAction.moveTo(y: location.y, duration: 0.1))
            }
        
    }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
                if location.x < 0 {
                    enemy.run(SKAction.moveTo(y: location.y, duration: 0.1))
                }
            if location.x > 0 {
                    main.run(SKAction.moveTo(y: location.y, duration: 0.1))
                }
            }
            
        
    }
 
     func points(){
        
        var score = 0
        
        if ball.position == CGPoint(x: 0, y: 0) {
            
            score += 1
            
        }
        print("heyyyy", score)
        
    }
    

    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
       
        
        
        
    }
}
