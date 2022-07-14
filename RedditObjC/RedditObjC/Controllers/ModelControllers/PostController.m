//
//  PostController.m
//  RedditObjC
//
//  Created by Yuliya  on 7/14/22.
//

#import "PostController.h"
#import "Post.h"
@implementation PostController

+ (instancetype)sharedInstance
{
    static PostController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        sharedInstance = [[PostController alloc] init];
    });
    return sharedInstance;
}

- (NSURL *)baseURL
{
    return [NSURL URLWithString:@"https://www.reddit.com/r/"];
}


// MARK Fetch Data
- (void)searchForPostWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<Post *> *, NSError *))completion
{
    NSURL *searchURL = [self baseURL];
    searchURL = [searchURL URLByAppendingPathComponent:searchTerm];
    searchURL = [searchURL URLByAppendingPathExtension:@"json"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
    if (error)
    {
        NSLog(@"%", error.localizedDescription);
        return completion(nil, error);
    }
        if (!data)
        {
            NSLog(@"Error No data");
            return completion(nil, error);
        }
        
        NSDictionary *jsonTopLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingFragmentsAllowed error:&error];
        if (!jsonTopLevelDictionary || ![jsonTopLevelDictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"not dictionary class");
            return completion(nil, error);
        }
        
        NSDictionary *dataDictionary = jsonTopLevelDictionary[@"data"];
        NSArray *childrenArray = dataDictionary[@"children"];
        //placeholder array
        NSMutableArray *postsArray = [NSMutableArray array];
        
        for (NSDictionary *postDictionary in childrenArray)
        {
            Post *post = [[Post alloc] initWithDictionary:postDictionary ];
            [postsArray addObject:post];
        }
        
        completion(postsArray, nil);
        
    }] resume];

}

@end
