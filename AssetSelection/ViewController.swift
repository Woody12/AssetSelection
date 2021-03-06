//
//  ViewController.swift
//  AssetSelection
//
//  Created by Woody Lee on 9/28/17.
//  Copyright © 2017 Woody Lee. All rights reserved.
//

import UIKit

//, UICollectionViewDelegate
class ViewController: UIViewController {

	@IBOutlet weak var selectionContainerView: UIView!
	
	@IBOutlet weak var barView: UIView!
	@IBOutlet weak var pageViewContainerView: UIView!
	@IBOutlet weak var barTitleLabel: UILabel!
	
	private var selectContainerViewY: CGFloat!
	private var selectContainerViewHeight: CGFloat!
	
	private var tapGesture: UITapGestureRecognizer!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		tapGesture = UITapGestureRecognizer()
		tapGesture.addTarget(self, action: #selector(displaySelection))
		
		let collaspBarGesture = UITapGestureRecognizer()
		collaspBarGesture.addTarget(self, action: #selector(animateCollaspeBar))
		barView.addGestureRecognizer(collaspBarGesture)
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		selectContainerViewY = selectionContainerView.frame.origin.y
		selectContainerViewHeight = selectionContainerView.frame.size.height
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func DoneSelection_Click(_ sender: Any) {
		animateCollaspeBar()
	}
	
	@objc func animateCollaspeBar() {
		UIView.animate(withDuration: 0.5) {
			var frame = self.selectionContainerView.frame
			frame.origin.y = UIScreen.main.bounds.size.height - 20.0
			frame.size.height = 40.0
			
			self.barView.alpha = 0
			self.selectionContainerView.frame = frame
			self.selectionContainerView.addGestureRecognizer(self.tapGesture)
		}
	}
	
	@objc func displaySelection() {
		
		UIView.animate(withDuration: 0.5) {
			var frame = self.selectionContainerView.frame
			frame.origin.y = self.selectContainerViewY //(UIScreen.main.bounds.size.height / 2) - 50.0
			frame.size.height = self.selectContainerViewHeight
			
			self.barView.alpha = 1.0
			self.selectionContainerView.frame = frame
			self.selectionContainerView.removeGestureRecognizer(self.tapGesture)
		}
	}
	
//	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//		let alert = UIAlertController(title: "didSelectItemAtIndexPath:", message: "Indexpath = \(indexPath)", preferredStyle: .alert)
//
//		let alertAction = UIAlertAction(title: "Dismiss", style: .destructive, handler: nil)
//		alert.addAction(alertAction)
//
//		self.present(alert, animated: true, completion: nil)
//	}
//
}

