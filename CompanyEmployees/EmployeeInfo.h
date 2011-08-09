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
    NSString *employeePhone;
    NSString *employeeDOB;
    NSString *employeePhotoPath;
    UIImage *employeePhoto;
    NSString *employeeNotes;

    //Intrnal variables to keep track of the state of the object.
    BOOL isDirty;
    BOOL isDetailViewHydrated;
}

@property (nonatomic, readonly) NSInteger employeeID;
@property (nonatomic, copy) NSString *employeeName;
@property (nonatomic, copy) NSString *employeeEmail;
@property (nonatomic, copy) NSString *employeePhone;
@property (nonatomic, copy) NSString *employeeDOB;
@property (nonatomic, copy) NSString *employeePhotoPath;
@property (nonatomic, copy) UIImage *employeePhoto;
@property (nonatomic, copy) NSString *employeeNotes;

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
