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
    
    private lazy var dataSource: PhasesDataSource = {
        
        return PhasesDataSource()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // connect data source with table view
        dataSource.configureUsing(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

