//
//  ViewController.swift
//  TableViews
//
//  Created by Bosko Nikolic / BBS2H20A on 09.11.21.
//

import UIKit

class ViewController: UIViewController {
    
    var games = ["Far Cry 6", "Battlefield 2042", "God of War"]

    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        navigationItem.rightBarButtonItem = editButtonItem
        
        title = "Games"
        
        myTableView.tableFooterView = UIView()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        print("Set Editing")
        
        super.setEditing(!isEditing, animated: true)
        myTableView.setEditing(!myTableView.isEditing, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
     
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let selectedGame = games[sourceIndexPath.row]
        
        games.remove(at: sourceIndexPath.row)
        
        games.insert(selectedGame, at: destinationIndexPath.row)
    
    }
    
    func tableView( tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == .delegate {
            games.remove(at: indexPath.row)
            
            myTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
