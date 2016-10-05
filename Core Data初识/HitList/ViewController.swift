//
//  ViewController.swift
//  HitList
//
//  Created by flc on 16/10/5.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var names = [String]()
    var people = [NSManagedObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "The List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetechResults()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addName(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "New name", message: "Add a new name", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { (action: UIAlertAction) in
            let textField = alertController.textFields?.first
            if let newName = textField?.text, newName.characters.count > 0 {
                self.save(name: newName)
                self.tableView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction) in
            
        })
        alertController.addTextField { (textField: UITextField) in
            
        }
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    private func save(name: String) {
        let managedContext = getManagedContext()
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)
        let person = NSManagedObject(entity: entity!, insertInto: managedContext)
        person.setValue(name, forKey: "name")
        do {
            try managedContext.save()
            print("saved")
        }catch{
            print(error)
        }
        people.append(person)
    }
    
    private func fetechResults() {
        let context = getManagedContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        do {
            if let searchResults = try context.fetch(fetchRequest) as? [NSManagedObject] {
                people = searchResults
            }
        } catch {
            print(error)
        }
    }
    
    private func getManagedContext() -> NSManagedObjectContext {
        let appDeletegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDeletegate.persistentContainer.viewContext
        return managedContext
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        let person = people[indexPath.row]
        cell.textLabel?.text = person.value(forKey: "name") as? String
        return cell
        
    }
}

