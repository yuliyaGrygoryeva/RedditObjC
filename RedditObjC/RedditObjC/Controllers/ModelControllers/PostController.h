//
//  PostController.h
//  RedditObjC
//
//  Created by Yuliya  on 7/14/22.
//

#import <Foundation/Foundation.h>
@class  Post;
@interface PostController : NSObject

+ (instancetype)sharedInstance;

- (void)searchForPostWithSearchTerm:(NSString *)searchTerm completion:(void(^)(NSArray<Post *> *posts, NSError *error))completion;


@end

