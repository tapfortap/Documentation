# Android 2.x -> 3.x Migration Guide

## Class Name Changes
AdView -> Banner

## Initialization

There is a new way to initialize your app with TapForTap. Simply add the following meta-data tag to your 
AndroidManifest.xml, replacing `MY_API_KEY` with your account's API key. There is no need to explicitly call
initialize anymore, the SDK will handle that itself the first time you request an ad.

```xml
<meta-data
    android:name="com.tapfortap.API_KEY"
    android:value="MY_API_KEY"/>
```

If you do not want to add your API key to your AndroidManifest.xml you can still call

```java
TapForTap.initialize(String apiKey)
```

Please update your permissions to ensure that these are all included:

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.READ_PHONE_STATE" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```

## Banner

The AdView class has been changed to Banner to better reflect what the class is. A Banner can still be
declared in a layout file using `com.tapfortap.Banner'. The listener is now called BannerListener and has similar
callbacks but they have been renamed.

```java
public static interface BannerListener {
    public void bannerOnReceive(Banner banner);
    public void bannerOnFail(Banner banner, String reason, Throwable throwable);
    public void bannerOnTap(Banner banner);
}
```

## Interstitial/AppWall (ie FullScreenAds)

FullScreen ads are no longer interacted with using static methods. You must get a new full screen ad instance by
using their respective factory methods. These methods will create an instance a load an ad.

```java
public static Interstitial create(Context context)
public static Interstitial create(Context context, final InterstitialListener interstitialListener)

public static AppWall create(Context context)
public static AppWall create(Context context, final AppWallListener appWallListener)
```

The listeners have the same callbacks as in 2.x but with more consistent naming and an onTap was added.

```java
public static interface InterstitialListener {
    public void interstitialOnReceive(Interstitial interstitial);
    public void interstitialOnFail(Interstitial interstitial, String reason, Throwable throwable);
    public void interstitialOnShow(Interstitial interstitial);
    public void interstitialOnTap(Interstitial interstitial);
    public void interstitialOnDismiss(Interstitial interstitial);
}

public static interface AppWallListener {
    public void appWallOnReceive(AppWall appWall);
    public void appWallOnFail(AppWall appWall, String reason, Throwable throwable);
    public void appWallOnShow(AppWall appWall);
    public void appWallOnTap(AppWall appWall);
    public void appWallOnDismiss(AppWall appWall);
}
```

FullScreenAds are shown by calling either `show()` or `showAndLoad` (this behaves like the old 2.x show) and ads can be
loaded using `load()`
