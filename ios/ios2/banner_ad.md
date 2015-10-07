# Banner Ad

**Name**            TapForTapBannerAd

**Available In**    3.0.0

**Declared In**     TapForTapBannerAd.h

**Related Classes** [android.widget.viewFlipper](http://developer.android.com/reference/android/widget/ViewFlipper.html), (bannerAdListener)(banner_ad_listener.md)

**Companion Guide**

**Sample Code**     

## Overview

This class is responsible gfor showing banner ads.

### Special Considerations

Do not use any of the public constructors. They are only avaible in order to allow the View to be decalred inside layout files. Only use the probided constructor methods when instantiating a bannerAd programatically.

The BannerAd will stop downloading and showing new ads if the view is not visible or the screen is off.

## Tasks

### Creation
[public static BannerAd createAndShow(Context context)](public-static-BannerAd-createAndShowContext-context)  
[public static BannerAd createAndShow(Context context, BannerAdListener bannerAdListener)](public-static-BannerAd-createAndShowContext-context-BannerAdListener-bannerAdListener)  
[public void setBannerAdListener(BannerAdListener bannerAdListener)](public-void-setBannerAdListener-BannerAdListener-bannerAdListener)  

### Life Cycle Management
[public void startShowingAds()](public-void-startShowingAds)  
[public void stopShowingAds()](public-void-stopShowingAds)  

### Configuration
[public void enableAutoRollover()](public-void-enableAutoRollover)  
[public void disbleAutoRollover()](public-void-disbleAutoRollover)  

## Class Methods

### public static BannerAd createAndShow(Context context)

Creates a new BannerAd and begins downloading and showing ads.

**Parameters**

  - _context_ - An Android context (application context is acceptable)

**Return Value**

  - _BannerAd_ - a new instance of a BannerAd

---

### public static BannerAd createAndShow(Context context, BannerAdListener bannerAdListener)

Creates a new BannerAd and begins downloading and showing ads.

**Parameters**

  - _context_ - An Android context (application context is acceptable)
  - _bannerAdListener_ - A listener

**Return Value**

  - _BannerAd_ - a new instance of a BannerAd

## Instance Method

### public void setBannerAdListener(BannerAdListener bannerAdListener)

Sets a listener on the BannerAds. This should only be used if the BannerAd is decalared in a layout it is retrieved using Android's `findViewBytId(int id)` method. Otherwise use the factory methods [createAndShow(context, bannerAdListener)](public-static-BannerAd-createAndShowContext-context-BannerAdListener-bannerAdListener)  

**Parameters**

  - _bannerAdListener_ - An listener

---

### public void startShowingAds()

Causes ads to begin being downloaded and shown.

---

### public void stopShowingAds()

Causes ads to stop being downloaded and shown.

---

#### public void enableAutoRollover()

Causes a new ad to be downloaded and shown aproximately every 60 seconds.

---

#### public void disbleAutoRollover()

Stops ads a new ad from being downloaded and show approximately every 60 seconds. Only a call to [startShowinAds](public-void-startShowingAds) will cause a new ad to be downloaded and show.
