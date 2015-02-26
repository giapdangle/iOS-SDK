//
//  test2ViewController.h
//  TAH Write
//
//  Created by Dhiraj on 19/06/14.
//  Copyright (c) 2014 dhirajjadhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAHble.h"

@class CBPeripheral;
@class TAHble;

@interface test2ViewController : UIViewController<BTSmartSensorDelegate>
{

    IBOutlet UIButton *pin13;
}
@property (strong, nonatomic) CBPeripheral *peripheral;
@property (strong, nonatomic) TAHble *sensor;

- (IBAction)pin13:(id)sender;

@end
