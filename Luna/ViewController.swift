//
//  ViewController.swift
//  Luna
//
//  Created by Zain-Ul Haq on 2016-07-16.
//  Copyright © 2016 Zain-Ul Haq. All rights reserved.
//

import UIKit

let myContext = UnsafeMutablePointer<Void>(nil)

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var model = LunarPhaseModel()
    
    private lazy var dataSource: PhasesDataSource = {
        return PhasesDataSource(model: self.model)
    }()

    private lazy var headerView: LunarHeaderView = {
        let nib = NSBundle.mainBundle().loadNibNamed("LunarHeaderView", owner: self, options: nil)
        guard let headerView = nib.first as? LunarHeaderView else {
            fatalError("Could not load LunarHeaderView from nib")
        }
        
        let insetY: CGFloat = (self.traitCollection.userInterfaceIdiom == .Pad) ? 200.0 : 0.0
        headerView.frame = CGRectInset(UIScreen.mainScreen().bounds, 0.0, insetY)

        return headerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // connect data source with table view
        dataSource.configureUsing(tableView)

        tableView.tableHeaderView = self.headerView
        tableView.pagingEnabled = true
        tableView.rowHeight = 44.0
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.hexColor("232526").CGColor, UIColor.hexColor("414345").CGColor]
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.separatorColor = UIColor.lightGrayColor()
        
        self.dataSource.configureUsing(tableView)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(modelDidUpdate), name: MoonDidUpdateNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(didReceiveError), name: LunarModelDidReceiveErrorNotification, object: nil)
        
        self.model.addObserver(self, forKeyPath: "loading", options: NSKeyValueObservingOptions.New, context: myContext)

    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if self.model == object as? LunarPhaseModel && keyPath == "loading" && context == myContext {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = self.model.loading
        }
        else {
            super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
        }
    }
    
    // MARK: - Update Handlers
    
    func didReceiveError() -> Void {
        let alertController = UIAlertController(title: "Error", message: "An Error had occurred", preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: { _ in
            self.dismissViewControllerAnimated(true, completion: nil)
        })
        
        alertController.addAction(action)
        
        self.presentViewController(alertController, animated: true, completion: nil)

        self.headerView.phaseNameLabel.text = "Error"
    }
    
    func modelDidUpdate() -> Void {
        self.updateLunarViewModel()
    }
    
    func updateLunarViewModel() -> Void {
        let result = self.model.currentMoon
        
        switch result {
        case .Success(let moon):
            self.headerView.viewModel = LunarViewModel(moon: moon)
        case .Failure:
            print("error updating view model, no data")
        }
    }

}

