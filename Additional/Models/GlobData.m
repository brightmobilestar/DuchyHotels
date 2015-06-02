//
//  GlobData.m
//  DuchyHotels
//
//  Created by User on 4/22/15.
//  Copyright (c) 2015 Createanet. All rights reserved.
//

#import "GlobData.h"
#import "DBManager.h"
#import "SSZipArchive.h"

#define INITARRAY [[NSArray alloc] init]

NSMutableArray* g_arrayAccomMonths;
NSMutableArray* g_arrayAccomPrices;
NSMutableArray* g_arrayAccomRooms;
NSMutableArray* g_arrayAccomType;
NSMutableArray* g_arrayFacilities;
NSMutableArray* g_arrayGalleryImages;
NSMutableArray* g_arrayGalleryType;
NSMutableArray* g_arraySpecialOffers;

@implementation AccomMonth
@synthesize m_id, m_name;
@end

@implementation AccomPrice
@synthesize m_id, m_type, m_month,m_room, m_price;
@end

@implementation AccomRoom
@synthesize m_id, m_name;
@end

@implementation AccomType
@synthesize m_id, m_name, m_description, m_image1, m_image2, m_image3;
@end

@implementation Facility
@synthesize m_id, m_description;
@end

@implementation GalleryImage
@synthesize m_id, m_type, m_image;
@end

@implementation GalleryType
@synthesize m_id, m_name;
@end

@implementation SpecialOffer
@synthesize m_id, m_name, m_description, m_image1, m_image2, m_image3;
@end


@implementation GlobData

@synthesize g_dictionary;
static GlobData *instance = nil;

+(GlobData *)getInstance
{
    @synchronized( self )
    {
        if ( instance == nil )
        {
            instance = [GlobData new];
            g_arrayAccomMonths = [[NSMutableArray alloc] init];
            g_arrayAccomPrices = [[NSMutableArray alloc] init];
            g_arrayAccomRooms = [[NSMutableArray alloc] init];
            g_arrayAccomType = [[NSMutableArray alloc] init];
            g_arrayFacilities = [[NSMutableArray alloc] init];
            g_arrayGalleryImages = [[NSMutableArray alloc] init];
            g_arrayGalleryType = [[NSMutableArray alloc] init];
            g_arraySpecialOffers = [[NSMutableArray alloc] init];
        }
    }
    return( instance );
}

-(void)readDataFromDB
{
    [self unzipping:@"hotelapp.db"];
    [self unzipping:@"hotelappimages"];
    
    m_dbManager = [[DBManager alloc] initWithDatabaseFilename:@"hotelapp.db"];

    [self readAccomMonth:m_dbManager];
    [self readAccomPrice:m_dbManager];
    [self readAccomRoom:m_dbManager];
    [self readAccomType:m_dbManager];
    [self readFacility:m_dbManager];
    [self readGalleryImage:m_dbManager];
    [self readGalleryType:m_dbManager];
    [self readSpecialOffer:m_dbManager];
}

- (void)unzipping:(NSString*)zipfile {
    NSString *zipPath = [[NSBundle bundleForClass:[self class]] pathForResource:zipfile ofType:@"zip"];
    //NSString *outputPath = [self _cachesPath:@"Regular"];
    
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *outputPath = [documentsDirectory stringByAppendingPathComponent:@""];
    
    // unzip
    [SSZipArchive unzipFileAtPath:zipPath toDestination:outputPath delegate:self];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testPath = [outputPath stringByAppendingPathComponent:zipfile];
    if ([fileManager fileExistsAtPath:testPath]) {
        NSLog(@"Success - %@ ---------", zipfile);
    }//
}

-(void)readAccomMonth:(DBManager*)dbManager
{
    NSString *query = @"select * from accommodation_month";
    
    // Get the results.
    NSArray* arrayResult = [[NSArray alloc] initWithArray:[dbManager loadDataFromDB:query]];
    
    // Reload the table view.
    for (NSInteger i = 0; i < [arrayResult count]; i ++) {
        //NSInteger indexOfID = [dbManager.arrColumnNames indexOfObject:@"id"];
        //NSInteger indexOfName = [dbManager.arrColumnNames indexOfObject:@"name"];
        
        
        AccomMonth* accomMonth = [[AccomMonth alloc] init];
        // Set the loaded data to the appropriate cell labels.
        accomMonth.m_id = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:0]];
        accomMonth.m_name = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:1]];
        [g_arrayAccomMonths addObject:accomMonth];
    }
}

