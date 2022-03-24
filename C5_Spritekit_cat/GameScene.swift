//
//  GameScene.swift
//  C5_Spritekit_cat
//
//  Created by mac12 on 2022/3/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let pcontainer = PointContainer()
    var backgroundMusic: SKAudioNode!
    let touchMusic = SKAction.playSoundFileNamed("oh_no.mp3", waitForCompletion: false)
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "bg")
        background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        addChild(background)
        
        pcontainer.position = CGPoint(x: self.frame.midX - 10, y: self.frame.midY)
        pcontainer.setScale(0.9)
        addChild(pcontainer)
        pcontainer.onInit()
        
        if let musicURL = Bundle.main.url(forResource: "whistle", withExtension: "mp3") {
            backgroundMusic = SKAudioNode(url: musicURL)
            addChild(backgroundMusic)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        run(touchMusic)
        for touch:AnyObject in touches {
            let location = touch.location(in: self)
            let arrObject = self.nodes(at: location)
            for p in arrObject {
                let point = p as? EPoint
                if point != nil && point!.type != PointType.red {
                    pcontainer.onGetNextPoint(point!.index)
                }
            }
        }
    }
}
