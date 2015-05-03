# iOS - SDK Implementation

##  Current Version
**4.0.0** - [See Changelog](/doc/ios/changelog)

Supports iOS 5.0 and up.

##  General Information

Integrating Tap for Tap into your app is really easy! Follow the steps below to get started.

# Instructions

##  Step 1: Add Tap for Tap to Your Project.

- Download the [Tap for Tap iOS SDK](https://github.com/tapfortap/iOS/archive/master.zip).

- Unzip the SDK archive and copy the following files into your project:
    - `TapForTap.framework`
    - `TapForTapResources.bundle`

You can add them by dragging and dropping it into Xcode, or selecting File ? Add Files to "Your App Name". Have Xcode create groups for the added files and copy them into your project.

![](/images/doc/xcode-01.png)

##  Step 2: Add Required Frameworks

You will need to link to the following frameworks:

- `TapForTap.framework`
- `SystemConfiguration.framework`
- `Social.framework`
- `MediaPlayer.framework`
- `Accounts.framework`
- `StoreKit.framework`
- `EventKit.framework`
- `EventKitUI.framework`
- `CoreTelephony.framework`
- `AVFoundation.framework`
- `AudioToolbox.framework`
- `AdSupport.framework`
- `MobileCoreServices.framework`
- `CoreMotion.framework`
- `PassKit.framework`
- `CoreMedia.framework`
- `libsqlite3.dylib`
- `libxml2.dylib`
- `libz.dylib`

To link to a framework, open the project explorer on the left side of Xcode:

1. Select your project from the very top.
1. Select your app's target.
1. Select the Build Phases tab.
1. Expand Link Binary With Libraries.
1. Click the + button.

![](/images/doc/xcode-02a.png)

For `TapForTap.framework`:

- Click "Add Other..."
- Select `TapForTap.framework` from where you added it to your project.
- Click the "Open" button.

For the other system frameworks:

- Select the framework from the list (e.g. `SystemConfiguration.framework`)
- Click the Add button.

![](/images/doc/xcode-02b.png)

Repeat the above steps for any other frameworks you're missing in the list above.

##  Step 3: Initialize Tap for Tap When Your App Launches.

Import `TFTTapForTap.h` in your app delegate and call our initialize method.

```objective-c
#import <TapForTap/TFTTapForTap.h>

- (void) application: (UIApplication *)application didFinishLaunchingWithOptions: (NSDictionary *)launchOptions
{
  [TFTTapForTap initializeWithAPIKey: @"YOUR API KEY"];

	// Set up the main window and root view controller

	return YES;
}
```

##  Step 4: Display Ads

### Banners

In the view controllers in which you would like to display banners, in your `viewDidLoad` method create a `TFTBanner` and add it to your view. Your view controller needs to implement the `TFTBannerDelegate` protocol in the header file, e.g. @interface MyViewController <TFTBannerDelegate>

```objective-c
#import <TapForTap/TFTTapForTap.h>

- (void) viewDidLoad
{
	[super viewDidLoad];

	// Show a banner at the bottom of this view, 320x50 points
	CGFloat y = self.view.frame.size.height - 50.0;
	TFTBanner *banner = [TFTBanner bannerWithFrame: CGRectMake(0, y, 320, 50) delegate: self];
	[self.view addSubview: banner];

	// If you do not use ARC then release the banner.
	// [banner release];
}
```


### Break Interstitials

In the view controllers in which you would like to display interstitials, in your `viewDidLoad` method call either `[ TFTInterstitial loadBreakInterstitialWithCallbackOnReceivedAd... ]` or `[ TFTInterstitial loadBreakInterstitialWithDelegate... ]`.

For the second method, your view controller can implement the `TFTInterstitialDelegate` protocol in the header file (i.e. `MyViewController.h`).

```objective-c
#import <TapForTap/TFTTapForTap.h>

- (void) viewDidLoad
{
	[super viewDidLoad];

	// Load an interstitial with a callback
    [TFTInterstitial loadBreakInterstitialWithCallbackOnReceivedAd:^(TFTInterstitial *interstitial) {

        // The interstitial has loaded, so we can show it now
        [interstitial showWithViewController:self];

    } onAdDidFail:^(TFTInterstitial *interstitial, NSString *reason) {

        // The interstitial failed to load, log an error
        NSLog(@"Ad failed: %@", reason);

    } onAdDidShow:nil onAdWasTapped:nil onAdWasDismissed:nil];
    
}
```

In the callback you can show the interstitial with `[interstitial showWithViewController: self]`. You can make sure the interstitial is loaded with `[self.interstitial readyToShow]` if you want to be certain it's ready before showing it (recommended).


### Achievement and Rescue Interstitials

Achievement and Rescue interstitials work similarly to Break interstials. You should use these at points in your application where you'd like to reward the user, or to allow them to continue playing by watching an advertisement.

In the view controllers in which you would like to display interstitials, in your `viewDidLoad` method (or another appropriate handler), call `[ TFTInterstitial loadRescueInterstitial... ]`.

```objective-c
#import <TapForTap/TFTTapForTap.h>

- (void) viewDidLoad
{
	[super viewDidLoad];

	// Load a Rescue interstitial with a callback
    [TFTInterstitial loadRescueInterstitialWithTitle:@"Need a Boost?"
                                        brandingText:@"My App"
                                      enticementText:@"Watch a short message"
                                   rewardDescription:@"Free boost"
                                          rewardIcon:[NSURL URLWithString:@"http://yourdomain.com/app_logo.png"]
                                     optInButtonText:@"Tap for your free boost!"
                                        onReceivedAd:^(TFTInterstitial *interstitial) {

                                            // The interstitial has loaded, so we can show it now
                                            [interstitial showWithViewController:self];

                                        } onAdDidFail:nil onAdDidShow:nil onAdWasTapped:nil onAdWasDismissed:nil];
}
```

```objective-c
#import <TapForTap/TFTTapForTap.h>

- (void) viewDidLoad
{
	[super viewDidLoad];

	// Load an Achievement interstitial with a callback
    [TFTInterstitial loadAchievementInterstitialWithDescription:@"You beat the level!"
                                              rewardDescription:@"a free gift!"
                                                     rewardIcon:[NSURL URLWithString:@"http://yourdomain.com/app_logo.png"]
                                                   onReceivedAd:^(TFTInterstitial *interstitial) {

                                                       // The interstitial has loaded, so we can show it now
                                                       [interstitial showWithViewController:self];

                                                   } onAdDidFail:nil onAdDidShow:nil onAdWasTapped:nil onAdWasDismissed:nil];
    
}
```

In the callback you can show the interstitial with `[interstitial showWithViewController: self]` or `[self.interstitial showAndLoadWithViewController: self]` if you want to queue up the next one immediately. You can make sure the interstitial is loaded with `[self.interstitial readyToShow]` if you want to be certain it's ready before showing it (recommended).

##  Step 5 - Send Optional Info About Your Users.

If you have information about your users that your privacy policy allows you to share with us, you can help us better target ads by passing it along. Just set the info on `TFTTapForTap`. We accept year of birth, gender, location, and user account IDs on your system.

```objective-c
[TFTTapForTap setGender: MALE or FEMALE];
[TFTTapForTap setYearOfBirth: 1990];
[TFTTapForTap setLocation: location];
[TFTTapForTap setUserAccountId: accountId];
```

Where gender is `either` `MALE` or `FEMALE`, `age` is a positive integer, `location` is an `android.location.Location` object, and user `account ID`s are strings.

**Note:** If you are using Tap for Tap's [monetization](/doc/monetization) program passing this information can greatly increase your revenue.
