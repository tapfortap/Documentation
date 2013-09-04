# Android API Reference

## TapForTap

### Overview

This is the SDK's main class. It provides methods to:

  - Initialize Tap For Tap so ads can begin to be served
  - Set meta data about users to better ads can be served

### Special Considerations

If the Tap for Tap API key is set in the `AndroidManifest.xml` there is no need to call any of the initialize
methods as Tap for Tap will initialize itself.

### Methods

#### public static void initializeWithApiKey(String apiKey)

Initializes Tap for Tap with the provided API key.

**Parameters**

  - _apiKey_ - Your Tap for Tap API key. This can be found on your [account](https://tapfortap.com/manage/account) page.

---

#### public static initializeWithApiKey(String apiKey, TapForTap.InitializationListener listener)

Initializes Tap for Tap with the provided API key and listener.

**Parameters**

  - _apiKey_ - Your Tap for Tap API key. This can be found on your [account](https://tapfortap.com/manage/account) page.
  - _listener_ - A listener for handling the callbacks.

---

#### public static void enableTestMode()

Enables test mode. Test mode causes Tap for Tap to disable spending and earning for your app. 
This is useful for when you are developing your app and want to test with the SDK integrated 
without wasting impressions and clicks for your app. **Don't forget** to disable test mode before 
you release your app to Google Play.

---

#### public static void disableTestMode()

Disables test mode. See [enableTestMode](#public-static-void-enabletestmode) for more details.

---

#### public static void disableTapForTap()

Stops Tap for Tap from being able to download and show ads. This can be useful if you offer a 
paid version of your app that removes ads.

---

#### public static void enableTapForTap()

Allows Tap for Tap to download and show ads. See [disableTapForTap](#public-static-void-disabletapfortap) for more details.

---

#### public static void setYearOfBirth(int yearOfBirth)

Sets the user's year of birth to be passed along when requesting an ad. This helps Tap for Tap to provide
the best ad for this user.

---

#### public static void setGender(TapForTapGender gender)

Sets the user's gender to be passed along when requesting an ad. This helps Tap for Tap to provide
the best ad for this user.

---

#### public static void setLocation(android.location.Location location)

Sets the user's location to be passed along when requesting an ad. This helps Tap for Tap to provide
the best ad for this user.

---

#### public static void setUserAccountId(String userAccountId)

Sets the user's user account ID to be passed along when requesting an ad. This is an ID that you the 
developer can assign to your users. This helps Tap for Tap to provide the best ad for this user.

## Banner

### Overview

This class is responsible for showing banners.

### Special Considerations

Do not use any of the public constructors as doing so may cause crashes. They are only avaible in order to allow
the banners to be decalred inside layout files. Only use the provided constructor methods when instantiating 
a banner programatically.

The banner will stop downloading and showing new ads if the view is not visible or the screen is off.

### Methods

#### public static Banner create(Context context)

Creates a new banner and begins downloading and showing ads.

**Parameters**

  - _context_ - An Android context.

**Return Value**

  - _Banner_ - A new instance of a Banner.

---

#### public static Banner create(Context context, BannerListener bannerListener)

Creates a new banner and begins downloading and showing ads with the provided listener.

**Parameters**

  - _context_ - An Android context.
  - _bannerListener_ - A listener.

**Return Value**

  - _Banner_ - A new instance of a Banner

#### public void setBannerListener(BannerListener bannerListener)

Sets a listener on the banner. This should only be used if the banner is decalared in a layout 
and is retrieved using Android's `findViewBytId(int id)` method. Otherwise use the factory 
method [createAndShow(context, bannerListener)](public-static-Banner-createAndShowContext-context-BannerListener-bannerListener)  

**Parameters**

  - _bannerListener_ - A listener.

---

#### public void startShowingAds()

Causes ads to start being downloaded and shown.

---

#### public void stopShowingAds()

Causes ads to stop being downloaded and shown.

---

#### public void enableAutoRollover()

Causes a new ad to be downloaded and shown aproximately every 60 seconds.

---

#### public void disbleAutoRollover()

Stops a new ad from being downloaded and show approximately every 60 seconds. Only a call to [startShowinAds](public-void-startShowingAds) will cause a new ad to be downloaded and show.

## BannerListener

### Overview

This interface provides callback methods into the current lifecykce of the banner.

### Methods

#### public void bannerOnReceive(Banner banner)

Called when the banner receives a new ad.

**Parameters**

  - _banner_ - The Banner that received a new ad.

---

#### public void bannerOnFail(Banner banner, String reason, Throwable throwable)

Called when the banner fails to download or show a new ad.

**Parameters**

  - _banner_ - The Banner that failed.
  - _reason_ - The reason for the failure.
  - _throwable_ - The exception that caused the failure.

---

#### public void bannerOnTap(Banner banner)

Called when a user taps on a banner.

**Parameters**

  - _banner_ - The Banner that was tapped.
  
## Interstitial

### Overview

This class is responsible for downloading and showing interstitials.

### Special Considerations

Always be sure that an interstitial is ready to be shown by either using the listeners or by using the
isReadyToShow method. Failure to do so may cause an ad to be shown at unexpected or undersireable times 
due to network connectivity.

### Methods

#### public static Interstitial create(Context context)

Creates and starts loading an interstitial.

**Parameters**

  - _context_ - An Android context.

**Return Value**

  - _Interstitial_ - A new instance of Interstitial.

---

#### public static Interstitial create(Context context, final InterstitialListener interstitialListener)

Creates and starts loading an interstitial with the provided listener.

**Parameters**

  - _context_ - An Android context.
  - _listener_ - A listener.

**Return Value**

  - _Interstitial_ - A new instance of Interstitial.

---

#### public void show()

Causes an interstitial ad to be shown. This will launch a new [FullScreenAdActivity]().

---

#### public void showAndLoad()

Causes an interstitial ad to be shown and a new one will start to load. This will launch a new [FullScreenAdActivity]().

---

#### public void load()

Causes a new interstitial to be loaded.

---

#### public boolean isReadyToShow()

Returns whether or not an interstitial is ready to show.

**Return Value**

  - _boolean_ - `true` if an interstitial is ready to show. `false` if an interstitial ad is not ready to show.

## InterstitialListener

### Overview

This interface provides callback methods into the lifecycle of the interstitial ad.

### Methods

#### public void interstitialOnReceive(Interstitial interstitial)

Called when a new ad is received and is ready to be shown.

**Parameters**

  - _interstitial_ - The Interstitial which received a new ad.

---

#### public void interstitialOnFail(Interstitial interstitial, String reason, Throwable throwable)

Called when an interstitial fails to load or show an ad. An explicit call to load is required to get the next ad.

**Parameters**

  - _interstitial_ - The Interstitial that failed to receive or shown an ad.
  - _reason_ - The reason for the failure.
  - _throwable_ - The exception that caused the failure.

---

#### public void interstitialOnShow(Interstitial interstitial)

Called when the interstitial was shown to the user.

**Parameters**

  - _interstitial_ - The Interstitial that showed the ad.

---

#### public void interstitialOnTap(Interstitial interstitial)

Called when the user taps on the interstitial.

**Parameters**

  - _interstitial_ - The Interstitial that the user tapped on.

---

#### public void interstitialOnDismiss(Interstitial interstitial)

Called when the user dismisses the interstitial.

**Parameters**

  - _interstitial_ - The Interstitial that was dismissed.

## AppWall

### Overview

This class is responsible for downloading and showing app walls.

### Special Considerations

Always be sure that an app wall is ready to be shown by either using the callbacks or by using the isReadyToShow method. 
Failure to do so may cause an app wall to be shown at unexpected or undersireable times due to network connectivity.

### Methods

#### public static AppWall create(Context context)

Creates a new instance of AppWall and starts loading an app wall.

**Parameters**

  - _context_ - An Android context.

**Return Value**

  - _AppWall_ - A new instance of AppWall.

---

#### public static AppWall create(Context context, final AppWallListener appWalListener)

Creates a new instance of AppWall and starts loading an app wall with the provided listener.

**Parameters**

  - _context_ - An Android context.
  - _listener_ - A listener.

**Return Value**

  - _AppWall_ - A new instance of AppWall.

---

#### public void show()

Causes an app wall ad to be shown. This will launch a new [FullScreenAdActivity]().

---

#### public void show()

Causes an app wall ad to be shown and new app wall to be loaded. This will launch a new [FullScreenAdActivity]().

---

#### public void load()

Causes a new app wall to be loaded.

---

#### public boolean isReadyToShow()

Returns whether or not an app wall is ready to show.

**Return Value**

  - _boolean_ - `true` if an app wall is ready to show. `false` if an app wall is not ready to show.

## AppWallListener

### Overview

This interface provides callback methods into the lifecycle of the app wall.

### Methods

#### public void appWallOnReceive(AppWall appWall)

Called when an app wall receives a new ad and is ready to be shown.

**Parameters**

  - _appWall_ - The AppWall which received a new ad.

---

#### public void appWallOnFail(AppWall appWall, String reason, Throwable throwable)

Called when an app wall fails to load or show an ad. An explicit call to load is required to get the next ad.

**Parameters**

  - _appWall_ - The AppWall which failed to receive or show an ad.
  - _reason_ - The reason for the failured.
  - _throwable_ - The exception that caused the failure.

---

#### public void appWallOnShow(AppWall appWall)

Called when the app wall is sucessfully shown to the user.

**Parameters**

  - _appWall_ - The AppWall which showed the ad.

---

#### public void appWallOnTap(AppWall appWall)

Called when the user tapped on an ad in the app wall.

**Parameters**

  - _appWall_ - The AppWall which the user tapped on.

---

#### public void appWallOnDismiss(AppWall appWall)

Called when the user dismisses the app wall.

**Parameters**

  - _appWall_ - The AppWall that was dismissed.

