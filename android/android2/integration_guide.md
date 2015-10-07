# Integration Guide

## Step 1 - Add TapForTap.jar to Your Project

## Step 2 - Add Your API Key to Your AndroidManifest.xml
Add the following meta data tag to your AndroidManifest.xml
```xml
    <meta-data
        android:name="com.tapfortap.API_KEY"
        android:value="MY_API_KEY"/>
```

For example
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
          package="com.tapfortap.app">
    .
    .
    .

    <application
        android:label="@string/app_name"
        android:icon="@drawable/icon">
    .
    .
    .
        <meta-data
            android:name="com.tapfortap.API_KEY"
            android:value="MY_API_KEY"/>
    </application>
</manifest>
```

## Step 3 - Add Permissions to Your AndroidManifest.xml

```xml
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.READ_PHONE_STATE" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```
 
For example
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
          package="com.tapfortap.app">
    .
    .
    .

    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.READ_PHONE_STATE" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />

    <application
        android:label="@string/app_name"
        android:icon="@drawable/icon">
    .
    .
    .
    </application>
</manifest>
```

#### Why TapForTap Requires the Permissions it does

INTERNET: Required to download ads.
READ\_PHONE\_STATE: Required to do conversion tracking and work with monetization partners
ACCESS\_NETWORK\_STATE: Required to check network status in order to help the SDK be smarter about network requests
ACCESS\_WIFI\_STATE: Required to check network status in order to help the SDK be smarter about network requests and to help with conversion tracking.
WRITE\_EXTERNAL\_STORAGE: Required to cache ads locally on the phone. This greatly improves performance and reduces network traffic and radio usage (which mostly in increasing battery life). TapForTap is capped at 10MB of disk space.

## Step 4 - Enable Test Mode
Test mode stops your app from consuming real impressions. This is useful while you are developing your app. Make sure to disable test mode before submitting your app to the play store. 

To enable test mode add the following meta data tag to your AndroidManifest.xml. 
```xml
    <meta-data
        android:name="com.tapfortap.TEST_MODE"
        android:value="true"/>
```

For example
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
          package="com.tapfortap.app">
    .
    .
    .

    <application
        android:label="@string/app_name"
        android:icon="@drawable/icon">
    .
    .
    .
        <meta-data
            android:name="com.tapfortap.TEST_MODE"
            android:value="true"/>
    </application>
</manifest>
```

## Step 5 - Display Ads

### Step 5a - Display a Banner
To display a banner ad, add a `com.tapfortap.bannerAd` to a layout.

For example, adding a banner Ad to a `RelativeLayout.xml` 

```xml
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <com.tapfortap.BannerAd
        android:id="@+id/banner_ad"
        android:layout_width="320dip"
        android:layout_height="50dip"
        android:layout_alignParentTop="true"
        android:layout_centerHorizontal="true"
    />
</RelativeLayout>

```

### Step 5b - Display an Interstitial
1. Create an interstitial.
2. Show it

```java
    Interstitial interstitial = Interstitial.createAndLoadAppWall();
    Interstitial.show();
```
### Step 5c - Display an App-Wall
1. Create an App-Wall.
2. Show it
```java
    AppWallAd appWallAd = AppWallAd.createAndLoadAppWall();
    appWallAd.show();
```

## Step 6 - Send Optional Information About Your Users