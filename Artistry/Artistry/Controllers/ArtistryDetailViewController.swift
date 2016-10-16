//
//  ArtistryDetailViewController.swift
//  Artistry
//
//  Created by flc on 16/10/15.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit
let moreInfoText = "Select For More Info >"

class ArtistDetailViewController: UIViewController {
    
    var selectedArtist: Artist!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedArtist.name
        //modify return button color
        navigationController?.navigationBar.tintColor = UIColor.white
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
}

extension ArtistDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedArtist.works.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WorkTableViewCell
        let work = selectedArtist.works[indexPath.row]
        cell.work = work
        return cell
    }
}


extension ArtistDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1
        guard let cell = tableView.cellForRow(at: indexPath) as? WorkTableViewCell else { return }
        
        var work = selectedArtist.works[indexPath.row]
        
        // 2
        work.isExpanded = !work.isExpanded
        selectedArtist.works[indexPath.row] = work
        
        // 3
        cell.moreInfoTextView.text = work.isExpanded ? work.info : moreInfoText
        cell.moreInfoTextView.textAlignment = work.isExpanded ? .left : .center
        
        // 4
        tableView.beginUpdates()
        tableView.endUpdates()
//        tableView.reloadRows(at: [indexPath], with: .automatic)
        
        // 5
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}
