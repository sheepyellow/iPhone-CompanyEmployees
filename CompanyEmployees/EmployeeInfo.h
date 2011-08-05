//
//  EmployeeInfo.h
//  CompanyEmployees
//
//  Created by Kevin Johnson on 8/5/11.
//  Copyright 2011 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface EmployeeInfo : NSObject {
    NSInteger employeeID;
    NSString *employeeName;
    NSString *employeeEmail;

    //Intrnal variables to keep track of the state of the object.
    BOOL isDirty;
    BOOL isDetailViewHydrated;
}

@property (nonatomic, readonly) NSInteger employeeID;
@property (nonatomic, copy) NSString *employeeName;
@property (nonatomic, copy) NSString *employeeEmail;

@property (nonatomic, readwrite) BOOL isDirty;
@property (nonatomic, readwrite) BOOL isDetailViewHydrated;

//Static methods.
+ (void) getInitialDataToDisplay:(NSString *)dbPath;
+ (void) finalizeStatements;

//Instance methods.
- (id) initWithPrimaryKey:(NSInteger)pk;
- (void) deleteEmployee;
- (void) addEmployee;
@end
