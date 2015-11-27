# Do's & Don'ts

These are some do’s and don’ts for implementing the Tap for Tap SDK and handling the ads.
Below are some helpful tips to improve user experience, reduce ad call waste, and increase impressions in your game.

* __DO__ load the SDK immediately on app load.​

* __DO__ request an ad 30 seconds before you display the ad.  This is because we pre-cache the ad and 30 seconds is a safe time to have the ad cached with a poor carrier connection.

* __DO__ request ads at strategic places in your app, close to when you intend to show the ad. If ads are requested too far in advance, the user may never get an opportunity to see that ad, which reduces impression yield and can cause inventory delivery reductions.

* __DO__ make an ad request at a point in app flow where the user is most likely to see the ad.
  * Rescue: If a player has 5 tries to complete a level, make an ad request when tries > = 1.
  * Reward: If a player is rewarded after reaching level 10, request an ad when player level = 9.
  * Break: If Break ad is displayed between levels, request ad near the end of a level. If level length cannot be determined, then request ad when level begins.

* __DO NOT__ request a new ad for a specific ad product (ie, Reward, Rescue, and Break) while another ad for the same ad product is ready to be displayed.  You should only perform a new ad request after the previous ad has been closed (excluding banners).

* __DO NOT__ display the same ad more than once after receiving an Ad Ready notification.  Make a new ad request each time an ad is seen and closed.

* __DO NOT__ place our products in a paywall or trigger from a "free rewards" button.

* __TURN OFF__ app music when ad is displayed.
