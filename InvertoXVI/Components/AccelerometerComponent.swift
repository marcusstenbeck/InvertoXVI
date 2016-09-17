//
//  SpriteComponent.swift
//  InvertoXVI
//
//  Created by Marcus Stenbeck on 11/09/16.
//  Copyright © 2016 Marcus Stenbeck. All rights reserved.
//

import GameKit
import CoreMotion

class AccelerometerComponent: GKComponent {
  
  var secondsSinceLastUpdate: TimeInterval = 0
  let motionManager: CMMotionManager!
  
  override init() {
    motionManager = CMMotionManager()
    motionManager.startAccelerometerUpdates()
    
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    motionManager = nil
    super.init(coder: aDecoder)
  }
}
