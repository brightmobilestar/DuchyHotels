//
//  GlobData.h
//  DuchyHotels
//
//  Created by User on 4/22/15.
//  Copyright (c) 2015 Createanet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSZipArchive.h"
#import "DBManager.h"

extern NSMutableArray* g_arrayAccomMonths;
extern NSMutableArray* g_arrayAccomPrices;
extern NSMutableArray* g_arrayAccomRooms;
extern NSMutableArray* g_arrayAccomType;
extern NSMutableArray* g_arrayFacilities;
extern NSMutableArray* g_arrayGalleryImages;
extern NSMutableArray* g_arrayGalleryType;
extern NSMutableArray* g_arraySpecialOffers;


@interface GlobData : NSObject <SSZipArchiveDelegate>
{
    DBManager* m_dbManager;
}

@property(nonatomic, retain) NSDictionary* g_dictionary;

+(GlobData*)getInstance;

-(void)readDataFromDB;
-(UIImage *)readFileFromPath:(NSString*)_imageName;
-(NSArray*)querySQL:(NSString*)query;

@end


#pragma mark ---- models -------
@interface AccomMonth : NSObject
@property(nonatomic, retain) NSString* m_id;
@property(nonatomic, retain) NSString* m_name;
@end

@interface AccomPrice : NSObject
@property(nonatomic, retain) NSString* m_id;
@property(nonatomic, retain) NSString* m_type;
@property(nonatomic, retain) NSString* m_month;
@property(nonatomic, retain) NSString* m_room;
@property(nonatomic, retain) NSString* m_price;
@end

@interface AccomRoom : NSObject
@property(nonatomic, retain) NSString* m_id;
@property(nonatomic, retain) NSString* m_name;
@end

@interface AccomType : NSObject
@property(nonatomic, retain) NSString* m_id;
@property(nonatomic, retain) NSString* m_name;
@property(nonatomic, retain) NSString* m_description;
@property(nonatomic, retain) NSString* m_image1;
@property(nonatomic, retain) NSString* m_image2;
@property(nonatomic, retain) NSString* m_image3;
@end

@interface Facility : NSObject
@property(nonatomic, retain) NSString* m_id;
@property(nonatomic, retain) NSString* m_description;
@end

@interface GalleryImage : NSObject
@property(nonatomic, retain) NSString* m_id;
@property(nonatomic, retain) NSString* m_type;
@property(nonatomic, retain) NSString* m_image;
@end

@interface GalleryType : NSObject
@property(nonatomic, retain) NSString* m_id;
@property(nonatomic, retain) NSString* m_name;
@end

@interface SpecialOffer : NSObject
@property(nonatomic, retain) NSString* m_id;
@property(nonatomic, retain) NSString* m_name;
@property(nonatomic, retain) NSString* m_description;
@property(nonatomic, retain) NSString* m_image1;
@property(nonatomic, retain) NSString* m_image2;
@property(nonatomic, retain) NSString* m_image3;
@end


