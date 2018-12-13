#import <Foundation/Foundation.h>

@interface Document: NSObject 
{
	NSString* filename;
	NSString* content;
	BOOL saved;
}

-(id)init;
-(id)initWithFilename: (NSString*)aFilename;
-(NSString*)getFilename;
-(void)setFilename: (NSString*)aFilename;
-(void)setContent: (NSString*)newContent;
-(NSString*)getContent;
-(void)save;
-(BOOL)hasUnsavedChanges; 

@end
