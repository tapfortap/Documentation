# iOS - SDK Integration

[![Watch our iOS integration video](/images/doc/ios-integration-video.jpg)](https://www.youtube.com/watch?v=5ADw0oMGYl0)

##  Step 1: Add Tap for Tap to Your Project

- Download the [Tap for Tap iOS SDK](https://github.com/tapfortap/iOS/archive/master.zip).

- Unzip the SDK archive and add the following file to your project:
    - `TapForTap.framework`

You can add it by dragging and dropping it into Xcode, or selecting File ? Add Files to "Your App Name". Have Xcode create groups for the added files and copy them into your project.

![](/images/doc/xcode-01.png)

- If you want to use any of our plugins, refer to the guide [here](https://tapfortap.com/doc/ios/plugins) on how to use integrate those plugins.

##  Step 2: Add Required Frameworks

You will need to link to the following frameworks:

- `AVFoundation.framework`
- `Accounts.framework`
- `AdSupport.framework`
- `AudioToolbox.framework`
- `CoreMedia.framework`
- `CoreMotion.framework`
- `CoreTelephony.framework`
- `EventKit.framework`
- `EventKitUI.framework`
- `MediaPlayer.framework`
- `MobileCoreServices.framework`
- `PassKit.framework`
- `Security.framework`
- `Social.framework`
- `StoreKit.framework`
- `SystemConfiguration.framework`
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

For the other system frameworks:

- Select the framework from the list (e.g. `SystemConfiguration.framework`)
- Click the Add button.

![](/images/doc/xcode-02b.png)

Repeat the above steps for any other frameworks you're missing in the list above.

##  Step 3: Initialize Tap for Tap When Your App Launches.

Import `TFTTapForTap.h` in your app delegate and call our initialize method. If you want to use plugins, follow the instructions [](http)

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

For the best performance with display ads, take a look at our [placement do's and don'ts](/doc/make-money/dos-donts)

### Achievement Interstitials

![Example Achievement Unit](/images/doc/user-flow-achievement.jpg)

[View more info on the achievement moment, and best practices on placement](/doc/make-money/achievement-moment)

You should show Achievement interstitials at points in your application where you'd like to reward the user.

In the view controllers in which you would like to display interstitials, in your `viewDidLoad` method (or another appropriate handler), call `[ TFTInterstitial loadAchievementInterstitial... ]`.


```objective-c
#import <TapForTap/TFTTapForTap.h>
#import <TapForTap/TFTInterstitial.h>

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

*To find more information on how to use Break and Rescue interstitials, please contact us at: <chris.lefebvre@tapfortap.com>*

### Banners

![Example banner](/images/doc/banner.png)

Banners are the most basic type of ad. They are sized 640x100 and can be placed at either the top or bottom of any screen within your application. If you have the real estate on your app, show banners to earn maximum tap credits. Tap for Tap banners are MRAID compliant, and can show static or dynamic images.

In the view controllers in which you would like to display banners, in your `viewDidLoad` method create a `TFTBanner` and add it to your view. Your view controller needs to implement the `TFTBannerDelegate` protocol in the header file, e.g. `@interface MyViewController <TFTBannerDelegate>`

```objc
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

##  Step 5 - Send Info About Your Users (Optional)

If you have information about your users that your privacy policy allows you to share with us, you can help us better target ads by passing it along. Just set the info on `TFTTapForTap`. We accept year of birth, gender, location, and user account IDs on your system.

```objective-c
[TFTTapForTap setGender: MALE or FEMALE];
[TFTTapForTap setYearOfBirth: 1990];
[TFTTapForTap setLocation: location];
[TFTTapForTap setUserAccountId: accountId];
```

Where gender is `either` `MALE` or `FEMALE`, `age` is a positive integer, `location` is an `android.location.Location` object, and user `account ID`s are strings.

**Note:** If you are using Tap for Tap's [monetization network](/doc/make-money/monetization-network), passing this information can greatly increase your revenue.

## Now [return to the Getting Started Guide](/doc/getting-started) to finish integrating
