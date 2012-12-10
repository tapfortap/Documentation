# Android - SDK Implementation #

## General Information ##

Integrating Tap for Tap into your app is usually really easy. Add our library, `TapForTap.jar`, to your Android project, call `TapForTap.initialize()` when your app starts, and then add a `com.tapfortap.AdView` to your layout or display an interstitial or app wall (if you are showing ads in that app). That's it!

If you are not displaying Tap for Tap ads then you only need to follow steps 1 - 3. Call `TapForTap.initialize(Activity, "YOUR API KEY")` once when your app starts up, in the `onCreate` method of your main activity.

# Instructions #

## Step 1 - Add TapForTap.jar to your project ##

If your project doesn't have a libs folder create one and copy TapForTap.jar into it.

## Step 1 using Eclipse ##

In Eclipse, right-click on your project in the Package Explorer then click `Properties`.

![](http://github.com/tapfortap/Documentation/blob/master/images/eclipse-01.png?raw=true)

In the properties window click `Java Build Path` on the left then click `Add JARs...` on the right.

![](http://github.com/tapfortap/Documentation/blob/master/images/eclipse-02.png?raw=true)

Navigate to the `TapForTap.jar` file you copied into your project earlier then click `OK`.

![](http://github.com/tapfortap/Documentation/blob/master/images/eclipse-03.png?raw=true)

Make sure that the checkbox to export the library is checked on the `Order and Export` tab

![help image](http://github.com/tapfortap/Documentation/master/images/eclipse-04.png?raw=true)

Click `OK` to leave the properties window.


## Step 1 using IntelliJ IDEA ##

In IDEA open your Project Structure via the File menu, File → Project Structure.

![](http://github.com/tapfortap/Documentation/blob/master/images/idea-01.png?raw=true)

Select `Libraries` under `Project Settings` on the left. Add a new Java library by clicking the plus icon up top, selecting Java, and then selecting `TapForTap.jar` in your `lib` or `libs` folder.

![](http://github.com/tapfortap/Documentation/blob/master/images/idea-02.png?raw=true)

![](http://github.com/tapfortap/Documentation/blob/master/images/idea-03.png?raw=true)

IDEA will ask you to select which module to add it to and in most cases you can click OK to add it to the module selected by default.

![](http://github.com/tapfortap/Documentation/blob/master/images/idea-04.png?raw=true)

Then click `OK` to leave the properties window.

![](http://github.com/tapfortap/Documentation/blob/master/images/idea-05.png?raw=true)


## Step 2 - Add permissions and activity to AndroidManifest.xml ##

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

## Step 3 - Initialize Tap for Tap when your app launches. ##

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






