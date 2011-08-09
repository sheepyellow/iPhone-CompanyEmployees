//
//  CompanyEmployeesAppDelegate.m
//  CompanyEmployees
//
//  Created by Kevin Johnson on 8/5/11.
//  Copyright 2011 Home. All rights reserved.
//

#import "CompanyEmployeesAppDelegate.h"
#import "RootViewController.h"
#import "EmployeeInfo.h"

@implementation CompanyEmployeesAppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;
@synthesize employeeArray;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Copy database to the user's phone if needed.
	[self copyDatabaseIfNeeded];
	
	//Initialize the coffee array.
	NSMutableArray *tempArray = [[NSMutableArray alloc] init];
	self.employeeArray = tempArray;
	[tempArray release];
	
	//Once the db is copied, get the initial data to display on the screen.
	[EmployeeInfo getInitialDataToDisplay:[self getDBPath]];
    
    [self.window addSubview:[_navigationController view]];
    
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_navigationController release];
    [_window release];
    [super dealloc];
}


- (void) copyDatabaseIfNeeded {
	
	//Using NSFileManager we can perform many file system operations.
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSError *error;
	NSString *dbPath = [self getDBPath];
	BOOL success = [fileManager fileExistsAtPath:dbPath]; 
	
	if(!success) {
		
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"CompanyEmployees.sqlite"];
		success = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
		
		if (!success) 
			NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
	}	
}

- (NSString *) getDBPath {
	
	//Search for standard documents using NSSearchPathForDirectoriesInDomains
	//First Param = Searching the documents directory
	//Second Param = Searching the Users directory and not the System
	//Expand any tildes and identify home directories.
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
	NSString *documentsDir = [paths objectAtIndex:0];
	return [documentsDir stringByAppendingPathComponent:@"CompanyEmployees.sqlite"];
}

- (void) removeEmployee:(EmployeeInfo *)employeeObj {
	
	//Delete it from the database.
	[employeeObj deleteEmployee];
	
	//Remove it from the array.
	[employeeArray removeObject:employeeObj];
}

- (void) addEmployee:(EmployeeInfo *)employeeObj {
	
	//Add it to the database.
	[employeeObj addEmployee];
	
	//Add it to the employee array.
	[employeeArray addObject:employeeObj];
}

@end
