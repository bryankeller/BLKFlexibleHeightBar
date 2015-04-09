//
//  SquareCashStyleBar.swift
//  BLKFlexibleHeightBarSwiftDemo
//
//  Created by rabzu on 09/04/2015.
//  Copyright (c) 2015 Weshapp. All rights reserved.
//

import Foundation
import BLKFlexibleHeightBar

class SquareCashStyleBar: BLKFlexibleHeightBar{
    
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
        self.maximumBarHeight = 200.0
        self.minimumBarHeight = 65.0
        self.backgroundColor = UIColor(red:0.17, green:0.63, blue:0.11, alpha:1)
        
        // Add and configure name label
        var nameLabel = UILabel()
        nameLabel.font = UIFont(name: "System", size: 22)
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.text = "Bryan Keller"
        
        
        var initialNameLabelLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes()
        initialNameLabelLayoutAttributes.size = nameLabel.sizeThatFits(CGSizeZero)
        initialNameLabelLayoutAttributes.center = CGPointMake(self.frame.size.width*0.5, self.maximumBarHeight-50.0)
        nameLabel.addLayoutAttributes(initialNameLabelLayoutAttributes,forProgress:0.0)
        
        var midwayNameLabelLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existingLayoutAttributes: initialNameLabelLayoutAttributes)
        midwayNameLabelLayoutAttributes.center = CGPointMake(self.frame.size.width*0.5, (self.maximumBarHeight-self.minimumBarHeight)*0.4+self.minimumBarHeight-50.0)
        nameLabel.addLayoutAttributes(midwayNameLabelLayoutAttributes, forProgress:0.6)
        
        var finalNameLabelLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existingLayoutAttributes: midwayNameLabelLayoutAttributes)
        finalNameLabelLayoutAttributes.center = CGPointMake(self.frame.size.width*0.5, self.minimumBarHeight-25.0)
        nameLabel.addLayoutAttributes(finalNameLabelLayoutAttributes, forProgress:1.0)
        
        self.addSubview(nameLabel)
        
        // Add and configure profile image
        var profileImageView = UIImageView(image: UIImage(named: "ProfilePicture.png"))
        profileImageView.contentMode = UIViewContentMode.ScaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 35.0
        profileImageView.layer.borderWidth = 2.0
        profileImageView.layer.borderColor = UIColor.whiteColor().CGColor
        
        var initialProfileImageViewLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes()
        initialProfileImageViewLayoutAttributes.size = CGSizeMake(70.0, 70.0)
        initialProfileImageViewLayoutAttributes.center = CGPointMake(self.frame.size.width*0.5, self.maximumBarHeight-110.0)
        profileImageView.addLayoutAttributes(initialProfileImageViewLayoutAttributes, forProgress:0.0)
        
        var midwayProfileImageViewLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existingLayoutAttributes: initialProfileImageViewLayoutAttributes)
        midwayProfileImageViewLayoutAttributes.center = CGPointMake(self.frame.size.width*0.5, (self.maximumBarHeight-self.minimumBarHeight)*0.8+self.minimumBarHeight-110.0)
        profileImageView.addLayoutAttributes(midwayProfileImageViewLayoutAttributes, forProgress:0.2)
        
       var finalProfileImageViewLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existingLayoutAttributes: midwayProfileImageViewLayoutAttributes)
        finalProfileImageViewLayoutAttributes.center = CGPointMake(self.frame.size.width*0.5, (self.maximumBarHeight-self.minimumBarHeight)*0.64+self.minimumBarHeight-110.0)
        finalProfileImageViewLayoutAttributes.transform = CGAffineTransformMakeScale(0.5, 0.5)
        finalProfileImageViewLayoutAttributes.alpha = 0.0
        profileImageView.addLayoutAttributes(finalProfileImageViewLayoutAttributes, forProgress:0.5)
        
        self.addSubview(profileImageView)
        
       
    }
    
}