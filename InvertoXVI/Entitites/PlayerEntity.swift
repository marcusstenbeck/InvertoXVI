//
//  SpaceshipEntity.swift
//  InvertoXVI
//
//  Created by Marcus Stenbeck on 11/09/16.
//  Copyright © 2016 Marcus Stenbeck. All rights reserved.
//

import GameplayKit

class PlayerEntity: GKEntity {
  
  var node: SKSpriteNode?

  init(spriteNode: SKSpriteNode) {
    node = spriteNode
  
    super.init()
    
    addComponent(SpriteComponent(node: node!))
    addComponent(AccelerometerComponent())
    addComponent(InvertoMoverComponent(body: node!.physicsBody!))
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}
