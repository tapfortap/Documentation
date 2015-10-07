# AppWall Ad Listener

**Name** TapForTapAppWallAdListener

**Available In**   3.0.0

**Declared In**    TapForTapAppWallAd.h

**Related Classes**  [AppWallAd](appWall_ad.md)

**Companion Guide** 

**Sample Code**     

## Overview

This interface provides callback methods into the lifecycle of the appWall ad.

### Special Considerations

## Tasks

### Life Cycle
[public void appWallAdOnReceive(AppWallAd ad)](public-void-appWallAdOnReceiveAppWallAd-ad)
[public void appWallAdOnFail(AppWallAd ad, String message, Throwable throwable)](public-void-appWallAdOnFailAppWallAd-ad-String message-Throwable-throwable)
[public void appWallAdOnShow(AppWallAd ad)](public-void-appWallAdOnShowAppWallAd-ad)
[public void appWallAdOnTap(AppWallAd ad)](public-void-appWallAdOnTapAppWallAd-ad)
[public void appWallAdOnDismiss(AppWallAd ad)](public-void-appWallAdOnDismissAppWallAd-ad)

## Instance Methods

### public void appWallAdOnReceive(AppWallAd ad)

Called when a new ad is received and is ready to be shown.

**Parameters**

  - _ad_ - The AppWallAd which received a new ad.

---

### public void appWallAdOnFail(AppWallAd ad, String message, Throwable throwable)

Called when an ad fails to load. An explicit call to load is required to get the next ad.

**Parameters**

  - _ad_ - The AppWallAd which received a new ad.
  - _message_ - A summary of the error.
  - _throwable_ - The exception that caused the error.

---

### public void appWallAdOnShow(AppWallAd ad)

The appWall ad was shown to the user.

**Parameters**

  - _ad_ - The AppWallAd which received a new ad.

---

### public void appWallAdOnTap(AppWallAd ad)

The user tapped on the appWall ad.

The user dismissed the appWall ad.

**Parameters**

  - _ad_ - The AppWallAd which received a new ad.

---

### public void appWallAdOnDismiss(AppWallAd ad)
