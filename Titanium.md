# Tap for Tap Titanium Module

Want to use Tap for Tap with Titanium? We got you covered on both Android and iOS.

## Preamble
The Titanium Module was build and tested against Titanium 3.0.0GA. If you don't have plugin yet then [download it here](https://github.com/tapfortap/Titanium/raw/master/release/TapForTap-Titanium-1.0.0.zip).

### Minimum Requirements

#### Android
- 2.1.0 and up

#### iPhone
- And OSX machine running at least Lion (10.7)
- iOS 6.0 SDK

## Integration
Install the Tap for Tap module as you would [install](http://docs.appcelerator.com/titanium/latest/#!/guide/Using_a_Module) any other Titanium module.

## API Documentation
The JavaScript API lets you create, place Tap for Tap adViews, show interstitials and show various optional information about your users to help with targetting. Please make sure your privacy policy allows this
before providing any personal information.

### Tap for Tap API

#### Creating the Tap for Tap module
The main Tap for Tap module is held in com.tapfortap.ti. All proxy clases are made from an instance of the module.

Usage:

```js
// Create the Tap for Tap module
var tftModule = require('com.tapfortap.ti');
```

#### The TapForTap proxy
The TapForTap proxy contains the Tap for Tap methos initialization and for providing additional information about your users.

Usage
```js
// Get a reference to the TapForTap proxy
var tft = tftModule.createTapForTap();
```

##### initializeWithApiKey(String apiKey)
Tap for Tap must be initialized before any other calls into Tap for Tap can be made. The only argument is your API key which can be found in your account.

Usage:
// Initialize Tap for Tap
tft.initializeWithApiKey("YOUR API KEY");

#### setYearOfBirth(int yearOfBirth)
Sets the user's year of birth. This is sent along with
ad requests and helps with matching.

Usage:

```js
  // Set the birth year to 1990
  tft.setYearOfBirth(1990);
```

#### setGender(int gender)
Sets the gender of the user. This is sent along with ad requests and helps with matching.
MALE = 0
FEMALE = 1;
NONE = -1;

Usage:

```js
  // Set the Gender to male
  tft.setGender(0);
```

#### setLocation(double latitude, double longitude)
Sets the user's location This is sent along with ad requests.

- **latitide** The latitude of the user
- **longitude** The longitude of the user

Usage:

```js
  // Set the location (Around Brentwood Bay Vancouver Island)
  tft.setLocation(48.571155273059546, -123.45268249511719);
```

#### setUserAccountId(String userAccountId)
Sets a custom account id that you can use for your app. This is sent along with
ad requests and helps with matching.

Usage:

```js
  tft.setUserAccountId("My custom user account ID that I use");
```

#### The AdView Proxy
The AdView proxy allows you to create and place Tap for Tap adViews.

Usage:

```js
// Create an AdView that is 320x50 at position 0,0
tftModule.createAdView( {
	width: 320,
	height: 50.
	top: 0,
	left: 0
}
```

##### AdView Events

The AdView sends three events

- receive
  - When an ad has been downloaded
- tap
  - When an ad has been tapped
- error
  - When an ad failed to download

Usage:

```js
// Subscribe to the Tap for Tap AdView events
adView.addEventListener("tap", function(d) {
	Ti.API.info("Banner was tapped");
});

adView.addEventListener("receive", function(d) {
	Ti.API.info("Banner was received");
});

adView.addEventListener("error", function(d) {
	Ti.API.info("Failed to receive banner because ", JSON.stringify(d, null, 2));
});
```

#### The Interstitial Proxy
The Interstital proxy allows you to show interstitial ads.

Usage:

```js
// Create an interstial proxy
var tftInterstitial = tftModule.createInterstitial();
```

##### prepare
Prepare an interstital ad by prefetching the ad. This method only needs to be called once.
After the interstitial is shown we automatically prepare another one.

Usage:

```js
// Prepare an interstitial ad
tftInterstitial.prepare();
```

##### show
Shows an interstitial ad.

Usage:

```js
// Show an interstitial ad
tftinterstitial.show();
```

##### Interstitial Events
The interstital supports one event called 'dismiss'. This event is fired when the interstitial ad is closed.

Usage:

```js
// Subscibe the the dismiss event
tftInterstitial.addEventListener("dismiss", function(d) {
	Ti.API.info("Interstitial dismissed");
});
```

#### The AppWall Proxy

The AppWall proxy allows you to show app wall ads. 

Usage:

```js
// Create an app wall proxy
var tftAppWall = tftModule.createAppWall();
```

##### prepare
Prepare an app wall ad by prefetching the ad. This method only needs to be called once.
After the app wall is shown we automatically prepare another one.

Usage:

```js
// Prepare an app wall ad
tftAppWall.prepare();
```

##### show
Shows an app wall ad.

Usage:

```js
// Show an app wall
tftAppWall.show();
```

##### AppWall Events
The app wall supports one event called 'dismiss'. This event is fired when the app wall ad is closed.

Usage:

```js
// Subscibe the the dismiss event
tftAppWall.addEventListener("dismiss", function(d) {
			Ti.API.info("AppWall dismissed");
});
```


