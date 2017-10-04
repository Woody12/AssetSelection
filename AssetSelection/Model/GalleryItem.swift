//
//  GalleryItem.swift
//  AssetSelection
//
//  Created by Woody Lee on 10/3/17.
//  Copyright © 2017 Woody Lee. All rights reserved.
//

import Foundation

class GalleryItem {
	
	var itemImage: String
	
	init(dataDictionary:Dictionary<String,String>) {
		itemImage = dataDictionary["itemImage"]!
	}
	
	class func newGalleryItem(_ dataDictionary:Dictionary<String,String>) -> GalleryItem {
		return GalleryItem(dataDictionary: dataDictionary)
	}
	
}
