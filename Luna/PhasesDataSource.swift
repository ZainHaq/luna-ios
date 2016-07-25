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
        self.phases = model.currentPhases()
        super.init()
    }

    func configureUsing(tableView: UITableView) {
        self.tableView = tableView
    }

    // MARK: - UITableViewDataSource

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PhaseTableViewCell
        cell.viewModel = viewModelForIndexPath(indexPath)
        return cell
    }

    // MARK: - Private

    func viewModelForIndexPath(indexPath: NSIndexPath) -> PhaseViewModel {
        let phase = self.phases[indexPath.row] as Phase
        let viewModel = PhaseViewModel(phase: phase)
        return viewModel
    }
}
