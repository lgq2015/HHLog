//
//  HHLogUtil.m
//  PocketTutorTea
//
//  Created by CatchZeng on 15/9/13.
//  Copyright (c) 2015年 qingningxiezuo. All rights reserved.
//

#import "HHLogUtil.h"
#import "CocoaLumberjack.h"
#import "HHLogFormatter.h"

@implementation HHLogUtil

+(void)installLogUtil{
    // Add File Log
    DDFileLogger* fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
    
    // Add Apple System Log
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    
    // Enable XcodeColors
    setenv("XcodeColors", "YES", 0);
    // Add Standard lumberjack initialization
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    // And then enable colors
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    // Set colors for levels
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor blueColor] backgroundColor:nil forFlag:DDLogFlagInfo];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor greenColor] backgroundColor:nil forFlag:DDLogFlagDebug];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor lightGrayColor] backgroundColor:nil forFlag:DDLogFlagVerbose];
    
    // Set format
    HHLogFormatter* logFormatter = [[HHLogFormatter alloc]init];
    [fileLogger setLogFormatter:logFormatter];
    [[DDASLLogger sharedInstance] setLogFormatter:logFormatter];
    [[DDTTYLogger sharedInstance] setLogFormatter:logFormatter];
}



@end