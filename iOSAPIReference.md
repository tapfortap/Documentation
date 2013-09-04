# iOS API Reference

## TFTTapForTap

### Overview

This is the SDK's main class. It provides methods to:

  - Initialize Tap For Tap so ads can begin to be served
  - Set meta data about users to better ads can be served

### Special Considerations

If the Tap for Tap API key is set in the `info.plist` there is no need to call any of the initialize methods as
Tap for Tap will initialize itself.

### Methods

#### + (void)initializeWithApiKey:(NSString *) *)apiKey

Initializes Tap for Tap with the provided API key.

**Parameters**

  - _apiKey_ - Your Tap for Tap API key. This can be found on your [account](https://tapfortap.com/manage/account) page.

---

### + (void)initializeWithAPIKey:(NSString *)apiKey completion:(TFTInitializationRequestHandler)handler;

Initializes Tap for Tap with the provided API key and block.

**Parameters**

  - _apiKey_ - Your Tap for Tap API key. This can be found on your [account](https://tapfortap.com/manage/account) page.
  - _handler_ - A block for handling the result of the initialization.

---

#### + (void)enableTestMode

Enables test mode. Test mode causes Tap for Tap to disable spending and earning for your app. 
This is useful for when you are developing your app and want to test with the SDK integrated 
without wasting impressions and clicks for your app. **Don't forget** to disable test mode before 
you release your app to the App Store.

---

#### + (void)disableTestMode

Disables test mode. See enableTestMode for more details.

---

#### + (void)disableTapForTap

Stops Tap for Tap from being able to download and show ads. This can be useful if you offer
a paid version of your app that removes ads.

---

#### + (void)enableTapForTap

Allows Tap for Tap to download and show ads. See disableTapForTap for more details.

---

#### + (void)setYearOfBirth:(NSUInteger)yearOfBirth;

Sets the user's year of birth to be passed along when requesting an ad. This helps Tap for Tap to provide
the best ad for this user.

---

#### + (void)setGender:(TFTGender)gender;

Sets the user's gender to be passed along when requesting an ad. This helps Tap for Tap to provide
the best ad for this user.

---

#### + (void)setLocation:(CLLocation *)location;

Sets the user's location to be passed along when requesting an ad. This helps Tap for Tap to provide
the best ad for this user.

---

#### + (void)setUserAccountId:(NSString *)userAccountId;

Sets the user's user account ID to be passed along when requesting an ad. This is an ID that you the developer
can assign to your users. This helps Tap for Tap to provide the best ad for this user.

## TFTBanner

### Overview

This class is responsible for showing banners.

The banner will stop downloading and showing new ads if the view is not visible or the screen is off.

### Methods

#### + (TFTBanner *)bannerWithFrame:(CGRect)frame;

Creates a new Banner and begins downloading and showing ads.

**Parameters**

  - _frame_ - The frame for the view.

**Return Value**

  - _TFTBanner_ - A new instance of a TFTBanner.

---

#### + (TFTBanner *)bannerWithFrame:(CGRect)frame delegate:(id<TFTBannerDelegate>)delegate;

Creates a new Banner and begins downloading and showing ads with the provided delegate.

**Parameters**

  - _frame_ - The frame for the view.
  - _delegate_ - A delegate to handle the callbacks.

**Return Value**

  - _TFTBanner_ - A new instance of a Banner.

#### - (void)startShowingAds

Causes ads to start being downloaded and shown.

---

#### - (void)stopShowingAds

Causes ads to stop being downloaded and shown.

---

#### @propert autoRollover

If set to YES, a new ad to be downloaded and shown aproximately every 60 seconds. If set to NO, only a call to startShowinAds will cause a new ad to be downloaded and show.

---

## TFTBannerDelegate

### Overview

This interface provides delegate methods that are called during the lifecycle of the banner.

### Methods

#### - (void)tftBannerDidReceiveAd:(TFTBanner *)banne;

Called when the banner receives a new ad.

**Parameters**

  - _banner_ - The TFTBanner that received a new ad.

---

#### - (void)tftBanner:(TFTBanner *)banner didFail:(NSString *)reason;

Called when the banner fails to download or show a new ad.

**Parameters**

  - _banner_ - The TFTBanner that failed.
  - _reason_ - The reason for the failure.

---

#### - (void)tftBannerWasTapped:(TFTBanner *)banner;

Called when a user taps on the banner.

**Parameters**

  - _banner_ - The TFTBanner that was tapped.
  
## TFTInterstitial

### Overview

This class is responsible for downloading and showing interstitials.

### Special Considerations

Always be sure that an interstitial is ready to be shown by either using the delegate methods
or by using the isReadyToShow method. Failure to do so may cause an ad to be shown at unexpected or 
undersireable times due to network connectivity.

### Methods

#### + (TFTInterstitial *)interstitial;

Creates and starts loading an interstitial

**Return Value**

  - _TFTInterstitial_ - A new instance of TFTInterstitial.

---

#### + (TFTInterstitial *)interstialWithDelegate:(id<TFTInterstitialDelegate>) delegate;

Creates and instance of TFTInterstitial and starts loading an interstitial with the provided delegate.

**Parameters**

  - _delegate_ - A delegate.

**Return Value**

  - _TFTInterstitial_ - A new instance of TFTInterstitial.

---

#### - (void)showWithViewController:(UIViewController *)viewController

Causes an interstitial ad to be shown. This will push a new view controller ontop of the current one to show the ad.

---

#### - (void)showAndLoadWithViewController:(UIViewController *)viewController

Causes an interstitial to be shown and a new interstitial to be loaded. This will push a view controller 
new ontop of the current one to show the Ad.

---

#### - (void)load

Causes a new interstitial to be loaded.

---

#### BOOL readyToShow

`true` if an interstitial is ready to show. `false` if an interstitial is not ready to show.

## TFTInterstitialDelegate

### Overview

This protocol provides delegate methods that are called during the lifecycle of the interstitial.

### Methods

#### - (void)tftInterstitialDidReceive:(TFTInterstitial *)interstitial;

Called when the interstitial receives a new ad and is ready to be shown.

**Parameters**

  - _interstitial_ - The TFTInterstitial which received a new ad.

---

#### - (void)tftInterstitial:(TFTInterstitial *)interstitial didFail:(NSString *)reason;

Called when the interstitial fails to load or show an ad. An explicit call to load is required to get the next ad.

**Parameters**

  - _interstitial_ - The TFTInterstitial that failed to load or show the ad.
  - _reason_ - The reason why the ad failed.

---

#### - (void)tftInterstitialDidShow:(TFTInterstitial *)interstitial;

Called when the interstitial sucessfully shows an ad to the user.

**Parameters**

  - _interstitial_ - The TFTInterstitial that showed an ad.

---

#### - (void)tftInterstitialWasTapped:(TFTInterstitial *)interstitial;

Called when the user taps the interstitial.

**Parameters**

  - _interstitial_ - The TFTInterstitial that was tapped.

---

#### - (void)tftInterstitialWasDismissed:(TFTInterstitial *)interstitial;

Called when the user dismissed the interstitial.

**Parameters**

  - _interstitial_ - The TFTInterstitial that was dismissed.

## TFTAppWall

### Overview

This class is responsible for downloading and showing app walls.

### Special Considerations

Always be sure that an app wall is ready to be shown by either using the callbacks or by using the 
isReadyToShow method. Failure to do so may cause an ad to be shown at unexpected or undersireable 
times due to network latency.

### Methods

#### + (TFTAppWall *)appWall;

Creates and starts loading an app wall.

**Return Value**

  - _TFTAppWall_ - A new instance of TFTAppWall.

---

#### + (TFTAppWall *)appWallWithDelegate:(id<TFTAppWallDelegate>) delegate;

Creates a new instance of TFTAppWall and starts loading an app wall using the provided delgate.

**Parameters**

  - _delegate_ - A delegate.

**Return Value**

  - _TFTAppWall_ - A new instance of TFTAppWall.

---

#### - (void)showWithViewController:(UIViewController *)viewController

Causes an app wall to be shown. This will push a new view controller ontop of the current one to show the ad.

---

#### - (void)showAndLoadWithViewController:(UIViewController *)viewController

Causes an app wall to be shown and a new app wall to be loaded. This will push a view controller 
new ontop of the current one to show the Ad.

---

#### - (void)load

Causes a new app wall to be loaded.

---

#### BOOL readyToShow

`true` if an app wall is ready to show. `false` if an app wall ad is not ready to show.

## TFTAppWallDelegate

### Overview

This protocol provides delegate methods that are called during the lifecycle of the app wall.

### Methods

#### - (void)tftAppWallDidReceive:(TFTAppWall *)appWall;

Called when the app wall ads loads receives a new ad and is ready to be shown.

**Parameters**

  - _appWall_ - The TFTAppWall that received a new ad.

---

#### - (void)tftAppWall:(TFTAppWall *)appWall didFail:(NSString *)reason;

Called when the app wall fails to load or show an ad. An explicit call to load is required to get the next ad.

**Parameters**

  - _appWall_ - The TFTAppWall that failed to load or show the ad.
  - _reason_ - The reason why the ad failed.

---

#### - (void)tftAppWallDidShow:(TFTAppWall *)appWall;

Called when the app wall is sucessfully shown to the user.

**Parameters**

  - _appWall_ - The TFTAppWall that showed a new ad.

---

#### - (void)tftAppWallWasTapped:(TFTAppWall *)appWall;

Called when the user taps on an ad in the app wall.

**Parameters**

  - _appWall_ - The TFTAppWall that was tapped.

---

#### - (void)tftAppWallWasDismissed:(TFTAppWall *)appWall;

Called when the user dismissed the app wall.

**Parameters**

  - _appWall_ - The TFTAppWall that was dismissed.
