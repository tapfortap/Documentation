# Android - SDK Implementation #

##  Current Version ##
**3.0.6** - [See Changelog](/doc/android/changelog)

Supports Android 2.2 and up (API level 8)

##  General Information ##

Integrating Tap for Tap into your app is usually really easy. Follow the steps below to get started.

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

Add the following meta data tag to your AndroidManifest.xml, replacing `MY_API_KEY` with your Tap for Tap
API key which can be found on the [account](https://tapfortap.com/manage/account) page

```xml
    <meta-data
        android:name="com.tapfortap.API_KEY"
        android:value="MY_API_KEY"/>
```

## Step 3 - Add Permissions to Your AndroidManifest.xml

Add the following permissions to your AndroidManifest.xml

```xml
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.READ_PHONE_STATE" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```

### Why TapForTap Requires the Permissions It Does

- _INTERNET_: Required to download ads.
- _READ_PHONE_STATE_: Required to do conversion tracking and work with monetization partners.
- _ACCESS_NETWORK_STATE_: Required to check network status in order to help the SDK be smarter about network requests.
- _ACCESS_WIFI_STATE_: Required to check network status in order to help the SDK be smarter about network
requests and to help with conversion tracking.
- _WRITE_EXTERNAL_STORAGE_: Required to cache ads locally on the phone. This greatly improves
performance and reduces network traffic and radio usage. TapForTap is capped at 10MB of disk space.

## Step 4 - Add the FullScreenAdActivity to Your AndroidManifest.xml

Add the following activity to your AndroidManifest.xml. This enables showing full screen ads.

```xml
    <activity android:name="com.tapfortap.FullScreenAdActivity" android:theme="@android:style/Theme.Translucent.NoTitleBar"/>
```

If your app hides the status bar add `.FullScreen` to the end.

```xml
    <activity android:name="com.tapfortap.FullScreenAdActivity" android:theme="@android:style/Theme.Translucent.NoTitleBar.FullScreen"/>
```

## Step 5 - Enable Test Mode

Test mode stops your app from spending real impressions. This is useful while you are developing your app.
Make sure to disable test mode before submitting your app to the play store.

To enable test mode add the following meta data tag to your AndroidManifest.xml.

```xml
    <meta-data
        android:name="com.tapfortap.TEST_MODE"
        android:value="true"/>
```

## Step 6 - Display Ads
Adding a banner to a `RelativeLayout`

```xml
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <com.tapfortap.Banner
        android:id="@+id/banner"
        android:layout_width="320dip"
        android:layout_height="50dip"
        android:layout_alignParentTop="true"
        android:layout_centerHorizontal="true"
    />
</RelativeLayout>
```

## Step 7 - Send Optional Information About Your Users
If you have information about your users that your privacy policy allows you to share with us,
you can improve performance and revenue by passing it along. Just set the info on `com.tapfortap.TapForTap`.
We accept year of birth, gender, location, and the account ID of user's on your system.

```java
TapForTap.setGender(<MALE or FEMALE>);
TapForTap.setYearOfBirth(<year>);
TapForTap.setLocation(<location>);
TapForTap.setUserAccountId(<accountId>);
```
Where gender is `either` `MALE` or `FEMALE`, `age` is a positive integer, `location` is an `android.location.Location` object, and user `account ID`s are strings.

**Note:** If you are using Tap for Tap's [monetization](/doc/monetization) program passing this information can greatly increase your revenue.
