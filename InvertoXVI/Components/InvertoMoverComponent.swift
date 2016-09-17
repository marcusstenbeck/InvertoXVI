//
//  InvertoMoverComponent.swift
//  InvertoXVI
//
//  Created by Marcus Stenbeck on 11/09/16.
//  Copyright © 2016 Marcus Stenbeck. All rights reserved.
//

import SpriteKit
import GameplayKit

class InvertoMoverComponent: GKComponent {
  
  var secondsSinceLastUpdate: TimeInterval = 0
  let physicsBody: SKPhysicsBody!
  
  init(body: SKPhysicsBody) {
    physicsBody = body
    
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    physicsBody = nil
    super.init()
  }
  
  override func update(deltaTime seconds: TimeInterval) {
    physicsBody.velocity = getVelocity(seconds: seconds)
  }
  
  func getVelocity(seconds: TimeInterval) -> CGVector {
    if let accelerometerData = entity?.component(ofType: AccelerometerComponent.self)?.motionManager.accelerometerData {
      let acceleration = accelerometerData.acceleration.y;
      
      // just a magic number
      let maxVelocity = 2048.0
      
      // max tilt angle == 90 degrees
      let normalizedAcceleration = sign(acceleration) * min(1.0, abs(acceleration) / (35.0 / 90.0))
      
      // 16 ms -> 1.0
      let normalizedFrameTime = seconds * 1000.0 / 16.0
      
      let targetVelocity = CGFloat(-normalizedAcceleration * normalizedFrameTime * maxVelocity)
      let originalVelocity = physicsBody.velocity.dx
      
      // this points from: original --> target
      let deltaVelocity = targetVelocity - originalVelocity
      
      // Don't directly apply new velocity. Instead ease it.
      let newVelocity = (originalVelocity + deltaVelocity) / 1.6
      
      return CGVector(dx: CGFloat(newVelocity), dy: physicsBody.velocity.dy)
    }
    
    return physicsBody.velocity
  }
}
