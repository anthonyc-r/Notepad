/*
Notepad.gnustep

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

#import <AppKit/AppKit.h>
#import "AppController.h"
#import "Document.h"

@implementation AppController


- (void) awakeFromNib
{
	NSLog(@"Awoke from nib.");
	[window makeKeyAndOrderFront: self];
	[window setDelegate: self];
}

- (void) windowDidResize: (id*) sender
{
	NSLog(@"Resized window");
}

- (void) windowWillClose: (id*) sender
{
	NSLog(@"%@", [activeDocument getContent]);
	[NSApp terminate: self];
}

- (void) saveDocument: (id*) sender
{
	if (activeDocument != nil)
	{
		[self saveActiveDocument];
		return;
	}
	NSLog(@"Did tap save");
	NSSavePanel* savePanel = [NSSavePanel savePanel];
	[savePanel runModal];
	activeDocument = [[Document alloc] initWithFilename: [savePanel filename]];	
	[activeDocument setContent: [textField text]];
	NSLog(@"Got save file %@", [savePanel filename]);
	[self saveActiveDocument];
}

- (void) saveActiveDocument
{
	[activeDocument save];	
}

// MARK: - NSTextViewDelegate

-(void) textDidChange: (NSNotification*) not
{
	NSString* content = [textField text];
	[activeDocument setContent: content];
}

@end
