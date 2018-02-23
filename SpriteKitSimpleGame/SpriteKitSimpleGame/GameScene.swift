//
//  GameScene.swift
//  SpriteKitSimpleGame
//
//  Created by Uchenna  Aguocha on 2/22/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        makeBoard()
        makePlayer()
    }
    
    func makeStripe(width: CGFloat, height: CGFloat) -> SKSpriteNode {
        
        let color = UIColor(white: 1, alpha: 0.2)
        let size = CGSize(width: width, height: height)
        let stripe = SKSpriteNode(color: color, size: size)
        
        return stripe
    }
    
    func makeBoard() {
        
        // set the background color of the board to brown
        scene?.backgroundColor = UIColor.brown
        
        // screen size
        let screenWidth = size.width
        let screenHeight = size.height
        
        // create horizontal and vertical stripes
        for i in -1...1 {
            
            let horizontalStripe = makeStripe(width: screenWidth, height: 60)
            addChild(horizontalStripe)
            horizontalStripe.position.x = screenWidth / 2
            horizontalStripe.position.y = (screenHeight / 2) + (65 * CGFloat(i))
            
            
            let verticalStripe = makeStripe(width: 60, height: screenHeight)
            addChild(verticalStripe)
            verticalStripe.position.x = (screenWidth / 2) + (65 * CGFloat(i))
            verticalStripe.position.y = screenHeight / 2
            
        }
        

    }
    
    func makePlayer() {
        
        // create box node
        let box = SKSpriteNode(color: UIColor.red, size: .init(width: 50, height: 50))
        self.addChild(box)
        
        let screenWidth = size.width
        let screenHeight = size.height
        box.position = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
    }
    
    
}
