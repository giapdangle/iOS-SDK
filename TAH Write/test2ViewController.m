//
//  test2ViewController.m
//  TAH Write
//
//  Created by Dhiraj on 19/06/14.
//  Copyright (c) 2014 dhirajjadhao. All rights reserved.
//

#import "test2ViewController.h"

@interface test2ViewController ()
{
    NSString *value;
}
@end

@implementation test2ViewController

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
    // Do any additional setup after loading the view from its nib.
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]){
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.title = self.sensor.activePeripheral.name;
    self.sensor.delegate = self;
    
    
    UIColor *lightBlue = [UIColor colorWithRed:0.0 / 255.0 green:174.0 / 255.0 blue:239.0 / 255.0 alpha:1.0];
    
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.barTintColor = lightBlue;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
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

-(void) TAHbleCharValueUpdated:(NSString *)UUID value:(NSData *)data
{
    
    value = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    
    
    NSLog(@"%@",value);
    
}



- (IBAction)pin13:(id)sender {
    
    [sensor updateTAHStatus:sensor.activePeripheral UpdateStatus:YES];
}
@end
