//
//  ViewController.swift
//  LighterViewControllers
//
//  Created by mfang032 on 2017/6/25.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate static let  PhotoCellIdentifier = "PhotoCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var photos: [Photo] = {
        let photo = Photo("Michael", user: nil, rating: 6, identifier: "michale", creationDate: Date())
        return [photo]
    }()
    
    lazy var photosArrayDataSource: ArrayDataSource = {
        let configureCell:TableViewCellConfigureBlock = { (cell: PhotoCell, photo:Photo) in
            cell.configureForPhoto(photo)
        }
        let photosArrayDataSource = ArrayDataSource(self.photos, PhotoCellIdentifier, block: configureCell)
        return photosArrayDataSource
    }()
    
}

extension ViewController {
    
    func setupTableView() {
        tableView.dataSource = photosArrayDataSource
        tableView.delegate = self
        tableView.estimatedRowHeight = 64
        tableView.register(PhotoCell.nib(), forCellReuseIdentifier: ViewController.PhotoCellIdentifier)
    }
}

extension ViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//    }
    
}

