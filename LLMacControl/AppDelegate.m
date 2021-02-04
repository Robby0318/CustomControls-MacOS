//
//  AppDelegate.m
//  CustomControl
//
//  Created by 罗磊 on 03/02/2021.
//  Copyright © 2021 luolei. All rights reserved.
//

#import "AppDelegate.h"
#import "LLButton.h"
#import "LLCircleProgressView.h"
#import "LLLineProgressView.h"
#import "LLSwitchButton.h"
@interface AppDelegate ()
@property (weak) IBOutlet LLButton *cButton;
@property (weak) IBOutlet LLCircleProgressView *circleProgressView;
@property (weak) IBOutlet LLCircleProgressView *loadingView;
@property (weak) IBOutlet LLLineProgressView *lineProgressView;
@property (weak) IBOutlet LLSwitchButton *switchButton;

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

-(void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    


    _switchButton.isOn = YES;
    [_cButton setTitle:@"Push" color:[NSColor whiteColor] font:[NSFont fontWithName:@"Helvetica Neue" size:16]];
                                                          
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 1;i<=100 ;i++) {
            usleep(100*1000);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self->_circleProgressView setProgressValue:i];
                [self->_lineProgressView setProgressValue:i];
            });
        }
    });
    _loadingView.loading = YES;
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
