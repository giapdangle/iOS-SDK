//
//  TAHDataWriteViewController.h
//  TAH
//
//  Created by TAHs on 7/13/12.
//  Copyright (c) 2012 jnhuamao.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAHble.h"

@class CBPeripheral;
@class TAHble;

@interface TAHDataWriteViewController : UIViewController<BTSmartSensorDelegate>
{

    IBOutlet UIButton *command;
    IBOutlet UIButton *next;
    
}

@property (strong, nonatomic) CBPeripheral *peripheral;
@property (strong, nonatomic) TAHble *sensor;
@property (weak, nonatomic) IBOutlet UILabel *TAHUUID;
@property (weak, nonatomic) IBOutlet UITextField *MsgToArduino;
@property (weak, nonatomic) IBOutlet UITextView *tvRecv;


- (IBAction)command:(id)sender;
- (IBAction)sendMsgToArduino:(id)sender;
- (IBAction)next:(id)sender;

@end
