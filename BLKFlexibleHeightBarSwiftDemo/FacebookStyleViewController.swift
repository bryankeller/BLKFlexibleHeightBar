//
//  FacebookStyleViewController.swift
//  BLKFlexibleHeightBarSwiftDemo
//
//  Created by rabzu on 09/04/2015.
//  Copyright (c) 2015 Weshapp. All rights reserved.
//

import UIKit
import BLKFlexibleHeightBar

class FacebookStyleViewController: UIViewController, UITableViewDataSource {

    private var myCustomBar: FacebookStyleBar?
    private var delegateSplitter: BLKDelegateSplitter?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNeedsStatusBarAppearanceUpdate()
        
        self.myCustomBar = FacebookStyleBar(frame:CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.frame), 100.0))
        
        var behaviorDefiner = FacebookStyleBarBehaviorDefiner()
        behaviorDefiner.addSnappingPositionProgress(0.0, forProgressRangeStart:0.0, end:40.0/(105.0 - 20.0))
        behaviorDefiner.addSnappingPositionProgress(1.0, forProgressRangeStart:40.0 / (105.0 - 20.0), end: 1.0)
        behaviorDefiner.snappingEnabled = true
        behaviorDefiner.thresholdNegativeDirection = 140.0
        
        self.myCustomBar?.behaviorDefiner = behaviorDefiner
        
        //Assigns to delegates
        self.delegateSplitter = BLKDelegateSplitter(firstDelegate: behaviorDefiner, secondDelegate: self)
        self.tableView.delegate =  self.delegateSplitter
        
        
        self.view.addSubview(self.myCustomBar!)
        
        // Setup the table view
//        self.tableView registerClass(UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        self.tableView.contentInset = UIEdgeInsetsMake(self.myCustomBar!.maximumBarHeight, 0.0, 0.0, 0.0)
        
        
        // Add a close button to the bar
        var closeButton = UIButton.buttonWithType(UIButtonType.System) as? UIButton
        closeButton!.userInteractionEnabled = true
        closeButton!.tintColor = UIColor.whiteColor()
        closeButton!.setImage(UIImage(named: "Close.png"),  forState: UIControlState.Normal)
        closeButton!.addTarget(self, action: "closeViewController:", forControlEvents:UIControlEvents.TouchUpInside)
        
        var initialCloseButtonLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes()
        initialCloseButtonLayoutAttributes.frame = CGRectMake(self.myCustomBar!.frame.size.width - 35.0, 26.5, 30.0, 30.0)
        initialCloseButtonLayoutAttributes.zIndex = 1024
        
        closeButton!.addLayoutAttributes(initialCloseButtonLayoutAttributes, forProgress: 0.0)
        
        closeButton!.addLayoutAttributes(initialCloseButtonLayoutAttributes, forProgress:40.0 / (105.0 - 20.0))
        
        var finalCloseButtonLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existingLayoutAttributes: initialCloseButtonLayoutAttributes)
        finalCloseButtonLayoutAttributes.transform = CGAffineTransformMakeTranslation(0.0, -0.3 * (105 - 20))
        finalCloseButtonLayoutAttributes.alpha = 0.0
        
        closeButton!.addLayoutAttributes(finalCloseButtonLayoutAttributes, forProgress:0.8)
        closeButton!.addLayoutAttributes(finalCloseButtonLayoutAttributes, forProgress:1.0)
        
        self.myCustomBar!.addSubview(closeButton!)
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? UITableViewCell
        
        
        cell!.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1)
        return cell!
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func closeViewController(sender: UIView){
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
