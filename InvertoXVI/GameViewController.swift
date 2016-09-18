//
//  GameViewController.swift
//  InvertoXVI
//
//  Created by Marcus Stenbeck on 11/09/16.
//  Copyright © 2016 Marcus Stenbeck. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

  @IBOutlet weak var labelThing: UILabel!
  
  var levelName = "default"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    labelThing.text = levelName
    
    if let view = self.view as! SKView? {
      // Load the SKScene from 'GameScene.sks'
      if let scene = SKScene(fileNamed: levelName) as? GameScene {
        
        scene.enumerateChildNodes(withName: "player", using: {
          (node, _) in
          
          if let spriteNode = node as? SKSpriteNode {
            let shipEntity = PlayerEntity(spriteNode: spriteNode)
            scene.entities.append(shipEntity)
          }
        })
        
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill
        
        // Present the scene
        view.presentScene(scene)
      } else {
        performSegue(withIdentifier: "gotoMenu", sender: self)
      }
      
      view.ignoresSiblingOrder = true
      
      view.showsFPS = true
      view.showsNodeCount = true
      view.showsPhysics = true
    }
  }
  
  override var shouldAutorotate: Bool {
    return true
  }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    if UIDevice.current.userInterfaceIdiom == .phone {
      return .allButUpsideDown
    } else {
      return .all
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
}
