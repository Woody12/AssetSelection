//
//  AnimalsViewController.swift
//  AssetSelection
//
//  Created by Woody Lee on 10/2/17.
//  Copyright © 2017 Woody Lee. All rights reserved.
//

import UIKit


class AnimalsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	@IBOutlet var collectionView: UICollectionView!
	
	var galleryItems: [GalleryItem] = []
	
	// MARK: -
	// MARK: - View Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		initGalleryItems()
		collectionView.reloadData()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
//		if let parentDelegate = parent as? UICollectionViewDelegate {
//			collectionView.delegate = parentDelegate
//		}
		
	}
	fileprivate func initGalleryItems() {
		
		var items = [GalleryItem]()
		let inputFile = Bundle.main.path(forResource: "AnimalsInfo", ofType: "plist")
		
		let inputDataArray = NSArray(contentsOfFile: inputFile!)
		
		for inputItem in inputDataArray as! [Dictionary<String, String>] {
			let galleryItem = GalleryItem(dataDictionary: inputItem)
			items.append(galleryItem)
		}
		
		galleryItems = items
	}
	
	// MARK: -
	// MARK: - UICollectionViewDataSource
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return galleryItems.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryItemCollectionViewCell", for: indexPath) as! GalleryItemCollectionViewCell
		
		cell.setGalleryItem(galleryItems[indexPath.row])
		return cell
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	// MARK: Collection Delegate
	
	public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print("selected")
	}

	
	// MARK: -
	// MARK: - UICollectionViewFlowLayout
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let picDimension = self.view.frame.size.width / 6.0
		return CGSize(width: picDimension, height: picDimension)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		let leftRightInset = self.view.frame.size.width / 20.0
		return UIEdgeInsetsMake(20.0, leftRightInset, 0, leftRightInset)
	}
}
