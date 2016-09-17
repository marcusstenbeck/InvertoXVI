//
//  GameScene.swift
//  InvertoXVI
//
//  Created by Marcus Stenbeck on 11/09/16.
//  Copyright © 2016 Marcus Stenbeck. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
  
  var entities = [GKEntity]()

  private var lastUpdateTime : TimeInterval = 0
  
  override func didMove(to view: SKView) {
    // Set up bounding physics scene
    physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -size.width / 2, y: -size.height / 2, width: size.width, height: size.height))
    physicsBody!.friction = 1.0
  }
  
  
  func touchDown(atPoint pos : CGPoint) {
  
  }
  
  func touchMoved(toPoint pos : CGPoint) {

  }
  
  func touchUp(atPoint pos : CGPoint) {

  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

  }
  
  
  override func update(_ currentTime: TimeInterval) {
    // Called before each frame is rendered
    
    // Initialize _lastUpdateTime if it has not already been
    if (self.lastUpdateTime == 0) {
      self.lastUpdateTime = currentTime
    }
    
    // Calculate time since last update
    let dt = currentTime - self.lastUpdateTime
    
    // Update entities
    for entity in self.entities {
      entity.update(deltaTime: dt)
    }
    
    self.lastUpdateTime = currentTime
  }
}
