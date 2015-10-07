# Interstitial Ad

**Name** InterstitialAd

**Available Starting In**   3.0.0

**Declared In**    com.TapForTap.InterstitialAd

**Related Classes**  [InterstitialAd.InterstitialAdListener](interstitial_ad_listener.md)

**Companion Guide** 

**Sample Code**      

## Overview

This class is responsible for downloading and showing interstitial ads.

### Special Considerations

Always be sure that an interstitial is ready to be shown by either using the callbacks or by using the isReadyToShow method. Failure to do so may cause an ad to be shown at unexpected or undersireable times due to network connectivity.

## Tasks

### Creation
[public static InterstitialAd createAndLoad(Context context)](public-static-InterstitialAd-createAndLoad-Context-context)
[public static InterstitialAd createAndLoad(Context context, final InterstitialAdListener interstitialAdListener)](public-static-InterstitialAd-createAndLoadContext-context-final-InterstitialAdListener-interstitialAdListener)

### Life Cycle
[public void show()](public-void-show)
[public void load()](public-void-load)
[public boolean isReadyToShow()](public-boolean-isReadyToShow)

## Class Methods
### public static InterstitialAd createAndLoad(Context context)

Creates and starts loading an interstitial

**Parameters**

  - _context_ - An Android context.

**Return Value**

  - _InterstitialAd_ - A new instance of InterstitialAd.

---

### public static InterstitialAd createAndLoad(Context context, final InterstitialAdListener interstitialAdListener)

Creates and starts loading an interstitial with the provided listener.

**Parameters**

  - _context_ - An Android context.
  - listener_ - A listener.

**Return Value**

  - _InterstitialAd_ - A new instance of InterstitialAd.

---

## Instance Methods
### public void show()

Causes an interstitial ad to be shown, a new interstitial to be loaded. This will launch a new [FullScreenAdActivity]()

---

### public void load()

Causes a new interstitial to be loaded.

---

### public boolean isReadyToShow()

Returns whether or not an interstitial is ready to show.

**Return Value**

  - _boolean_ - `true` if an interstitial is ready to show. `false` if an interstitial ad is not ready to show.

