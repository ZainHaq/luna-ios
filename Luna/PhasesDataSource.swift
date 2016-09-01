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
            let nib = UINib(nibName: "PhaseTableViewCell", bundle: nil)
            self.tableView?.registerNib(nib, forCellReuseIdentifier: "Cell")

            self.tableView?.dataSource = self
            self.tableView?.reloadData()
        }
    }

    private var phases: [Phase] = []

    private let model: LunarPhaseModel

    init(model: LunarPhaseModel) {
        self.model = model
        super.init()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(phasesDidUpdate), name: PhasesDidUpdateNotification, object: nil)
    }

    func configureUsing(tableView: UITableView) {
        self.tableView = tableView
    }

    // MARK: - UITableViewDataSource

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.phases.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PhaseTableViewCell
        cell.viewModel = viewModelForIndexPath(indexPath)
//        
//        if indexPath.row == self.phases.count - 1 {
//            cell.separatorInset = UIEdgeInsetsMake(0, cell.bounds.size.width, 0.0, 0.0)
//        }
//        else {
//            cell.separatorInset = UIEdgeInsetsMake(0.0, 16.0, 0.0, 16.0)
//        }
        
        return cell
    }

    // MARK: - Private

    func viewModelForIndexPath(indexPath: NSIndexPath) -> PhaseViewModel {
        let phase = self.phases[indexPath.row] as Phase
        let viewModel = PhaseViewModel(phase: phase)
        return viewModel
    }
    
    func phasesDidUpdate() -> Void {
        let result = self.model.currentPhases
        switch result {
        case .Success(let phases):
            self.phases = phases
            self.tableView?.reloadData()
        case .Failure:
            print("error updating phases, no data")
        }
    }
}
