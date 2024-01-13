// Life Cycle Methods
// View Controller Life Cycle:
// viewDidLoad(): Called after the view controller's view has been loaded into memory. It's a good place to perform one-time setup tasks.
// viewWillAppear(_:) and viewDidAppear(_:): Called right before the view becomes visible on the screen and after it becomes visible, respectively.
// viewWillDisappear(_:) and viewDidDisappear(_:): Called when the view is about to disappear and after it has disappeared, respectively.
// viewWillLayoutSubviews() and viewDidLayoutSubviews()
// Called just before the view's bounds change and after the bounds have changed, respectively.



// iOS App Lifecycle methods
// AppDelegate Life Cycle Methods:
// 1. application(_:willFinishLaunchingWithOptions:)
// Called before application(_:didFinishLaunchingWithOptions:). It allows you to perform some tasks before the app finishes launching.
// 2. application(_:didFinishLaunchingWithOptions:)
// Called when the app finishes launching. This is a good place for initial setup and configuration.

// 3. applicationDidBecomeActive(_:)
// Called when the app becomes active and moves to the foreground. Use this method to restart tasks that were paused or not yet started.
// 4. applicationWillResignActive(_:)
// Called when the app is about to become inactive, such as when a phone call or SMS message is received. Use this method to pause ongoing tasks.

// 5. applicationDidEnterBackground(_:)
// Called when the app enters the background. This is the last opportunity to save data and perform tasks before the app may be terminated.
// 6. applicationWillEnterForeground(_:)
// Called when the app is about to enter the foreground. Use this method to undo changes made in the applicationDidEnterBackground(_:) method.

// 7. applicationWillTerminate(_:)
// Called when the app is about to terminate. This method is not called if the app is suspended.
// 8. applicationDidReceiveMemoryWarning(_:)
// Called when the system is low on memory. You can use this method to free up memory.

// Do Run else Body will get FAT
// D R B F A T




// SceneDelegate Life Cycle Methods (for apps supporting multiple windows/scenes):
// scene(_:willConnectTo:options:)
// Called when a new scene session is being created. This is the place to configure the interface and obtain the initial view controller.
// sceneDidDisconnect(_:)
// Called when a scene session is no longer needed. Cleanup tasks can be performed here.
// sceneWillEnterForeground(_:)
// Called when the scene is about to enter the foreground.
// sceneDidEnterBackground(_:)
// Called when the scene enters the background.
