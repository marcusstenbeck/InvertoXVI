//
//  SpriteComponent.swift
//  InvertoXVI
//
//  Created by Marcus Stenbeck on 11/09/16.
//  Copyright © 2016 Marcus Stenbeck. All rights reserved.
//

import SpriteKit
import GameKit

class SpriteComponent: GKComponent {

  let node: SKSpriteNode
  
  init(node: SKSpriteNode) {
    self.node = node
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    self.node = SKSpriteNode()
    super.init(coder: aDecoder)
  }
}
