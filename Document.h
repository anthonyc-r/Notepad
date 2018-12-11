#import <Foundation/Foundation.h>

@interface Document: NSObject 
{
	NSString* filename;
	NSString* content;
}

-(id) initWithFilename: (NSString*)aFilename;
-(NSString*) getFileName;
-(void) setContent: (NSString*)newContent;
-(NSString *) getContent;
-(void) save;

@end
