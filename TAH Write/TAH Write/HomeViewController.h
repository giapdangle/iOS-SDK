//
//  HomeViewController.h
//  TAH Sensor
//
//  Created by Dhiraj on 05/07/14.
//  Copyright (c) 2014 dhirajjadhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAHble.h"
#import "AppDelegate.h"

@class CBPeripheral;
@class TAHble;

@interface HomeViewController : UIViewController<BTSmartSensorDelegate>
{
   

    IBOutlet UILabel *ConnectionStatusLabel;
    
    IBOutlet UIButton *send;
    
    IBOutlet UITextField *inputstring;
    IBOutlet UITextView *receivedstring;
    
}

@property (strong, nonatomic) CBPeripheral *peripheral;
@property (strong, nonatomic) TAHble *sensor;


- (IBAction)send:(id)sender;


@end
