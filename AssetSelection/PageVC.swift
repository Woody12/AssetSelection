//
//  PageVC.swift
//  AssetSelection
//
//  Created by Woody Lee on 9/30/17.
//  Copyright © 2017 Woody Lee. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
	
	lazy var VCArray: [UIViewController] = {
		return [self.VCInstance(name: "AnimalsVC"),
		        self.VCInstance(name: "BackgroundVC"),
		        self.VCInstance(name: "CameraVC"),
		        self.VCInstance(name: "CampaignVC")]
	}()
	
	private func VCInstance(name: String) -> UIViewController {
		return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
	}
	
	private func setupPageControl() {

		// Configure page indicator dot colors
		let pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [PageVC.self])
		pageControl.pageIndicatorTintColor = .lightGray
		pageControl.currentPageIndicatorTintColor = .purple
		pageControl.backgroundColor = .clear
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Install this class as the data source
		dataSource = self
		
		setupPageControl()
		
		if let firstVC = VCArray.first {
			setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
		}
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		for view in self.view.subviews {
			if view is UIScrollView {
				view.frame = UIScreen.main.bounds
			} else if view is UIPageControl {
				view.backgroundColor = UIColor.clear
			}
		}
	}
	
	// MARK: Page View
	
	public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		
		guard let viewControllerIndex = VCArray.index(of: viewController) else {
			return nil
		}
		
		let previousIndex = viewControllerIndex - 1
		
		// Page will loop around
		guard previousIndex >= 0 else {
			return VCArray.last
		}
		
		// Check for safety
		guard VCArray.count > previousIndex else {
			return nil  // out of bound
		}
		
		return VCArray[previousIndex]
	}
	
	public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		
		guard let viewControllerIndex = VCArray.index(of: viewController) else {
			return nil
		}
		
		let nextIndex = viewControllerIndex + 1
		
		// Page will loop around
		guard nextIndex < VCArray.count else {
			return VCArray.first
		}
		
		// Check for safety
		guard VCArray.count > nextIndex else {
			return nil  // out of bound
		}
		
		return VCArray[nextIndex]
		
	}
	
	// MARK: Dot Page
	
	public func presentationCount(for pageViewController: UIPageViewController) -> Int {// The number of items reflected in the page indicator.
		
		// Dots
		return VCArray.count
	}
	
	public func presentationIndex(for pageViewController: UIPageViewController) -> Int {// The selected item reflected in the page indicator.
		
		guard let firstViewController = viewControllers?.first,
			let firstViewControllerIndex = VCArray.index(of: firstViewController) else {
				return 0
		}
		
		return firstViewControllerIndex
	}
	
}
