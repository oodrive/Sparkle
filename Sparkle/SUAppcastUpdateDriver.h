//
//  SUAppcastUpdateDriver.h
//  Sparkle
//
//  Created by Odirb on 05/12/2019.
//  Copyright © 2019 Sparkle Project. All rights reserved.
//

#ifndef SUAppcastUpdateDriver_h
#define SUAppcastUpdateDriver_h

#import "SUBasicUpdateDriver.h"

@interface SUAppcastUpdateDriver : SUBasicUpdateDriver

- (instancetype)initWithUpdaterAndAppcast:(id<SUUpdaterPrivate>) updater :(SUAppcast*) anAppcast;

@property (readonly, nonatomic, strong) SUAppcast *appcast;

@end

#endif /* SUAppcastUpdateDriver_h */
