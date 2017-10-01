//
//  TempViewController.swift
//  AssetSelection
//
//  Created by Woody Lee on 9/30/17.
//  Copyright © 2017 Woody Lee. All rights reserved.
//

import UIKit

class TempViewController: UIViewController {
	
	@IBOutlet weak var assetView: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		
		
	}
	@IBAction func cmdClick(_ sender: Any) {
	
		var frame = assetView.frame
		frame.origin.y = UIScreen.main.bounds.size.height - 10.0
		frame.size.height = 10.0
		
		//pageViewContainerView.isHidden = true
		assetView.frame = frame
	
	}
}
