# Tap for Tap PhoneGap Plugins

Want to use Tap for Tap with PhoneGap? We got you covered on Android and iOS.

##  Installation
If you don't have the plugins yet then [download it here](https://github.com/tapfortap/PhoneGap/raw/master/TapForTap-PhoneGap.zip).

Installing the Tap for Tap plugin is super easy. We'll guide you through it.
This isn't a PhoneGap tutorial so we assume that you have a PhoneGap project
(or projects) already set up and working.

### Android
1. Download the [PhoneGap SDK](https://github.com/tapfortap/PhoneGap/raw/master/TapForTap-PhoneGap.zip) and peek inside the `Android` folder and put
`TapForTapPhoneGapPlugin.jar` in your project's `libs` folder, alongside `cordova-2.x.x.jar`.

2. Add the following permissions to `AndroidManifest.xml`

```xml
  <uses-permission android:name="android.permission.INTERNET" />
  <uses-permission android:name="android.permission.READ_PHONE_STATE" />
  <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
  <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
  <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```

3. Add the following activiry to `AndroidManifest.xml`

```xml
  <activity android:name="com.tapfortap.TapForTapActivity"/>
```

4. Put `tapfortap.js` in the `assets/www` folder alongside `cordova-2.x.x.js`.

5. Open `res/xml/plugins.xml` and add this line:

```xml
<plugin name="TapForTap" value="com.tapfortap.phonegap.TapForTapPhoneGapPlugin"/>
```

That's it! Unless you're integrating Tap for Tap into an iOS app as well you
can skip down to **Usage**.

### iOS
1. Download the [PhoneGap SDK](https://github.com/tapfortap/PhoneGap/raw/master/TapForTap-PhoneGap.zip) and look inside the iOS folder and add `TapForTapPhoneGapPlugin.h` and `TapForTapPhoneGapPlugin.m` to your
project in the `Plugins` folder provided by PhoneGap.

3. Put `tapfortap.js` in the `www` folder, alongside `cordova-2.x.x.js`.

4. To register the TapForTap Plugin with PhoneGap
    1. PhoneGap 2.0  
        Under `Supporting Files` open `Cordova.plist`. In the `Plugins` dictionary
        ad the key `TapForTap` with value `TapForTapPhoneGapPlugin`. In the
        `ExternalHosts` array add a '*'. This allows TapForTap to talk to our servers and fetch ads from our CDN.
    2. PhoneGap 2.3  
        Open up config.xml and add the following line under the `<plugins>` tag

        ```xml
        <plugin name="TapForTap" value="TapForTapPhoneGapPlugin"/>
        ```

        And the following line under the `<cordova>` tag

        ```xml
        <access origin=".*"/>
        ```

That's it! Now you're ready to use Tap for Tap in your app.

##  Usage
First up include the Tap for Tap JavaScript module, this goes directly after
the similar line that includes `phonegap/cordova-2.x.x.js`:

```html
<script type="text/javascript" charset="utf-8" src="tapfortap.js"></script>
```

Second, and lastly, create an ad view and tell it to load ads, like so:

```javascript
document.addEventListener('deviceready', function() {

  var apiKey = '<YOUR API KEY>';
  TapForTap.initializeWithAPIKey(apiKey);
  TapForTap.createAdView({}, function() {
    TapForTap.loadAds(function() {
      // successfully loaded ads
    }, function(e) {
      console.error('error loading ads: ', e);
    });
  }, function(e) {
    console.error('error creating ad view: ', e);
  });

}, false);
```

Congratulations, you are done. We said it was easy!

##  API Documentation
The JavaScript API lets you create, position, and remove Tap for Tap ad views. You
can also pass in optional info about your users to help us with targetting. Please
make sure your privacy policy allows this before giving us their personal information.

#### initializeWithApiKey(apiKey)
This method needs to be called before you can use any of the other API calls.
This method initializes your app with the TapForTap so we can begin serving
you ads.

Usage:

```javascript
// Initialze with TapForTap with my API key
var apiKey = 'My API key from my TapForTap account';
TapForTap.initializeWithApiKey(apiKey);
```

#### createAdView([options])
Create and display an ad view.

The options object itself is optional, and supports these optional properties:

  * **x**: the x coordinate of the origin of the ad (only supported on iOS)
  * **y**: the y coordinate of the origin of the ad (only supported on iOS)
  * **gender**: the user's gender, `'male'` or `'female'`
  * **age**: an integer specifying the user's age
  * **location**: an object with `latitude` and `longitude` properties

Usage:

```javascript
// Create an ad with no options
TapForTap.createAdView();

// Create an ad at the top of the screen (only supported on iOS)
TapForTap.createAdView({ y: 0 });

// Pass in optional info about the user
TapForTap.createAdView({
  gender: 'female',
  age: 21,
  location: { latitude: '123.4567890', longitude: '45.67890' }
});
```

#### loadAds()
Loads and displays Tap for Tap ads. Call this once after creating the ad view.

Usage:

```javascript
// Display the ad view and start loading ads
TapForTap.loadAds();
```

#### moveAdView([options])
This animates the ad view to a new location on screen. `options` is optional
and can contain the following properties:

  * **x**: the x coordinate of the origin of the ad (only supported on iOS)
  * **y**: the y coordinate of the origin of the ad (only supported on iOS)

Usage:

```javascript
// Move the ad to the top of the screen (only supported on iOS)
TapForTap.moveAdView({ y: 0 });
```

#### removeAdView()
Removes the ad view from the screen and stops loading ads.

Usage:

```javascript
// Remove the ad view and stop loading ads
TapForTap.removeAdView();
```

#### prepareInterstitial()
This prepares the interstitial ad type. This method will pre-fetch an interstitial so when
showInterstitial() is called, the interstitial is shown with no delay. This is only useful for preparing
the very first interstitial. showInterstitial() automatically prepares the next interstitial.

Usage:

```javascript
// Prepare the insterstial ad type
TapForTap.prepareInsterstitial();
```

#### showInterstitial()
This shows an interstitial ad. Calling showing automatically prepares the next interstital, so you do not need to call prepare again.

Usage:

```javascript
// prepare the interstitial ad type
TapForTap.prepareInterstitial();

// show an interstitial ad
TapForTap.showInterstitial();

// do some neat app stuff
  .
  .
  .

// show another interstital add (Note that we do not need to call
// prepareInterstitial() again)
TapForTap.showInterstital();
```

#### prepareAppWall()
This prepares the app wall ad type. This method will pre-fetch an app wall so when
showAppWall() is called, the app wall is shown with no delay. This is only useful for preparing
the very first app wall. showAppWall() automatically prepares the next app wall.

Usage:

```javascript
// Prepare the app wall ad type
TapForTap.prepareAppWall();
```

#### showAppWall()
This shows an app wall ad. Calling showing automatically prepares the next app wall, so you do not need to call prepare again.

Usage:

```javascript
// prepare the app wall ad type
TapForTap.prepareAppWall();

// show an interstitial ad
TapForTap.showAppWall();

// do some different neat app stuff
  .
  .
  .

// show another app wall add (Note that we do not need to call
// prepareAppWall() again)
TapForTap.showwAppWall();
```
