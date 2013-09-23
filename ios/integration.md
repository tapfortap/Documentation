# iOS - SDK Implementation

##  Current Version
**3.0.4** - [See Changelog](/doc/ios/changelog)

Supports iOS 5.0 and up.

##  General Information

Integrating Tap for Tap into your app is usually really easy. Follow the steps below to get started.

# Instructions

##  Step 1: Add Tap for Tap to Your Project.

Add the `TapForTap` folder to your project by dragging and dropping it into Xcode, or selecting File ? Add Files to "Your App Name". Have Xcode create groups for the added files and copy them into your project.

![](https://raw.github.com/tapfortap/Documentation/master/images/xcode-01.png)

##  Step 2: Add Required Frameworks

You will need to link to the SystemConfiguration.framework and AdSupport.framework.

To link to a framework, open the project explorer on the left side of Xcode 4:

- Select your project from the very top.
- Select your app's target.
- Select the Build Phases tab.
- Expand Link Binaries With Libraries.
- Click the + button.

![](https://raw.github.com/tapfortap/Documentation/master/images/xcode-02a.png)

- Select SystemConfiguration.framework.
- Click the Add button.

![](https://raw.github.com/tapfortap/Documentation/master/images/xcode-02b.png)

Repeat the above steps for AdSupport.framework.

##  Step 3: Initialize Tap for Tap When Your App Launches.

Import `TFTTapForTap.h` in your app delegate and call our initialize method.

```objective-c
# import "TFTTapForTap.h"

- (void) application: (UIApplication *)application didFinishLaunchingWithOptions: (NSDictionary *)launchOptions
{
  [TFTTapForTap initializeWithAPIKey: @"YOUR API KEY"];

	// Set up the main window and root view controller

	return YES;
}
```

##  Step 4: Display a Banner

In the view controllers in wich you would like to display ads, in your `viewDidLoad` method create a `TFTBanner` and add it to your view.

For banners your view controller needs to implement the `TFTBannerDelegate` protocol in the header file, e.g. @interface MyViewController <TFTBannerDelegate>

```objective-c
// Be sure to import TFTTapForTap.h
# import "TFTTapForTap.h"

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
