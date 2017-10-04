//
//  GalleryItemCollectionViewCell.swift
//  AssetSelection
//
//  Created by Woody Lee on 10/3/17.
//  Copyright © 2017 Woody Lee. All rights reserved.
//

import UIKit

class GalleryItemCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet var itemImageView: UIImageView!
	
	func setGalleryItem(_ item:GalleryItem) {
		itemImageView.image = UIImage(named: item.itemImage + "1")
		
		let imageArrary = [UIImage(named: item.itemImage + "1"), UIImage(named: item.itemImage + "2"), UIImage(named: item.itemImage + "3"), UIImage(named: item.itemImage + "4"), UIImage(named: item.itemImage + "5"), UIImage(named: item.itemImage + "6")]
		itemImageView.animationImages = imageArrary as? [UIImage]
		itemImageView.animationDuration = 1.0
		itemImageView.startAnimating()
		
	}
	
}