-(NSArray*)querySQL:(NSString*)query
{
   // NSString *query = @"select * from accommodation_month";
    
    // Get the results.
    NSArray* arrayResult = [[NSArray alloc] initWithArray:[m_dbManager loadDataFromDB:query]];
    
    // Reload the table view.
    for (NSInteger i = 0; i < [arrayResult count]; i ++) {
        //NSInteger indexOfID = [dbManager.arrColumnNames indexOfObject:@"id"];
        //NSInteger indexOfName = [dbManager.arrColumnNames indexOfObject:@"name"];
        
        
//        AccomMonth* accomMonth = [[AccomMonth alloc] init];
//        // Set the loaded data to the appropriate cell labels.
//        accomMonth.m_id = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:0]];
//        accomMonth.m_name = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:1]];
//        [g_arrayAccomMonths addObject:accomMonth];
    }
    
    return arrayResult;
}

-(void)readAccomPrice:(DBManager*)dbManager
{
    NSString *query = @"select * from accommodation_price";
    
    // Get the results.
    NSArray* arrayResult = [[NSArray alloc] initWithArray:[dbManager loadDataFromDB:query]];
    
    // Reload the table view.
    for (NSInteger i = 0; i < [arrayResult count]; i ++) {
        //NSInteger indexOfID = [dbManager.arrColumnNames indexOfObject:@"id"];
        //NSInteger indexOfType = [dbManager.arrColumnNames indexOfObject:@"type"];
        //NSInteger indexOfMonth = [dbManager.arrColumnNames indexOfObject:@"month"];
        //NSInteger indexOfRoom = [dbManager.arrColumnNames indexOfObject:@"room"];
        //NSInteger indexOfPrice = [dbManager.arrColumnNames indexOfObject:@"price"];
        
        
        AccomPrice* accomPrice = [[AccomPrice alloc] init];
        // Set the loaded data to the appropriate cell labels.
        accomPrice.m_id = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:0]];
        accomPrice.m_type = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:1]];
        accomPrice.m_month = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:2]];
        accomPrice.m_room = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:3]];
        accomPrice.m_price = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:4]];
        [g_arrayAccomPrices addObject:accomPrice];
    }
    
}

-(void)readAccomRoom:(DBManager*)dbManager
{
    NSString *query = @"select * from accommodation_room";
    
    // Get the results.
    NSArray* arrayResult = [[NSArray alloc] initWithArray:[dbManager loadDataFromDB:query]];
    
    // Reload the table view.
    for (NSInteger i = 0; i < [arrayResult count]; i ++) {
        //NSInteger indexOfID = [dbManager.arrColumnNames indexOfObject:@"id"];
        //NSInteger indexOfName = [dbManager.arrColumnNames indexOfObject:@"name"];
        
        
        AccomRoom* accomMonth = [[AccomRoom alloc] init];
        // Set the loaded data to the appropriate cell labels.
        accomMonth.m_id = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:0]];
        accomMonth.m_name = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:1]];
        [g_arrayAccomRooms addObject:accomMonth];
    }
}

-(void)readAccomType:(DBManager*)dbManager
{
    NSString *query = @"select * from accommodation_type";
    
    // Get the results.
    NSArray* arrayResult = [[NSArray alloc] initWithArray:[dbManager loadDataFromDB:query]];
    
    // Reload the table view.
    for (NSInteger i = 0; i < [arrayResult count]; i ++) {
        //NSInteger indexOfID = [dbManager.arrColumnNames indexOfObject:@"id"];
        //NSInteger indexOfType = [dbManager.arrColumnNames indexOfObject:@"name"];
        //NSInteger indexOfMonth = [dbManager.arrColumnNames indexOfObject:@"imagename1"];
        //NSInteger indexOfRoom = [dbManager.arrColumnNames indexOfObject:@"imagename2"];
        //NSInteger indexOfPrice = [dbManager.arrColumnNames indexOfObject:@"imagename3"];
        
        
        AccomType* accomPrice = [[AccomType alloc] init];
        // Set the loaded data to the appropriate cell labels.
        accomPrice.m_id = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:0]];
        accomPrice.m_name = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:1]];
        accomPrice.m_description = @"This is description for accommodataion.";
        accomPrice.m_image1 = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:2]];
        accomPrice.m_image2 = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:3]];
        accomPrice.m_image3 = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:4]];
        [g_arrayAccomType addObject:accomPrice];
    }
}

