# Interstitial Ad Listener

**Name** InterstitialAdListener

**Available In**   3.0.0

**Declared In**    com.tapfortap.InterstitialAd.InterstitialAdListener 

**Related Classes**  [InterstitialAd](interstitial_ad.md)

**Companion Guide** 

**Sample Code**     

## Overview

This interface provides callback methods into the lifecycle of the interstitial ad.

### Special Considerations

## Tasks

### Life Cycle
[public void interstitialAdOnReceive(InterstitialAd ad)](public-void-interstitialAdOnReceiveInterstitialAd-ad)
[public void interstitialAdOnFail(InterstitialAd ad, String message, Throwable throwable)](public-void-interstitialAdOnFailInterstitialAd-ad-String message-Throwable-throwable)
[public void interstitialAdOnShow(InterstitialAd ad)](public-void-interstitialAdOnShowInterstitialAd-ad)
[public void interstitialAdOnTap(InterstitialAd ad)](public-void-interstitialAdOnTapInterstitialAd-ad)
[public void interstitialAdOnDismiss(InterstitialAd ad)](public-void-interstitialAdOnDismissInterstitialAd-ad)

## Instance Methods

### public void interstitialAdOnReceive(InterstitialAd ad)

Called when a new ad is received and is ready to be shown.

**Parameters**

  - _ad_ - The InterstitialAd which received a new ad.

---

### public void interstitialAdOnFail(InterstitialAd ad, String message, Throwable throwable)

Called when an ad fails to load. An explicit call to load is required to get the next ad.

**Parameters**

  - _ad_ - The InterstitialAd which received a new ad.

---

### public void interstitialAdOnShow(InterstitialAd ad)

The interstitial ad was shown to the user.

**Parameters**

  - _ad_ - The InterstitialAd which received a new ad.

---

### public void interstitialAdOnTap(InterstitialAd ad)

The user tapped on the interstitial ad.

The user dismissed the interstitial ad.

**Parameters**

  - _ad_ - The InterstitialAd which received a new ad.

---

### public void interstitialAdOnDismiss(InterstitialAd ad)
