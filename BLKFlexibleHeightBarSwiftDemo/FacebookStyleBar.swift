//
//  FacebookStyleBar.swift
//  BLKFlexibleHeightBarSwiftDemo
//
//  Created by rabzu on 09/04/2015.
//  Copyright (c) 2015 Weshapp. All rights reserved.
//

import Foundation
import BLKFlexibleHeightBar

//Required, to make objc code work with swift
extension BLKDelegateSplitter: UITableViewDelegate{
    
}

class FacebookStyleBar: BLKFlexibleHeightBar{
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
     self.setUp()
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
     self.setUp()
        
    }

    private func setUp(){
        
        // Configure bar appearence
        self.maximumBarHeight = 105.0;
        self.minimumBarHeight = 20.0;
        self.backgroundColor = UIColor(red: 0.31, green: 0.42, blue: 0.64, alpha: 1)
        self.clipsToBounds = true
        
        
        // Add blue bar view
        var blueBarView = UIView()
        blueBarView.backgroundColor = self.backgroundColor
        
        var initialBlueBarLayoutAttributes =  BLKFlexibleHeightBarSubviewLayoutAttributes()
        initialBlueBarLayoutAttributes.frame = CGRectMake(0.0, 25.0, self.frame.size.width, 40.0)
        initialBlueBarLayoutAttributes.zIndex = 1023
        blueBarView.addLayoutAttributes(initialBlueBarLayoutAttributes, forProgress:0.0)
        blueBarView.addLayoutAttributes(initialBlueBarLayoutAttributes, forProgress:40.0/(105.0-20.0))
        
        var finalBlueBarLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existingLayoutAttributes: initialBlueBarLayoutAttributes)
        finalBlueBarLayoutAttributes.transform = CGAffineTransformMakeTranslation(0.0, -40.0)
        blueBarView.addLayoutAttributes(initialBlueBarLayoutAttributes, forProgress:1.0)
        
        self.addSubview(blueBarView)
        
        
        // Add search field and close button
        var searchField = UITextField()
        searchField.layer.cornerRadius = 5.0

        searchField.attributedPlaceholder = NSAttributedString(string: "Search",
                                                           attributes:[NSForegroundColorAttributeName: UIColor(red: 0.31, green: 0.42, blue: 0.64, alpha: 1)])
    
    
        searchField.backgroundColor = UIColor(red: 0.22, green: 0.27, blue: 0.46, alpha: 1)
        searchField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0);
        
        var initialSearchFieldLayoutAttributes =  BLKFlexibleHeightBarSubviewLayoutAttributes()
        initialSearchFieldLayoutAttributes.frame = CGRectMake(8.0, 25.0, initialBlueBarLayoutAttributes.size.width * 0.85, initialBlueBarLayoutAttributes.size.height-8.0)
        initialSearchFieldLayoutAttributes.zIndex = 1024
        searchField.addLayoutAttributes(initialSearchFieldLayoutAttributes, forProgress:0.0)
        searchField.addLayoutAttributes(initialSearchFieldLayoutAttributes, forProgress:40.0 / (105.0 - 20.0))
        
        var finalSearchFieldLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existingLayoutAttributes: initialSearchFieldLayoutAttributes)
        finalSearchFieldLayoutAttributes.transform = CGAffineTransformMakeTranslation(0.0, -0.3 * (105 - 20))
        finalSearchFieldLayoutAttributes.alpha = 0.0
        
        searchField.addLayoutAttributes(finalSearchFieldLayoutAttributes, forProgress:0.8)
        searchField.addLayoutAttributes(finalSearchFieldLayoutAttributes, forProgress:1.0)
        
        self.addSubview(searchField)
        
        
        // Add white bar view
        var whiteBarView = UIView()
        whiteBarView.backgroundColor = UIColor.whiteColor()
        
         var initialWhiteBarLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes();
        initialWhiteBarLayoutAttributes.frame = CGRectMake(0.0, 65.0, self.frame.size.width, 40.0)
        whiteBarView.addLayoutAttributes(initialWhiteBarLayoutAttributes, forProgress:0.0)
        
        var finalWhiteBarLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existingLayoutAttributes: initialWhiteBarLayoutAttributes)
        finalWhiteBarLayoutAttributes.transform = CGAffineTransformMakeTranslation(0.0, -40.0)
        whiteBarView.addLayoutAttributes(finalWhiteBarLayoutAttributes, forProgress:40.0/(105.0 - 20.0))
        
        self.addSubview(whiteBarView)
        
        // Configure white bar view subviews

        var bottomBorderView = UIView(frame: CGRectMake(0.0, initialWhiteBarLayoutAttributes.size.height - 0.5, initialWhiteBarLayoutAttributes.size.width, 0.5))
        bottomBorderView.backgroundColor = UIColor(red: 0.75, green: 0.75, blue: 0.78, alpha: 1)
        
        whiteBarView.addSubview(bottomBorderView)
        
       var leftVerticalDividerView = UIView(frame: CGRectMake(initialWhiteBarLayoutAttributes.size.width * 0.334, initialWhiteBarLayoutAttributes.size.height*0.1, 0.5, initialWhiteBarLayoutAttributes.size.height * 0.8))
        leftVerticalDividerView.backgroundColor = UIColor(red: 0.85, green: 0.86, blue: 0.88, alpha: 1)
        whiteBarView.addSubview(leftVerticalDividerView)
        
       var rightVerticalDividerView = UIView(frame: CGRectMake(initialWhiteBarLayoutAttributes.size.width * 0.667,
                                                               initialWhiteBarLayoutAttributes.size.height * 0.1, 0.5, initialWhiteBarLayoutAttributes.size.height*0.8))
        rightVerticalDividerView.backgroundColor = UIColor(red: 0.85, green: 0.86, blue: 0.88, alpha: 1)
        whiteBarView.addSubview(rightVerticalDividerView)

    }
    
   
}