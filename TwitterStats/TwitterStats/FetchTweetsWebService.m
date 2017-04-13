//
//  FetchTweetsWebService.m
//  TwitterStats
//
//  Created by Cameron Weston on 4/5/17.
//  Copyright © 2017 cameron weston personal. All rights reserved.
//

#import "FetchTweetsWebService.h"

@interface FetchTweetsWebService () <NSURLSessionDelegate>

@property (nonatomic, strong, readwrite) NSString *oAuthToken;

@end

@implementation FetchTweetsWebService

static NSString *const consumerKey = @"R6B31mzHrhqBMC6gWGUVGz4NR";
static NSString *const consumerSecret = @"QIhalU4lXFu3OBldrFX9FhhqoqFHakk8ZNiCu4H0ewvvDwFnia";

- (void)fetchBearerToken {
    NSString *grantTypeString = @"grant_type=client_credentials";
    
    NSString *post = [NSString stringWithString:[self buildURLStringForRetrieveToken]];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURL *remoteURL = [NSURL URLWithString:[self buildURLStringForRetrieveToken]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:remoteURL];
    [request setValue:[self encodeConsumerKeyAndSecret] forHTTPHeaderField:@"Authorization"];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[NSData dataWithBytes:[grantTypeString UTF8String] length:[grantTypeString length]]];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];
    
    [[session dataTaskWithRequest:request completionHandler:
      ^(NSData *data, NSURLResponse *response, NSError *error) {
          NSError *jsonError = error;
          NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
          self.oAuthToken =  [NSString stringWithFormat:@"Bearer %@", result[@"access_token"]];
          
          if (jsonError) {
              NSLog(@"Error with JSON: %@", jsonError.localizedDescription);
          }
      }] resume];
}

- (NSString *)encodeConsumerKeyAndSecret {
    NSCharacterSet *allowedCharacters = [NSCharacterSet URLFragmentAllowedCharacterSet];
    NSString *encodedConsumerKey = [consumerKey stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    NSString *encodedConsumerSecret = [consumerSecret stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    NSString *concatenatedCredentials = [NSString stringWithFormat:@"%@:%@",encodedConsumerKey, encodedConsumerSecret];
    NSData *data = [concatenatedCredentials dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64EncodedKey = [data base64EncodedStringWithOptions:0];
    
    NSString *encodedAuthToken = [NSString stringWithFormat:@"Basic %@", base64EncodedKey];
    return encodedAuthToken;
}

- (void)fetchTweets:(void (^)(NSDictionary *))callback {
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSString *urlString = [self buildURLStringForFetchTweets];
    NSURL *remoteURL = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]  initWithURL:remoteURL];
    [request addValue:self.oAuthToken forHTTPHeaderField:@"Authorization"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
    [[session dataTaskWithRequest:request completionHandler:
      ^(NSData *data, NSURLResponse *response, NSError *error) {
          if (error) {
              NSLog(@"error: %@", error.localizedDescription);
              callback(nil);
              return;
          }
          NSError *jsonError = nil;
          NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
          callback(result);
          NSLog(@"HERE IS THE RESULT: %@", result);
          if (jsonError) {
              NSLog(@"Error with json: %@", jsonError.localizedDescription);
          }
      }] resume];
}

- (NSString *)buildURLStringForFetchTweets {
    return [NSString stringWithFormat:@"https://api.twitter.com/1.1/statuses/home_timeline.json"];
}

- (NSString *)buildURLStringForRetrieveToken {
    return [NSString stringWithFormat:@"https://api.twitter.com/oauth2/token"];
}
@end
