# Shop Rabbit
A Kodeco iOS Bootcamp Capstone Project which models a fully functioning front end for a shopping application built with Swift/SwiftUI. The app displays a full product catalog from www.fakeapistore.com. 

## Capstone Requirements and how each is met

1. The app has a README file including: A basic explanation of the app, as well as explanations of how your app fulfills each of the rubric items. Identify your features and any specific file names so that your mentor doesn’t have to search for them while grading.  
COMPLETED - This README details how each metric for the Capstone is met and/or surpassed.

2. The app has a splash screen suitable for the app. It can be either a static or animated splash screen.  
COMPLETED - A LaunchscreenView and LaunchscreenViewModel control the animation in and out.

3. All features in the app should be completed. Any unfinished feature should be commented out.  
COMPLETED - Shop Rabbit is fully functional and all old code from non-relevant assignments has been removed from the CAPSTONE branch.

4. The app has at least one screen with a list using a view of your choice (List, grid .. etc). Each item in the list should contain (as a minimum) a name, a sub-title/description, and an image of the item - the text should be styled appropriately. Pressing on items in this list should lead to detail pages - this should show the same data in the list with some further details such as a longer description, bigger picture, price, and a Buy/Order button. Include enough items to ensure that the user has to scroll the list to see all the items in it.  
COMPLETED - Multiple implementations of List and a grid were used to display Inventory items, Shopping cart items, Wishlist items, and Previous orders. You can move items back and forth between the cart and wishlist. Tapping on an item brings up the item details. 

5. Should have a tab view with at least two tabs.  
COMPLETED - App navigation employs both hierarchical and flat navigation (4 tabs).

6. The app has one or more network call(s) to download/upload data that relates to the core tasks of the app.  
COMPLETED - A custom configured URLSession is used to fetch data from the www.fakeapistore.com api. The configuration includes a check for different network speeds (Low Data Mode, cellular only, etc).

7. The app handles all typical errors related to network calls. Including at least: No network connection, server error.  
COMPLETED - NWPathMonitor and a custom URLSession configuration were used to monitor network connection. It was designed according to Apple's waits for connectivity recommendation. The method can be found in the InventoryViewModel file, loadAllProductsFromAPI() method.

8. The app uses at least one way to save data: userdefaults, keychain, or local database. Please list your method in the Readme.  
COMPLETED - Data is saved to the Documents Directory as a JSON file. There is an option to load data from the JSON file as well.

9. The app communicates to the user whenever data is missing or empty, the reason for that condition, and a step to take in order to move forward. In other words, no blank screens. The user should never “feel” lost.  For example, whenever there are no items, such as when the data cannot be loaded, explain it).  
COMPLETED - There are no blank screens as the app actively monitors network connectivity.

10. All included screens work successfully without crashes or UI issues.  
COMPLETED - No crashes or UI issues occur.

11. App works for both landscape and portrait orientations.  
COMPLETED - Tested to work in both orientations.

12. App works for both light and dark modes.  
COMPLETED - Tested to work in both modes with custom ColorSets employed.

13. No obvious UI issues.  
COMPLETED - Confirmed.

14. The code should be organized and easily readable.  
COMPLETED - Multiple files were used to separate concerns. Extensions to classes were used for readability. App architecture was built as the MVVM design pattern.

15. Project source files are organized in folders such as Views, Models, etc.  
COMPLETED - Confirmed.

16. View components are abstracted into separate Views and source files.  
COMPLETED - Confirmed.

17. The project utilizes SwiftLint. (The rules installed by default are sufficient). 
COMPLETED - Confirmed. The vast majority of issues were related to whitespace which have all been addressed.

18. Project builds without Warnings or Errors. (TODO warnings should be moved to a different branch). 
COMPLETED - Confirmed.

19. The code has both UI and unit testing with a minimum of 50% code coverage.
COMPLETED - Confirmed.

20. All test cases pass.  
COMPLETED - Confirmed.

21. A custom app icon.  
COMPLETED - Confirmed. I designed the image using Adobe Illustrator and Figma.

22. An onboarding screen.  
COMPLETED - Confirmed. I designed the image using Adobe Illustrator and Figma.

23. A custom display name.  
COMPLETED - Confirmed.

24. At least one animation.  
COMPLETED - Animations occur via the launchscreen and when an order is placed.

25. Styled text properties. SwiftUI modifiers are sufficient.  
COMPLETED - Confirmed.
