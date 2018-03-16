//
//  EntryList.swift
//  Journal
//
//  Created by Michael J. Huber Jr. on 10/1/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import UIKit

class EntryList: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
}

extension EntryList: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return EntryController.shared.tags.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return EntryController.shared.tags[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tag = EntryController.shared.tags[section]
        return EntryController.shared.getEntries(with: tag).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath) as? EntryCell else { return UITableViewCell() }
        let entry = EntryController.shared.getEntry(at: indexPath)
        cell.updateCell(with: entry)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entry = EntryController.shared.getEntry(at: indexPath)
            EntryController.shared.deleteEntry(entry)
            tableView.reloadData()
        }
    }
    
}

extension EntryList: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

extension EntryList {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreateEntrySegue" {
            guard let vc = segue.destination as? CreateEntry,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            let entry = EntryController.shared.getEntry(at: indexPath)
            vc.entry = entry
        }
    }
    
}











