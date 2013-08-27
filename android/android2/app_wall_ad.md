# App Wall Ad

**Name** AppWallAd

**Available Starting In**   3.0.0

**Declared In**    com.TapForTap.AppWallAd

**Related Classes**  [AppWallAd.AppWallAdListener](app_wall_ad_listener.md)

**Companion Guide** 

**Sample Code**      

## Overview

This class is responsible for downloading and showing appWall ads.

### Special Considerations

Always be sure that an appWall is ready to be shown by either using the callbacks or by using the isReadyToShow method. Failure to do so may cause and ad to be shown at unexpected or undersireable times due to network connectivity.

## Tasks

### Creation
[public static AppWallAd createAndLoad(Context context)](public-static-AppWallAd-createAndLoad-Context-context)
[public static AppWallAd createAndLoad(Context context, final AppWallAdListener appWallAdListener)](public-static-AppWallAd-createAndLoadContext-context-final-AppWallAdListener-appWallAdListener)

### Life Cycle
[public void show()](public-void-show)
[public void load()](public-void-load)
[public boolean isReadyToShow()](public-boolean-isReadyToShow)

## Class Methods
### public static AppWallAd createAndLoad(Context context)

Creates and starts loading an appWall

**Parameters**

  - _context_ - An Android context.

**Return Value**

  - _AppWallAd_ - A new instance of AppWallAd.

---

### public static AppWallAd createAndLoad(Context context, final AppWallAdListener appWallAdListener)

Creates and starts loading an appWall with the provided listener.

**Parameters**

  - _context_ - An Android context.
  - listener_ - A listener.

**Return Value**

  - _AppWallAd_ - A new instance of AppWallAd.

---

## Instance Methods
### public void show()

Causes an appWall ad to be shown, a new appWall to be loaded. This will launch a new [FullScreenAdActivity]()

---

### public void load()

Causes a new appWall to be loaded.

---

### public boolean isReadyToShow()

Returns whether or not an appWall is ready to show.

**Return Value**

  - _boolean_ - `true` if an appWall is ready to show. `false` if an appWall ad is not ready to show.

