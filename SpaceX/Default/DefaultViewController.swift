//
//  ViewController.swift
//  SpaceX
//
//  Created by Anton Nikolaev on 10.04.2022.
//

import UIKit

class DefaultViewController: UIViewController {

    @IBOutlet var viewOutlet: UIImageView!
    @IBOutlet var pageOutlet: UIPageControl!
    @IBOutlet var roketNameLabel: UILabel!
    
    var currentPage = 0 // Номер текущей страницы
    var numberOfPages = 0 // Количество страниц
    var currentRoketImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageOutlet.numberOfPages = numberOfPages
        pageOutlet.currentPage = currentPage
        viewOutlet.image = currentRoketImage
    }
    
    @IBAction func goToSettingsViewButton(_ sender: Any) {
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        
    }
    


}

