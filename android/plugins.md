# TapForTap Plugins
Plugins add functionality to the TapForTap SDK on demand.
This gives you *full control* over the desired feature set, required permissions, required libraries and total file size of the SDK.

When you download the newest [SDK](https://github.com/tapfortap/Android/archive/master.zip) you will find a `/plugins` directory which includes the following plugins.

## MediaBrix
`Extra Permissions: none` `Class: MediaBrixAdProvider.class`

**The MediaBrix plugin is not supported on Android M at the moment**

The MediaBrix plugin provides video and branded interstitials for the *Rescue* and *Achievement* moment.

**Important**: By default, you will only see a sample rescue interstitial.

Please [contact our support](mailto:support@tapfortap.com) and request credentials to use MediaBrix with Tap for Tap. The integration will be enabled automatically once you've added the following two elements to your AndroidManifest.xml and we approve your account.

1) Set the value for `mediabrixAppID` in your AndroidManifest.xml to the MediaBrix app ID that was provided to you:

```xml
<meta-data android:name="mediabrixAppID" android:value="YOUR_APP_ID_HERE"/>
```

2) Set `mediabrixProperty` in your AndroidManifest.xml to the MediaBrix property that was provided to you

```xml
<meta-data android:name="mediabrixProperty" android:value="YOUR_PROPERTY_HERE"/>
```


## Tutela Analytics
`Extra Permissions: ACCESS_NETWORK_STATE, ACCESS_COARSE_LOCATION, ACCESS_FINE_LOCATION`
`Class: TutelaAnalytics.class`

The Tutela plugin provides two fundamental uses for better ad targeting:
1. More reliable geolocation data
2. Connection quality data, which enables us to serve the best ad for the users connection

<!---
## Kiip
`Extra Permissions: none` `Class: KiipAdProvider.class`
--->

# How to add a plugin

- Import the desired plugin by following these steps:
  - Go to File -> New Module
  - Select the "Import .JAR or .AAR Package" option from the list under "More Modules", click "Next"
  - Use the file menu to select the desired plugin (e.g. `mediabrix-plugin.aar`), Android Studio should fill in both text fields
- Add it to the dependencies of your app's build.gradle file
 ```java
    dependencies {
    ...
    compile project(":mediabrix-plugin")
    ...
    }
 ```

- Add the appropriate class file(s) to the with the TapForTap.initialize call.
```java
  //Initialize the TapForTap SDK
  TapForTap.initialize(this, "API-KEY", MediaBrixAdProvider.class);
```


<!---
# How to build your own plugin

A simple plugin that runs when you initialize TapForTap.

```java
package com.tapfortap.sdk.example_plugin;

import android.content.Context;
import android.content.Intent;
import com.tapfortap.sdk.Plugin;

public class SimpleExamplePlugin extends Plugin {

    @Override
    public void initialize(Context context) {
        //Do your initialization logic here. This method will get called when the TapForTap.Initialize method get's called.
    }

    @Override
    public String getPluginName() {
        return "simple_example";
    }

    @Override
    public String getVersion() {
        return "1.0";
    }
}
```

And a plugin that can provide ads.

```java
package com.tapfortap.sdk.example_plugin;

import android.content.Context;
import android.content.Intent;
import com.tapfortap.sdk.AdProvider;
import com.tapfortap.sdk.Interstitial;

public class ExampleAdProvider extends AdProvider {

    private boolean isReadyToShow;

    @Override
    public void initialize(Context context) {
        //Do any initialization logic here. This method will get called when the TapForTap.Initialize method get's called.
    }

    @Override
    public boolean load(Context context) {
        //Do your logic for loading a new ad here. Return true if the ad was (or will be) successfully loaded. Return false and the SDK will move on to the next plugin to provide ads. Make sure to call didReceiveAd(); to let the SDK know when you have received and ad and are ready to show it.

        return true;
    }

    @Override
    public void show() {
      //Show your ad. Don't forget to call didShow(); to provide callbacks.
      didShow();
    }

    @Override
    public boolean isReadyToShow() {
        //Return true or false if your ad is ready to be shown.
        return isReadyToShow;
    }

    @Override
    public String getPluginName() {
        return "example_adprovider";
    }

    @Override
    public String getVersion() {
        return "1.0";
    }

}
```
--->
