//
//  EmployeeInfo.m
//  CompanyEmployees
//
//  Created by Kevin Johnson on 8/5/11.
//  Copyright 2011 Home. All rights reserved.
//

#import "EmployeeInfo.h"
#import "CompanyEmployeesAppDelegate.h"

static sqlite3 *database = nil;
static sqlite3_stmt *deleteStmt = nil;
static sqlite3_stmt *addStmt = nil;

@implementation EmployeeInfo

@synthesize employeeID, employeeName, employeePhone, employeeDOB, employeePhotoPath, employeePhoto, employeeNotes, employeeEmail, isDirty, isDetailViewHydrated;

 

+ (void) getInitialDataToDisplay:(NSString *)dbPath {
	
	CompanyEmployeesAppDelegate *appDelegate = (CompanyEmployeesAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	if (sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {
		
		const char *sql = "select employeeID, employeeName, employeeEmail, employeePhone, employeeDOB, employeeNotes, employeePhotoPath from CompanyEmployees";
		sqlite3_stmt *selectstmt;
		if(sqlite3_prepare_v2(database, sql, -1, &selectstmt, NULL) == SQLITE_OK) {
			
			while(sqlite3_step(selectstmt) == SQLITE_ROW) {
				
				NSInteger primaryKey = sqlite3_column_int(selectstmt, 0);
				EmployeeInfo *employeeObj = [[EmployeeInfo alloc] initWithPrimaryKey:primaryKey];
				employeeObj.employeeName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 1)];
                employeeObj.employeeEmail = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 2)];
                employeeObj.employeePhone = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 3)];
                employeeObj.employeeDOB = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 4)];
                
                employeeObj.employeeNotes = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 5)];
                employeeObj.employeePhotoPath = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectstmt, 6)];
				
				employeeObj.isDirty = NO;
                
                if (employeeObj.employeePhotoPath != nil) {
                    employeeObj.employeePhoto = [UIImage imageWithContentsOfFile:employeeObj.employeePhotoPath];
                }
				
				[appDelegate.employeeArray addObject:employeeObj];
				[employeeObj release];
			}
		}
	}
	else
		sqlite3_close(database); //Even though the open call failed, close the database connection to release all the memory.
}

+ (void) finalizeStatements {
	
	if(database) sqlite3_close(database);
	if(deleteStmt) sqlite3_finalize(deleteStmt);
	if(addStmt) sqlite3_finalize(addStmt);
}

- (id) initWithPrimaryKey:(NSInteger) pk {
	
	[super init];
	employeeID = pk;
	
	isDetailViewHydrated = NO;
	
	return self;
}

- (void) deleteEmployee {
	
	if(deleteStmt == nil) {
		const char *sql = "delete from CompanyEmployees where employeeID = ?";
		if(sqlite3_prepare_v2(database, sql, -1, &deleteStmt, NULL) != SQLITE_OK)
			NSAssert1(0, @"Error while creating delete statement. '%s'", sqlite3_errmsg(database));
	}
	
	//When binding parameters, index starts from 1 and not zero.
	sqlite3_bind_int(deleteStmt, 1, employeeID);
	
	if (SQLITE_DONE != sqlite3_step(deleteStmt)) 
		NSAssert1(0, @"Error while deleting. '%s'", sqlite3_errmsg(database));
	
	sqlite3_reset(deleteStmt);
}



- (void) saveImageToFile {
    if (self.employeePhoto != nil) {
        NSString *homeDirectoryPath = NSHomeDirectory();
        NSString *unexpandedPath = [homeDirectoryPath stringByAppendingString:@"/Pictures/"];
        NSString *folderPath = [NSString pathWithComponents:[NSArray arrayWithObjects:[NSString stringWithString:[unexpandedPath stringByExpandingTildeInPath]], nil]];
        NSString *unexpandedImagePath = [folderPath stringByAppendingFormat:@"/%@.png", [[NSProcessInfo processInfo] globallyUniqueString]]; // Generate random string for image name
        self.employeePhotoPath = [NSString pathWithComponents:[NSArray arrayWithObjects:[NSString stringWithString:[unexpandedImagePath stringByExpandingTildeInPath]], nil]];
        if (![[NSFileManager defaultManager] fileExistsAtPath:folderPath isDirectory:NULL]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:folderPath attributes:nil];
        }
        
        NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(self.employeePhoto)];
        [imageData writeToFile:self.employeePhotoPath atomically:YES];
        
        // TODO: Releasing these variables causes BAD_ACCESS errors somewhere in the program. Probably look into this
        //[homeDirectoryPath release];
        //[unexpandedPath release];
        //[folderPath release];
        //[unexpandedImagePath release];
        
    }
}

- (void) addEmployee {
    
    [self saveImageToFile];
	
	if(addStmt == nil) {
		const char *sql = "insert into CompanyEmployees(employeeName, employeeEmail, employeePhone, employeeDOB, employeeNotes, employeePhotoPath) Values(?, ?, ?, ?, ?, ?)";
		if(sqlite3_prepare_v2(database, sql, -1, &addStmt, NULL) != SQLITE_OK)
			NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(database));
	}
	
	sqlite3_bind_text(addStmt, 1, [self.employeeName UTF8String], -1, SQLITE_TRANSIENT);
	sqlite3_bind_text(addStmt, 2, [self.employeeEmail UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(addStmt, 3, [self.employeePhone UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(addStmt, 4, [self.employeeDOB UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(addStmt, 5, [self.employeeNotes UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(addStmt, 6, [self.employeePhotoPath UTF8String], -1, SQLITE_TRANSIENT);
	
	if(SQLITE_DONE != sqlite3_step(addStmt))
		NSAssert1(0, @"Error while inserting data. '%s'", sqlite3_errmsg(database));
	else
		//SQLite provides a method to get the last primary key inserted by using sqlite3_last_insert_rowid
		employeeID = sqlite3_last_insert_rowid(database);
	
	//Reset the add statement.
	sqlite3_reset(addStmt);
}


- (void) dealloc {
	
	[employeeEmail release];
	[employeeName release];
    [employeeDOB release];
    [employeeNotes release];
    [employeePhone release];
    //[employeePhoto release];
    [employeePhotoPath release];
	[super dealloc];
}

@end
