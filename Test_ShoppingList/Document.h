//
//  Document.h
//  Test_ShoppingList
//
//  Created by Jack Meng on 10/31/14.
//  Copyright (c) 2014 Jack Meng. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument{
    IBOutlet NSTextField *itemAddTextField;
    IBOutlet NSTableView *shoppingListTableView;
    IBOutlet NSButton *addItemButton;
    IBOutlet NSButton *removeItemButton;
    
    NSMutableArray *shoppingListArray;
}

-(IBAction)addItemToShoppingList:(id)sender;
-(IBAction)removeItemFromShoppingList:(id)sender;


@end

