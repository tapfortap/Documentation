# iOS - SDK Integration

##  Step 1: Add Tap for Tap to Your Project

- Download the [Tap for Tap iOS SDK](https://github.com/tapfortap/iOS/archive/master.zip).

- Unzip the SDK archive and add the following files to your project:
    - `TapForTap.framework`
    - `TapForTapResources.bundle`
    - `MediaBrix.bundle`

You can add them by dragging and dropping it into Xcode, or selecting File ? Add Files to "Your App Name". Have Xcode create groups for the added files and copy them into your project.

![](/images/doc/xcode-01.png)

##  Step 2: Add Required Frameworks

You will need to link to the following frameworks:

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

For the other system frameworks:

- Select the framework from the list (e.g. `SystemConfiguration.framework`)
- Click the Add button.

![](/images/doc/xcode-02b.png)

Repeat the above steps for any other frameworks you're missing in the list above.


##  Step 3: Add configuration to `Info.plist`.

You'll need to add the following keys:

- `NSLocationWhenInUseUsageDescription`: Text describing the reason for accessing the user's location information. Recommended to improve targeting of location-based advertising.

How to add a key to `Info.plist`:

- Open `Info.plist` from the Project Navigator, under `<Project Name>/<App Name>/Supporting Files/`.
- Add a new key by clicking on the "+" at the top
- Enter the key name (e.g. `NSLocationWhenInUseUsageDescription`)
- Press tab and enter the value name (e.g. "We'd like to use your location to give you targeted offers.")


##  Step 4: Initialize Tap for Tap When Your App Launches.

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

##  Step 5: Display Ads

For the best performance with display ads, take a look at our [placement do's and don'ts](/doc/make-money/dos-donts)

### Banners

![Example banner](/images/doc/banner.png)

Banners are the most basic type of ad. They are sized 640x100 and can be placed at either the top or bottom of any screen within your application. If you have the real estate on your app, show banners to earn maximum tap credits. Tap for Tap banners are MRAID compliant, and can show static or dynamic images.

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

![Example Break Unit](/images/doc/user-flow-break.jpg)

[View more info on the achievement moment, and best practices on placement](/doc/make-money/achievement-moment)

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

**Important**: MediaBrix must be integrated to enable these two ad types. View Step 6 below for instructions.

#### Achievement
![Example Achievement Unit](/images/doc/user-flow-achievement.jpg)

[View more info on the achievement moment, and best practices on placement](/doc/make-money/achievement-moment)

#### Rescue
![Example Achievement Unit](/images/doc/user-flow-rescue.jpg)

[View more info on the rescue moment, and best practices on placement](/doc/make-money/rescue-moment)

Achievement and Rescue interstitials work similarly to Break interstitials. For Achievement, you should use it at points in your application where you'd like to reward the user, and for Rescue, points where you'd allow them to continue playing by watching an advertisement.

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

## Step 6 - MediaBrix Integration (Optional)

Please ask us for credentials to use MediaBrix with Tap for Tap. The integration will be enabled automatically once you've added the following two elements to your Info.plist and we approve your account.

1. Set `mediabrixAppID` in your Info.plist to the MediaBrix app ID that was provided to you:

```
mediabrixAppID = qXDpTFlISq
```

2. Set `mediabrixProperty` in your Info.plist to the MediaBrix property that was provided to you

```
mediabrixProperty = pretio_pretioqa_mobile
```


##  Step 7 - Send Info About Your Users (Optional)

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
