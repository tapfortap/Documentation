# Android - SDK Implementation #

##  Current Version ##
**2.1.0** - [See Changelog](AndroidChangelog)

Supports Android 2.1 and up (API level 7)

##  General Information ##

Integrating Tap for Tap into your app is usually really easy. Add our library, `TapForTap.jar`, to your Android project, call `TapForTap.initialize()` when your app starts, and then add a `com.tapfortap.AdView` to your layout or display an interstitial or app wall (if you are showing ads in that app). That's it!

If you are not displaying Tap for Tap ads then you only need to follow steps 1 - 3. Call `TapForTap.initialize(Activity, "YOUR API KEY")` once when your app starts up, in the `onCreate` method of your main activity.

##  Video Walkthrough ##

Watch [a video that shows how to implement Tap for Tap](http://www.youtube.com/watch?feature=player_embedded&v=xDj16PJ5WQk&hg=1) from start to finish.

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


##  Step 2 - Add permissions and activity to AndroidManifest.xml ##

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.READ_PHONE_STATE" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```
Note: We use READ_PHONE_STATE and ACCESS_WIFI_STATE to uniquely identify devices. You can choose to omit these permissions if you don't want to use them.

Note: We use WRITE_EXTERNAL_STORAGE to cache images to reduce data transferred over the network and improve performance. You can omit this permission if you don't want to use it.

Finally, add the following activity to `AndroidManifest.xml` under the <application> tag:

```xml
<activity android:name="com.tapfortap.TapForTapActivity"/>
```

##  Step 3 - Initialize Tap for Tap when your app launches. ##

This goes in the activity in which you want to display ads. Note that we started using an account-wide API key in version 2 instead of individual app IDs. Your API key is available on the [account page](http://tapfortap.com/developer#account").

```Java
// Import TapForTap
import com.tapfortap.TapForTap;

// Initialize Tap for Tap
public class MyActivity extends Activity {
  @Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		// Substitute your real API key here
		TapForTap.initialize(this, "YOUR API KEY");
		// ...
	}
}
```

##  Step 4 - 4. Display a banner, interstitial, or app wall. ##

## # Banner ###

```xml
<activity android:name="com.tapfortap.TapForTapActivity"/>
```
If you don't use XML but instead lay out your views with code then it will look something like this:

```Java
AdView adView = new AdView(this);
// Optionally specify layout params.
DisplayMetrics metrics = getResources().getDisplayMetrics();
int width = metrics.widthPixels;
int height = (int)(50 * (width / 320.0));
LinearLayout.LayoutParams myLayoutParams = new LinearLayout.LayoutParams(width, height);
adView.setLayoutParams(myLayoutParams);
// Add the AdView to your layout.
myLayout.addView(adView);
```

## # Interstitial ###

Inside an activity simply use the `Interstitial` class like this:

```Java
// In onCreate
Interstitial.prepare(this);

// Later when you want to display the interstitial
Interstitial.show(this);
```

You only have to prepare it the first time on startup, each time it is shown the next one is automatically prepared for you

## # App Wall ###

Inside an activity simply use the `AppWall` class like this:

```Java
// In onCreate
AppWall.prepare(this);

// Later when you want to display the app wall
AppWall.show(this);
```

You only have to prepare it the first time on startup, each time it is shown the next one is automatically prepared for you.

Congratulations! You should now be up and running. Run the app and then [Login](http://tapfortap.com/login) to check to make sure that it worked.

##  Step 5 - Send info about your users (optional). ##

If you have information about your users that your privacy policy allows you to share with us, you can improve performance and revenue by passing it along. Just set the info on `com.tapfortap.TapForTap`. We accept year of birth, gender, location, and the account ID of user's on your system.

```Java
TapForTap.setGender(<MALE or FEMALE>);
TapForTap.setYearOfBirth(<year>);
TapForTap.setLocation(<location>);
TapForTap.setUserAccountId(<accountId>);
```

Where gender is `either` `MALE` or `FEMALE`, `age` is a positive integer, `location` is an `android.location.Location` object, and user `account ID`s are strings.

**Note:** If you are using Tap for Tap's [monetization](monetization) program passing this information can greatly increase your revenue.

# Example Code #

Some example code is included to help get you started. Take a look in the example folder to see exactly how it's done.

##  API Documentation ##

To take action when ads are loaded or fail to load you can set a listener on `AdView` objects and the `Interstitial` and `AppWall` classes. AdView listeners implement the `AdViewListener` interface which specifies three methods:

```Java
public void onReceiveAd()
public void onFailToReceiveAd(String reason)
public void onTapAd()
```

You can use an anonymous class to set the listener without defining a concrete class, like so:

```Java
adView.setListener(new AdViewListener() {
	public void onReceiveAd() {
		Log.d("MyActivity", "Tap for Tap ad received");
	}

	public void onFailToReceiveAd(String reason) {
		Log.d("MyActivity", "Tap for Tap failed to receive ad: " + reason);
	}

	public void onTapAd() {
		Log.d("MyActivity", "Tap for Tap ad tapped");
	}
});
```

If you use your activity as the `AdViewListener` be sure to set the listener to `null` in `onDestroy` otherwise there will be a cycle and your app will leak memory.

```Java
@Override
protected void onDestroy() {
	adView.setListener(null);
	super.onDestroy();
}
```

Interstitial and AppWall listeners implement the identical `InterstitialListener` and `AppWallListener` interfaces which specify a single method:

```Java
public void onDismiss()
```

You can use an anonymous class to set the listener without defining a concrete class, like so:

```Java
Interstitial.setListener(new InterstitialListener() {
	public void onDismiss() {
		Log.d("MyActivity", "Tap for Tap interstitial dismissed");
	}
```

Or for app walls:

```Java
AppWall.setListener(new AppWallListener() {
	public void onDismiss() {
		Log.d("MyActivity", "Tap for Tap app wall dismissed");
	}
```
