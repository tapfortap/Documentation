# Android - SDK Implementation #

##  Current Version ##
**3.0.0** - [See Changelog](/doc/AndroidChangelog)

Supports Android 2.2 and up (API level 8)

##  General Information ##

Integrating Tap for Tap into your app is usually really easy. Add our library, `TapForTap.jar`, to your Android project, call `TapForTap.initialize()` when your app starts, and then add a `com.tapfortap.AdView` to your layout or display an interstitial or app wall (if you are showing ads in that app). That's it!

If you are not displaying Tap for Tap ads then you only need to follow steps 1 - 3. Call `TapForTap.initialize(Activity, "YOUR API KEY")` once when your app starts up, in the `onCreate` method of your main activity.

# Instructions #

##  Step 1 - Add TapForTap.jar to your project ##

If your project doesn't have a libs folder create one and copy TapForTap.jar into it.

##  Step 1 using Eclipse ##

In Eclipse, right-click on your project in the Package Explorer then click `Properties`.

![](https://raw.github.com/tapfortap/Documentation/master/images/eclipse-01.png)

In the properties window click `Java Build Path` on the left then click `Add JARs...` on the right.

![](https://raw.github.com/tapfortap/Documentation/master/images/eclipse-02.png)

Navigate to the `TapForTap.jar` file you copied into your project earlier then click `OK`.

![](https://raw.github.com/tapfortap/Documentation/master/images/eclipse-03.png)

Make sure that the checkbox to export the library is checked on the `Order and Export` tab

![](https://raw.github.com/tapfortap/Documentation/master/images/eclipse-04.png)

Click `OK` to leave the properties window.


##  Step 1 using IntelliJ IDEA ##

In IDEA open your Project Structure via the File menu, File ? Project Structure.

![](https://raw.github.com/tapfortap/Documentation/master/images/idea-01.png)

Select `Libraries` under `Project Settings` on the left. Add a new Java library by clicking the plus icon up top, selecting Java, and then selecting `TapForTap.jar` in your `lib` or `libs` folder.

![](https://raw.github.com/tapfortap/Documentation/master/images/idea-02.png)

![](https://raw.github.com/tapfortap/Documentation/master/images/idea-03.png)

IDEA will ask you to select which module to add it to and in most cases you can click OK to add it to the module selected by default.

![](https://raw.github.com/tapfortap/Documentation/master/images/idea-04.png)

Then click `OK` to leave the properties window.

![](https://raw.github.com/tapfortap/Documentation/master/images/idea-05.png)


## Step 2 - Add Your API Key to Your AndroidManifest.xml
Add the following meta data tag to your AndroidManifest.xml, replacing `MY\_API_KEY` with your Tap for Tap 
API key which can be found on the [account](https://tapfortap.com/manage/account) page
```xml
    <meta-data
        android:name="com.tapfortap.API_KEY"
        android:value="MY_API_KEY"/>
```

## Step 3 - Add Permissions to Your AndroidManifest.xml

```xml
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.READ_PHONE_STATE" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```

### Why TapForTap Requires the Permissions it does

- _INTERNET_: Required to download ads.
- _READ\_PHONE\_STATE_: Required to do conversion tracking and work with monetization partners
- _ACCESS\_NETWORK\_STATE_: Required to check network status in order to help the SDK be smarter about network requests
- _ACCESS\_WIFI\_STATE_: Required to check network status in order to help the SDK be smarter about network 
requests and to help with conversion tracking.
- _WRITE\_EXTERNAL\_STORAGE_: Required to cache ads locally on the phone. This greatly improves 
performance and reduces network traffic and radio usage (which mostly in increasing battery life). 
TapForTap is capped at 10MB of disk space.

## Step 4 - Enable Test Mode
Test mode stops your app from consuming real impressions. This is useful while you are developing your app. Make sure to disable test mode before submitting your app to the play store. 

To enable test mode add the following meta data tag to your AndroidManifest.xml. 
```xml
    <meta-data
        android:name="com.tapfortap.TEST_MODE"
        android:value="true"/>
```

## Step 5 - Display Ads
Adding a banner Ad to a `RelativeLayout` 

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

## Step 6 - Send Optional Information About Your Users
If you have information about your users that your privacy policy allows you to share with us, 
you can improve performance and revenue by passing it along. Just set the info on `com.tapfortap.TapForTap`. 
We accept year of birth, gender, location, and the account ID of user's on your system.

```java
TapForTap.setGender(<MALE or FEMALE>);
TapForTap.setYearOfBirth(<year>);
TapForTap.setLocation(<location>);
TapForTap.setUserAccountId(<accountId>);
```

## API Documentation

### Interstitial ###

Inside an activity simply use the `Interstitial` class like this:

```java
// In onCreate
Interstitial.prepare(this);

// Later when you want to display the interstitial
Interstitial.show(this);
```

You only have to prepare it the first time on startup, each time it is shown the next one is automatically prepared for you

### App Wall ###

Inside an activity simply use the `AppWall` class like this:

```java
// In onCreate
AppWall.prepare(this);

// Later when you want to display the app wall
AppWall.show(this);
```

You only have to prepare it the first time on startup, each time it is shown the next one is automatically prepared for you.

Congratulations! You should now be up and running. Run the app and then [Login](http://tapfortap.com/login) to check to make sure that it worked.

##  Step 5 - Send info about your users (optional). ##

If you have information about your users that your privacy policy allows you to share with us, you can improve performance and revenue by passing it along. Just set the info on `com.tapfortap.TapForTap`. We accept year of birth, gender, location, and the account ID of user's on your system.

```java
TapForTap.setGender(<MALE or FEMALE>);
TapForTap.setYearOfBirth(<year>);
TapForTap.setLocation(<location>);
TapForTap.setUserAccountId(<accountId>);
```

Where gender is `either` `MALE` or `FEMALE`, `age` is a positive integer, `location` is an `android.location.Location` object, and user `account ID`s are strings.

**Note:** If you are using Tap for Tap's [monetization](/doc/Monetization) program passing this information can greatly increase your revenue.

# Example Code #

Some example code is included to help get you started. Take a look in the example folder to see exactly how it's done.