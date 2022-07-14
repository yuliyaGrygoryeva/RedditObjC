//
//  Post.h
//  RedditObjC
//
//  Created by Yuliya  on 7/14/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : NSObject

@property (nonatomic, copy, readonly) NSString *title;
// Demo purposes only, NSInteger preferred for math equations
@property (nonatomic, readonly) NSInteger upvoteCount;
@property (nonatomic, readonly) NSNumber *commentCount;

// Property initializer
- (instancetype)initWithTitle:(NSString *)title upvoteCount:(NSInteger)upvoteCount
                 commentCount:(NSNumber *)commentCount;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
