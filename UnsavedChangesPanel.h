/* All Rights reserved */

#include <AppKit/AppKit.h>

@interface UnsavedChangesPanel : NSPanel
{
	BOOL _shouldSave;
}
-(void)discardChanges: (id)sender;
-(void)saveChanges: (id)sender;
-(BOOL)shouldSave;
@end
