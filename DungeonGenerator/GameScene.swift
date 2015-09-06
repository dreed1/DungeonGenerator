//
//  GameScene.swift
//  DungeonGenerator
//
//  Created by Dan Reed on 9/5/15.
//  Copyright (c) 2015 Dan Reed. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
  var cave: CaveGenerator = CaveGenerator()
  
  override func didMoveToView(view: SKView) {
    self.cave.genDemoMap()
    //self.drawCaveSprites()
  }
  
  override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {

  }
  
  override func update(currentTime: CFTimeInterval) {
      /* Called before each frame is rendered */
  }
  
  func drawCaveSprites() {
    for row in 0..<self.cave.mapHeight {
      for column in 0..<self.cave.mapWidth {
        let block = self.cave.mapRepresentation[column][row]
        let color = block == 1 ? UIColor.brownColor() : UIColor.blueColor()
        let multiplier = CGFloat(4.0)
        let shape = SKShapeNode(rect:
          CGRectMake(CGFloat(column)*multiplier, CGFloat(row)*multiplier, 1.0*multiplier, 1.0*multiplier)
        )
        shape.fillColor = color
        shape.strokeColor = color
        self.addChild(shape)
      }
    }
  }
}
