//
//  ViewController.h
//  LocationMANAGER
//
//  Created by tomyAmi on 2014/09/27.
//  Copyright (c) 2014年 tomyAmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *latitude;

@property (weak, nonatomic) IBOutlet UILabel *longitude;
@end

