//
//  ViewController.m
//  LocationMANAGER
//
//  Created by tomyAmi on 2014/09/27.
//  Copyright (c) 2014年 tomyAmi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(readonly)CLLocationCoordinate2D myPosi;
@property(nonatomic,strong)CLLocationManager *myPosition;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // if location services are restricted do nothing
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied ||
        [CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted)
    {
        return;
    }
    
    // if locationManager does not currently exist, create it
    if (self.myPosition == nil)
    {
        self.myPosition = [[CLLocationManager alloc] init];
        [self.myPosition setDelegate:self];
        self.myPosition.desiredAccuracy=kCLLocationAccuracyBest;
        //self.locationManager.distanceFilter = 10.0f; // we don't need to be any more accurate than 10m
    }
    
    if ([self.myPosition respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        [self.myPosition requestWhenInUseAuthorization];
    }
    
    [self.myPosition startUpdatingLocation];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
    // if the location is older than 30s ignore
    if (fabs([newLocation.timestamp timeIntervalSinceDate:[NSDate date]]) > 30)
    {
        return;
    }
    
    _myPosi = [newLocation coordinate];
    
    self.latitude.text = [NSString stringWithFormat:@"%f",_myPosi.latitude];
    self.longitude.text = [NSString stringWithFormat:@"%f",_myPosi.longitude];
}
- (IBAction)startlocation:(id)sender {
    [self.myPosition startUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
    
    _myPosi = kCLLocationCoordinate2DInvalid;
}


@end
