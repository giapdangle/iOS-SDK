//
//  HomeViewController.m
//  TAH
//
//  Created by Dhiraj on 05/07/14.
//  Copyright (c) 2014 dhirajjadhao. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import "HomeViewController.h"
#import "TAHbleTableController.h"
#import "TAHble.h"




@interface HomeViewController ()
{
NSString *command;
}
@end

@implementation HomeViewController

@synthesize peripheral;
@synthesize sensor;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    // Settings Up Sensor Delegate
     self.sensor.delegate = self;
    
    
    
    
    // Set Connection Status Image
    [self UpdateConnectionStatusLabel];


}


-(void)viewWillAppear:(BOOL)animated
{
    // Set Connection Status Image
    [self UpdateConnectionStatusLabel];
}


    ///////////// Update Device Connection Status Image //////////
-(void)UpdateConnectionStatusLabel
{
    
    
    if (sensor.activePeripheral.state)
    {

        ConnectionStatusLabel.backgroundColor = [UIColor colorWithRed:128.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0];
    }
    else
    {

        ConnectionStatusLabel.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:128.0/255.0 blue:0.0/255.0 alpha:1.0];
    }
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




//////////////////////// Preparing Segue for Navigation //////////////////////////

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Changes title of the Back Button in destintion controller
    UIBarButtonItem *newBackButton =
    [[UIBarButtonItem alloc] initWithTitle:@"Home"
                                     style:UIBarButtonItemStyleBordered
                                    target:nil
                                    action:nil];
    [[self navigationItem] setBackBarButtonItem:newBackButton];
    
    
    
    
}

//////////////////////////////////////////////////////////////////////////////////






//recv data
-(void) TAHbleCharValueUpdated:(NSString *)UUID value:(NSData *)data
{
    NSString *value = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    
    NSLog(@"%@",value);
    
    receivedstring.textColor = [UIColor grayColor];
    receivedstring.text = [receivedstring.text stringByAppendingFormat: @"\n%@", value];
    
    NSRange range = NSMakeRange(receivedstring.text.length - 1,receivedstring.text.length);
    [receivedstring scrollRangeToVisible:range];
    
    
    
}




-(void)setConnect
{
    CFStringRef s = CFUUIDCreateString(kCFAllocatorDefault, (__bridge CFUUIDRef )sensor.activePeripheral.identifier);
    NSLog(@"%@",(__bridge NSString*)s);
    
}

-(void)setDisconnect
{
    
    [sensor disconnect:sensor.activePeripheral];
    
    NSLog(@"TAH Device Disconnected");

    
    //////// Local Alert Settings
    
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);

    /////////////////////////////////////////////
    
    // Set Connection Status Image
    [self UpdateConnectionStatusLabel];
    

}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [inputstring resignFirstResponder];
    
    return YES;
}




- (IBAction)send:(id)sender {
    
    
    command = inputstring.text;
    NSData *feed = [command dataUsingEncoding:[NSString defaultCStringEncoding]];
    [sensor write:sensor.activePeripheral data:feed];
}
@end
