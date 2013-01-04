//
//  TapForTapPhoneGapPlugin.h
//  TapForTapPhoneGapPlugin
//
//  Created by Phil Laird on 2012-11-13.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>
#import "TapForTap.h"

@interface TapForTapPhoneGapPlugin : CDVPlugin

@property (nonatomic, retain) TapForTapAdView *adView;

- (void) initializeWithAPIKey:(NSMutableArray *)arguments withDict: (NSMutableDictionary *)options;
- (void) createAdView: (NSMutableArray *)arguments withDict: (NSMutableDictionary *)options;
- (void) loadAds: (NSMutableArray *)arguments withDict: (NSMutableDictionary *)options;
- (void) moveAdView: (NSMutableArray *)arguments withDict: (NSMutableDictionary *)options;
- (void) removeAdView: (NSMutableArray *)arguments withDict: (NSMutableDictionary *)options;
- (void) prepareInterstitial: (NSMutableArray *)arguments withDict: (NSMutableDictionary *)options;
- (void) showInterstitial: (NSMutableArray *)arguments withDict: (NSMutableDictionary *)options;
- (void) prepareAppWall: (NSMutableArray *)arguments withDict: (NSMutableDictionary *)options;
- (void) showAppWall: (NSMutableArray *)arguments withDict: (NSMutableDictionary *)options;

@end
