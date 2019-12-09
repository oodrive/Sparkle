//
//  SUAppcastUpdateDriver.m
//  Sparkle
//
//  Created by Odirb on 05/12/2019.
//  Copyright © 2019 Sparkle Project. All rights reserved.
//

#import "SUAppcastUpdateDriver.h"
#import "SUAppcast.h"
#import "SUAppcastItem.h"

@interface SUAppcastUpdateDriver ()

@property (nonatomic, strong) SUAppcast *appcast;

@end

@implementation SUAppcastUpdateDriver

@synthesize appcast;

- (instancetype)initWithUpdaterAndAppcast:(id<SUUpdaterPrivate>) updater :(SUAppcast*) anAppcast
{
    self = [super initWithUpdater:updater];
    self.appcast = anAppcast;
    return self;
}

- (void)checkForUpdatesAtURL:(NSURL *) __unused URL host:(SUHost *)aHost
{
    self.host = aHost;
    
    // Skip downloading appcast.
    [self appcastDidFinishLoading:self.appcast];
}

- (void)downloadUpdate
{
    NSURL* fileURL = [self.updateItem fileURL];
    
    // If enclosure url is a file, skip download and go to extract step.
    if (fileURL.isFileURL)
    {
        NSString* filename = [fileURL lastPathComponent];
        NSString* temporaryDirectory = [[fileURL path] stringByDeletingLastPathComponent];
        [self downloaderDidSetDestinationName:filename temporaryDirectory:temporaryDirectory];

        [self downloaderDidFinishWithTemporaryDownloadData:nil];
    }
    else
    {
        [super downloadUpdate];
    }
}
@end