-(void)readFacility:(DBManager*)dbManager
{
    NSString *query = @"select * from facility";
    
    // Get the results.
    NSArray* arrayResult = [[NSArray alloc] initWithArray:[dbManager loadDataFromDB:query]];
    
    // Reload the table view.
    for (NSInteger i = 0; i < [arrayResult count]; i ++) {
        //NSInteger indexOfID = [dbManager.arrColumnNames indexOfObject:@"id"];
        //NSInteger indexOfDescription = [dbManager.arrColumnNames indexOfObject:@"description"];
        
        
        Facility* accomMonth = [[Facility alloc] init];
        // Set the loaded data to the appropriate cell labels.
        accomMonth.m_id = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:0]];
        accomMonth.m_description = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:1]];
        [g_arrayFacilities addObject:accomMonth];
    }
}

-(void)readGalleryImage:(DBManager*)dbManager
{
    NSString *query = @"select * from gallery_image";
    
    // Get the results.
    NSArray* arrayResult = [[NSArray alloc] initWithArray:[dbManager loadDataFromDB:query]];
    
    // Reload the table view.
    for (NSInteger i = 0; i < [arrayResult count]; i ++) {
        //NSInteger indexOfID = [dbManager.arrColumnNames indexOfObject:@"id"];
        //NSInteger indexOfType = [dbManager.arrColumnNames indexOfObject:@"type"];
        //NSInteger indexOfImagename = [dbManager.arrColumnNames indexOfObject:@"imagename"];
        
        GalleryImage* accomMonth = [[GalleryImage alloc] init];
        // Set the loaded data to the appropriate cell labels.
        accomMonth.m_id = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:0]];
        accomMonth.m_type = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:1]];
        accomMonth.m_image = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:2]];
        [g_arrayGalleryImages addObject:accomMonth];
    }
}

-(void)readGalleryType:(DBManager*)dbManager
{
    NSString *query = @"select * from gallery_type";
    
    // Get the results.
    NSArray* arrayResult = [[NSArray alloc] initWithArray:[dbManager loadDataFromDB:query]];
    
    // Reload the table view.
    for (NSInteger i = 0; i < [arrayResult count]; i ++) {
        ////NSInteger indexOfID = [dbManager.arrColumnNames indexOfObject:@"id"];
        //NSInteger indexOfName = [dbManager.arrColumnNames indexOfObject:@"name"];
        
        GalleryType* accomMonth = [[GalleryType alloc] init];
        // Set the loaded data to the appropriate cell labels.
        accomMonth.m_id = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:0]];
        accomMonth.m_name = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:1]];
        [g_arrayGalleryType addObject:accomMonth];
    }
}

-(void)readSpecialOffer:(DBManager*)dbManager
{
    NSString *query = @"select * from special_offer";
    
    // Get the results.
    NSArray* arrayResult = [[NSArray alloc] initWithArray:[dbManager loadDataFromDB:query]];
    
    // Reload the table view.
    for (NSInteger i = 0; i < [arrayResult count]; i ++) {
        //NSInteger indexOfID = [dbManager.arrColumnNames indexOfObject:@"id"];
        //NSInteger indexOfName = [dbManager.arrColumnNames indexOfObject:@"name"];
        ///NSInteger indexOfDescription = [dbManager.arrColumnNames indexOfObject:@"description"];
        //NSInteger indexOfMonth = [dbManager.arrColumnNames indexOfObject:@"imagename1"];
        //NSInteger indexOfRoom = [dbManager.arrColumnNames indexOfObject:@"imagename2"];
        //NSInteger indexOfPrice = [dbManager.arrColumnNames indexOfObject:@"imagename3"];
        
        
        SpecialOffer* accomPrice = [[SpecialOffer alloc] init];
        // Set the loaded data to the appropriate cell labels.
        accomPrice.m_id = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:0]];
        accomPrice.m_name = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:1]];
        accomPrice.m_description = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:2]];
        accomPrice.m_image1 = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:3]];
        accomPrice.m_image2 = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:4]];
        accomPrice.m_image3 = [NSString stringWithFormat:@"%@", [[arrayResult objectAtIndex:i] objectAtIndex:5]];
        [g_arraySpecialOffers addObject:accomPrice];
    }
}

-(UIImage *)readFileFromPath:(NSString*)_imageName{
    NSString *stringPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"hotelappimages/"];
    stringPath  = [stringPath stringByAppendingPathComponent:_imageName];
    NSLog(@"stringpath %@",stringPath);
    return [UIImage imageWithContentsOfFile:stringPath];
}

@end
