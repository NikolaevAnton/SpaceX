//
//  PageViewController.swift
//  SpaceX
//
//  Created by Anton Nikolaev on 11.04.2022.
//

import UIKit

class PageViewController: UIPageViewController {

    let roketImages = [UIImage(named: "Falcon_1"),
                       UIImage(named: "Falcon_9"),
                       UIImage(named: "Falcon_Heavy"),
                       UIImage(named: "Starship")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self

        if let contentPageVC = self.showViewControllerAtIndex(0) {
            setViewControllers([contentPageVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    
    func showViewControllerAtIndex(_ index: Int) -> DefaultViewController? {
        
        guard index >= 0 && index < roketImages.count else {
            return nil
        }
        
        guard let contentPageViewController = storyboard?.instantiateViewController(
            withIdentifier: "DefaultViewController") as? DefaultViewController else { return nil }
        
        contentPageViewController.currentRoketImage = roketImages[index]
        contentPageViewController.currentPage = index
        contentPageViewController.numberOfPages = roketImages.count
        
        return contentPageViewController
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! DefaultViewController).currentPage
        pageNumber -= 1
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! DefaultViewController).currentPage
        pageNumber += 1
        return showViewControllerAtIndex(pageNumber)
    }
}
