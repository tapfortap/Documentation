//
//  TapForTapPhoneGapPlugin.m
//
//  Created by Sami Samhuri on 04/02/12.
//  Copyright (c) 2012 Tap for Tap. All rights reserved.
//

#import "TapForTapPhoneGapPlugin.h"
#import "TapForTap.h"

// Private API
@interface TapForTapPhoneGapPlugin ()
- (CGRect) makeFrame: (NSMutableDictionary *)options;
- (void) setAdOptions: (NSMutableDictionary *)options;
@end


@implementation TapForTapPhoneGapPlugin

@synthesize adView = _adView;

- (void) initializeWithAPIKey:(NSMutableArray *)arguments withDict: (NSMutableDictionary *)options
{
    NSString *callbackId = [arguments objectAtIndex: 0];
    
    [TapForTap initializeWithAPIKey: [arguments objectAtIndex: 1]];
    
    CDVPluginResult *result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
    [self writeJavascript: [result toSuccessCallbackString: callbackId]];
}

- (void) createAdView: (NSMutableArray *)arguments withDict: (NSMutableDictionary *)options
{
    NSString *callbackId = [arguments objectAtIndex: 0];
    
    if (!self.adView) {
        self.adView = [[[TapForTapAdView alloc] initWithFrame: [self makeFrame: options]] autorelease];
        [self setAdOptions: options];
        [self.webView.superview addSubview: self.adView];
    }
    
    CDVPluginResult *result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
    [self writeJavascript: [result toSuccessCallbackString: callbackId]];
}

- (void) loadAds: (NSMutableArray *)arguments withDict: (NSMutableDictionary *)options
{
    NSString *callbackId = [arguments objectAtIndex: 0];
    
    if (self.adView) {
        [self.adView loadAds];
        
        CDVPluginResult *result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
        [self writeJavascript: [result toSuccessCallbackString: callbackId]];
    }
    else {
        CDVPluginResult *result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR messageAsString: @"Cannot load ads before creating the ad view"];
        [self writeJavascript: [result toSuccessCallbackString: callbackId]];
    }
}

- (void) moveAdView: (NSMutableArray *)arguments withDict: (NSMutableDictionary *)options
{
    NSString *callbackId = [arguments objectAtIndex: 0];
    
    if (self.adView) {
        [UIView animateWithDuration: 1.5 animations: ^{
            self.adView.frame = [self makeFrame: options];
        }];
        CDVPluginResult *result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
        [self writeJavascript: [result toSuccessCallbackString: callbackId]];
    }
    else {
        CDVPluginResult *result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR messageAsString: @"Cannot move the ad view before creating it"];
        [self writeJavascript: [result toSuccessCallbackString: callbackId]];
    }
}

- (void) removeAdView: (NSMutableArray *)arguments withDict: (NSMutableDictionary *)options
{
    NSString *callbackId = [arguments objectAtIndex: 0];
    
    [self.adView removeFromSuperview];
    self.adView = nil;
    
    CDVPluginResult *result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
    [self writeJavascript: [result toSuccessCallbackString: callbackId]];
}

- (void) prepareInterstitial: (NSMutableArray *)arguments withDict: (NSMutableDictionary *)options
{
    NSString *callbackId = [arguments objectAtIndex: 0];
    
    [TapForTapInterstitial prepare];
    
    CDVPluginResult *result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
    [self writeJavascript: [result toSuccessCallbackString: callbackId]];    
}

- (void) showInterstitial: (NSMutableArray *)arguments withDict: (NSMutableDictionary *)options
{
    NSString *callbackId = [arguments objectAtIndex: 0];
    
    [TapForTapInterstitial showWithRootViewController: self.viewController];
    
    CDVPluginResult *result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
    [self writeJavascript: [result toSuccessCallbackString: callbackId]];
}

- (void) prepareAppWall: (NSMutableArray *)arguments withDict: (NSMutableDictionary *)options
{
    NSString *callbackId = [arguments objectAtIndex: 0];
    
    [TapForTapAppWall prepare];
    
    CDVPluginResult *result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
    [self writeJavascript: [result toSuccessCallbackString: callbackId]];
   
}

- (void) showAppWall: (NSMutableArray *)arguments withDict: (NSMutableDictionary *)options
{
    NSString *callbackId = [arguments objectAtIndex: 0];
    
    [TapForTapAppWall showWithRootViewController: self.viewController];
    
    CDVPluginResult *result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
    [self writeJavascript: [result toSuccessCallbackString: callbackId]];
}

- (CGRect) makeFrame: (NSMutableDictionary *)options
{
    CGFloat x = 0;
    CGFloat y = self.webView.superview.frame.size.height - 50;
    CGFloat width = self.webView.frame.size.width;
    CGFloat height = 50;
    
    if ([options objectForKey: @"x"]) {
        x = [[options objectForKey: @"x"] floatValue];
    }
    if ([options objectForKey: @"y"]) {
        y = [[options objectForKey: @"y"] floatValue];
    }
    if ([options objectForKey: @"width"]) {
        width = [[options objectForKey: @"width"] floatValue]; 
    }
    if ([options objectForKey: @"height"]) {
        height = [[options objectForKey: @"height"] floatValue];
    }
    
    return CGRectMake(x, y, width, height);
}

- (void) setAdOptions: (NSMutableDictionary *)options
{
    if ([options objectForKey: @"gender"]) {
        NSString *genderString = [[[options objectForKey: @"gender"] description] lowercaseString];
        TapForTapGender gender = NONE;
        if ([genderString isEqualToString: @"male"]) {
            gender = MALE;
        }
        else if ([genderString isEqualToString: @"male"]) {
            gender = FEMALE;
        }
        [TapForTap setGender: gender];
    }
    if ([options objectForKey: @"age"]) {
        [TapForTap setAge:[[options objectForKey:@"age"] intValue]];
    }
    if ([options objectForKey: @"location"]) {
        NSMutableDictionary *location = [options objectForKey: @"location"];
        CLLocationDegrees lat = [[location objectForKey: @"latitude"] doubleValue];
        CLLocationDegrees lng = [[location objectForKey: @"longitude"] doubleValue];
        [TapForTap setLocation:[[[CLLocation alloc] initWithLatitude: lat longitude: lng] autorelease]];
    }
}

- (void) dealloc
{
    [_adView release];
    [super dealloc];
}

@end
