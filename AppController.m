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

#import "AppController.h"
#import <AppKit/AppKit.h>

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
	[NSApp terminate: self];
}

- (void) saveDocument: (id*) sender
{
	if (filename != nil)
	{
		[self saveDocumentToFile: filename];	
	}
	NSLog(@"Did tap save");
	NSSavePanel* savePanel = [NSSavePanel savePanel];
	[savePanel runModal];
	NSString *name = [savePanel filename];
	NSLog(@"Got save file %@", name);
	[self saveDocumentToFile: name];
}

- (void) saveDocumentToFile: (NSString* filename)
{
}

@end
