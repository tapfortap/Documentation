# Quick Integration Guide

This guide will has the basic steps required to get TapForTap working in your app. It assumes you are very familiar with Android development. For a more indepth intructions see (Integration Guide)[integration_guide.markdown]

1. Add `TapForTap.jar` to your `libs` folder.
2. Add your API key to your `AndroidManifest.xml`

```xml
    <meta-data
        android:name="com.tapfortap.API_KEY"
        android:value="MY_API_KEY"/>
```

3. Add the following permissions your `AndroidManifest.xml`

```xml
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.READ_PHONE_STATE" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```

4. Add the following Activity to your `AndroidManifest.xml`

```xml
    <activity android:name="com.tapfortap.FullScreenAdActivity"/>
```

5. Add a `com.tapfortap.BannerAd` to a layout.

6. Add optional data about your user using the APIs found in the (TapForTap)[TapForTap.md] class.

6. Optionally enable _test mode_ in your `AndroidManifest.xml` ( **Don't** forget to set it to **false** before you release your app to the play store.)

```xml
    <meta-data
        android:name="com.tapfortap.TEST_MODE"
        android:value="true"/>
```