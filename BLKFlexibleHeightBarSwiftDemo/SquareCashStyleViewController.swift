//
//  SquareCashStyleViewController.swift
//  BLKFlexibleHeightBarSwiftDemo
//
//  Created by rabzu on 09/04/2015.
//  Copyright (c) 2015 Weshapp. All rights reserved.
//

import UIKit
import BLKFlexibleHeightBar

class SquareCashStyleViewController: UIViewController, UITableViewDataSource{

    private var myCustomBar: SquareCashStyleBar?
    private var delegateSplitter: BLKDelegateSplitter?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNeedsStatusBarAppearanceUpdate()
        
        self.myCustomBar = SquareCashStyleBar(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.frame), 100.0))
        
        var behaviorDefiner = SquareCashStyleBehaviorDefiner()
        behaviorDefiner.addSnappingPositionProgress(0.0, forProgressRangeStart:0.0, end:0.5)
        behaviorDefiner.addSnappingPositionProgress(1.0, forProgressRangeStart:0.5, end:1.0)
        behaviorDefiner.snappingEnabled = true
        behaviorDefiner.elasticMaximumHeightAtTop = true
        self.myCustomBar!.behaviorDefiner = behaviorDefiner
        
        //Assigns to delegates
        self.delegateSplitter = BLKDelegateSplitter(firstDelegate: behaviorDefiner, secondDelegate: self)
        self.tableView.delegate =  self.delegateSplitter
        
        self.view.addSubview(self.myCustomBar!)
        
        // Setup the table view
        self.tableView.contentInset = UIEdgeInsetsMake(self.myCustomBar!.maximumBarHeight, 0.0, 0.0, 0.0);
        // Add close button - it's pinned to the top right corner, so it doesn't need to respond to bar height changes
        var closeButton = UIButton.buttonWithType(UIButtonType.System) as? UIButton
        closeButton!.userInteractionEnabled = true
        closeButton!.frame = CGRectMake(self.myCustomBar!.frame.size.width - 40.0, 25.0, 30.0, 30.0);

        closeButton!.tintColor = UIColor.whiteColor()
        closeButton!.setImage(UIImage(named: "Close.png"),  forState: UIControlState.Normal)
        closeButton!.addTarget(self, action: "closeViewController:", forControlEvents:UIControlEvents.TouchUpInside)
        
        self.myCustomBar!.addSubview(closeButton!)
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? UITableViewCell
        
        
        cell!.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1)
        return cell!
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func closeViewController(sender: UIView){
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
