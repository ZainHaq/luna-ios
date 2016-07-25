//
//  ViewController.swift
//  Luna
//
//  Created by Zain-Ul Haq on 2016-07-16.
//  Copyright © 2016 Zain-Ul Haq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let model = LunarPhaseModel()
    
    private lazy var dataSource: PhasesDataSource = {
        return PhasesDataSource(model: self.model)
    }()

    private lazy var headerView: LunarHeaderView = {
        let nib = NSBundle.mainBundle().loadNibNamed("LunarHeaderView", owner: self, options: nil)
        guard let headerView = nib.first as? LunarHeaderView else {
            fatalError("Could not load LunarHeaderView from nib")
        }

        return headerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // connect data source with table view
        dataSource.configureUsing(tableView)

        tableView.pagingEnabled = true
        tableView.rowHeight = 44.0
        
    }

    override func viewDidLayoutSubviews() {
        //tableView.tableHeaderView = self.headerView
    }
}

