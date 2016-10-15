//
//  ArtistryViewController.swift
//  Artistry
//
//  Created by flc on 16/10/15.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

class ArtistListViewController: UIViewController {
    
    let artists = Artist.artistsFromBundle()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //make detail controller navigationBar back Button's title empty
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ArtistDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            destination.selectedArtist = artists[indexPath.row]
        }
    }
}

extension ArtistListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let artist = artists[indexPath.row]
        
        cell.textLabel?.text = artist.bio
        
        return cell
    }
    
}

extension ArtistListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}
