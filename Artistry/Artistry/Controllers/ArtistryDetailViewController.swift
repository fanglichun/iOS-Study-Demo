//
//  ArtistryDetailViewController.swift
//  Artistry
//
//  Created by flc on 16/10/15.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

class ArtistDetailViewController: UIViewController {
    
    var selectedArtist: Artist!
    
    let moreInfoText = "Select For More Info >"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedArtist.name
        //modify return button color
        navigationController?.navigationBar.tintColor = UIColor.white
    }
}

extension ArtistDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedArtist.works.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.selectionStyle = .none
        let work = selectedArtist.works[indexPath.row]
        cell.textLabel?.text = work.info
        
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
        
        // 5
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}
