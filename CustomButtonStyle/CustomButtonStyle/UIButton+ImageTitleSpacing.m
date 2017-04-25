//
//  UIButton+ImageTitleSpacing.m
//  SystemPreferenceDemo
//
//  Created by moyekong on 12/28/15.
//  Copyright © 2015 wiwide. All rights reserved.
//

#import "UIButton+ImageTitleSpacing.h"

@implementation UIButton (ImageTitleSpacing)

- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space
{
    self.backgroundColor = [UIColor blueColor];
    self.titleLabel.backgroundColor = [UIColor blackColor];
    
//    self.backgroundColor = [UIColor cyanColor];
    
    /**
     *  前置知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
     *  如果只有title，那它上下左右都是相对于button的，image也是一样；
     *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
     */

    
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    
    CGFloat originalButtonWidth = imageWith+labelWidth;
    CGFloat originalButtonHeight = MAX(imageHeight, labelHeight);
    
    CGFloat newButtonWidth = 0;
    CGFloat newButtonHeight = 0;
    
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets contentEdgeInsets= UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case MKButtonEdgeInsetsStyleTop:
        {
            newButtonWidth = MAX(imageWith, labelWidth);
            newButtonHeight = imageWith + labelHeight + space;
            
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
            
            CGFloat vertical = (newButtonHeight - originalButtonHeight - space/2.0)/2.0;
            CGFloat horizon  = (newButtonWidth - originalButtonWidth)/2.0;
            contentEdgeInsets = UIEdgeInsetsMake(vertical, horizon, vertical, horizon);
        }
            break;
        case MKButtonEdgeInsetsStyleLeft:
        {
            
            newButtonWidth = imageWith + labelWidth + space;
            newButtonHeight = MAX(imageHeight, labelHeight);

            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
            
            CGFloat vertical = (newButtonHeight - originalButtonHeight)/2.0;
            CGFloat horizon  = (newButtonWidth - originalButtonWidth)/2.0;
            
            contentEdgeInsets = UIEdgeInsetsMake(vertical, horizon, vertical, horizon);
        }
            break;
        case MKButtonEdgeInsetsStyleBottom:
        {
            newButtonWidth = MAX(imageWith, labelWidth);
            newButtonHeight = imageHeight + labelHeight + space;
            
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
            
            CGFloat vertical = (newButtonHeight - originalButtonHeight - space/2.0)/2.0;
            CGFloat horizon  = (newButtonWidth - originalButtonWidth)/2.0;
            
            contentEdgeInsets = UIEdgeInsetsMake(vertical, horizon, vertical, horizon);
        }
            break;
        case MKButtonEdgeInsetsStyleRight:
        {
            newButtonWidth = imageWith + labelWidth + space;
            newButtonHeight = MAX(imageHeight, labelHeight);
            
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
            
            CGFloat vertical = (newButtonHeight - originalButtonHeight)/2.0;
            CGFloat horizon  = (newButtonWidth - originalButtonWidth)/2.0;
            
            contentEdgeInsets = UIEdgeInsetsMake(vertical, horizon, vertical, horizon);
            
        }
            break;
        default:
            break;
    }
    
    // 4. 赋值
    self.titleEdgeInsets    = labelEdgeInsets;
    self.imageEdgeInsets    = imageEdgeInsets;
    self.contentEdgeInsets  = contentEdgeInsets;
}

@end
