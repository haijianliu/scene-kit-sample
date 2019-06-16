//
//  GameViewController.swift
//  SceneKitSample macOS
//
//  Created by haijian on 2019/06/16.
//  Copyright © 2019 haijian. All rights reserved.
//

import Cocoa
import SceneKit

// Our macOS specific view controller
class GameViewController: NSViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// retrieve the SCNView
		guard let scnView = self.view as? SCNView else {
			print("View of Gameview controller is not an SCNView")
			return
		}
		
		// allows the user to manipulate the camera
		scnView.allowsCameraControl = true
		
		// Uses Model I/O to load a scene file at the given URL
		let modelFileURL = Bundle.main.url(forResource: "Models/XenoRaven", withExtension: "scn")
		
		// create a new scene from url
		var scene = SCNScene()
		do { scene = try SCNScene(url: modelFileURL!, options: [:]) }
		catch { print("Unable to load model. Error info: \(error)") }
		
		// set the scene to the view
		scnView.scene = scene
		
		// get a node and do something
		let node = scene.rootNode.childNodes[0]
		node.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 5)))
	}
}

