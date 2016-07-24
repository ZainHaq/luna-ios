//
//  PhasesDataSource.swift
//  Luna
//
//  Created by Zain Haq on 2016-07-23.
//  Copyright © 2016 Zain Haq. All rights reserved.
//

import UIKit

class PhasesDataSource: NSObject, UITableViewDataSource {

    weak var tableView: UITableView? {
        didSet {
            self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")

            self.tableView?.dataSource = self
            self.tableView?.reloadData()

        }
    }

    func configureUsing(tableView: UITableView) {
        self.tableView = tableView
    }

    // MARK: - UITableViewDataSource

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = "Moon Phase Cell"
        return cell
    }
}
