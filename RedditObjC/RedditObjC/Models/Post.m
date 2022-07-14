//
//  Post.m
//  RedditObjC
//
//  Created by Yuliya  on 7/14/22.
//

#import "Post.h"

@implementation Post

-(instancetype)initWithTitle:(NSString *)title upvoteCount:(NSInteger)upvoteCount commentCount:(NSNumber *)commentCount
{
    self = [super init];
    
    if (self)
    {
        _title = title;
        _upvoteCount = upvoteCount;
        _commentCount = commentCount;
    }
    return self;
}


-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
{
    NSDictionary *innerDatatDictionary = dictionary[@"data"];
    
    //Now with inner dictionary we can define our properties
    NSString *title = innerDatatDictionary[[Post titleKey]];
    
NSInteger upvoteCount = [innerDatatDictionary[[Post upvoteCountKey]] integerValue];
NSNumber *commentCount = innerDatatDictionary[[Post commentCountKey]];
                                                                                 
    return [self initWithTitle:title upvoteCount:upvoteCount commentCount:commentCount];
    
}

// MARK: Keys
# pragma mark - Keys

+ (NSString *)titleKey
{
    return  @"title";
}

+ (NSString *)upvoteCountKey
{
    return @"ups";
}


+ (NSString *)commentCountKey
{
    return @"num_comments";
}

@end
