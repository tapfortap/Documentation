# BannerAdListener

**Available In**   3.0.0

**Declared In**    com.tapfortap.BannerAd.BannerAdListener 

**Related Classes** (BannerAd)[banner_ad.md]

**Companion Guide**

**Sample Code**

## Overview

This interface provides callback methods into the current status of the BannerAd.

### Special Considerations

## Tasks

### Life Cycle

[public void bannerAdOnReceive(BannerAd bannerAd)](public-void-bannerAdOnReceiveBannerAd-bannerAd)
[public void bannerAdOnFail(BannerAd bannerAd, String message, Throwable throwable)](public-void-bannerAdOnFailBannerAd-bannerAd-String-message-Throwable-throwable)
[public void bannerAdOnTap(BannerAd bannerAd)](public-void-bannerAdOnTapBannerAd-bannerAd)

## InstanceMethods

### public void bannerAdOnReceive(BannerAd bannerAd)

Called when the BannerAds receives a new ad.

**Parameters**

  - _bannerAd_ - The banner ad which received a new ad.

---

### public void bannerAdOnFail(BannerAd bannerAd, String message, Throwable throwable)

Called when the BannerAd fails to download or show a new ad.

**Parameters**

  - _bannerAd_ - The banner ad which failed
  - _message_ - The summary of the reason for the failure
  - _throwable_ - The exception that caused the failure.

---

###public void bannerAdOnTap(BannerAd bannerAd)

Called when a user taps on an ad.

**Parameters**

  - _bannerAd_ - The banner ad which was tapped.