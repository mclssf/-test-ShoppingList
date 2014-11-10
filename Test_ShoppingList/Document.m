//
//  Document.m
//  Test_ShoppingList
//
//  Created by Jack Meng on 10/31/14.
//  Copyright (c) 2014 Jack Meng. All rights reserved.
//

#import "Document.h"

@interface Document ()

@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        shoppingListArray = [[NSMutableArray alloc] init];
        [shoppingListArray addObject:@"Milk"];
    }
    return self;
}

-(void)dealloc {
    [shoppingListArray release];
    [super dealloc];
}

-(IBAction)addItemToShoppingList:(id)sender
{
    NSString *stringToAdd = [itemAddTextField stringValue];
    for (NSString *eachItem in shoppingListArray) {
        if ([stringToAdd isEqualToString:eachItem]) {
            NSAlert *repeatAlert = [NSAlert alertWithMessageText:@"Add an existing item" defaultButton:@"Cancel" alternateButton:@"Proceed" otherButton:nil informativeTextWithFormat:@"Would you still add an existing item?"];
            if ([repeatAlert runModal] == NSAlertDefaultReturn) {
                return;
            }
            else{
                break;
            }
        }
    }
    
    [shoppingListArray addObject:stringToAdd];
    [shoppingListTableView reloadData];
    
    if (sender == itemAddTextField){
        [itemAddTextField setStringValue:@""];
    }
}

-(IBAction)removeItemFromShoppingList:(id)sender
{
    NSInteger rowToRemove = [shoppingListTableView selectedRow];
    if (rowToRemove >= 0 && rowToRemove < [shoppingListArray count]){
        NSString *stringToRemove = [shoppingListArray objectAtIndex:rowToRemove];
        NSAlert *removeAlert = [NSAlert alertWithMessageText:@"Remove Item" defaultButton:@"Remove" alternateButton:@"Cancel" otherButton:nil informativeTextWithFormat:@"Would you remove %@ from Shopping List Items?", stringToRemove];
        if ([removeAlert runModal] == NSAlertDefaultReturn){
            [shoppingListArray removeObjectAtIndex:rowToRemove];
            [shoppingListTableView reloadData];
        }
    }
    else{
        NSAlert *nothingToRemoveAlert = [NSAlert alertWithMessageText:@"Error" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"There is nothing to remove"];
        [nothingToRemoveAlert runModal];
    }
}

//implementation for tableview protocol
-(NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return [shoppingListArray count];
}

-(id)tableView:(NSTableView *)aTableView
        objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    if (aTableView == shoppingListTableView){
        NSString *stringToReturn = [shoppingListArray objectAtIndex:row];
        return stringToReturn;
    }
    else{
        return nil;
    }
}

-(void)tableView:(NSTableView *)aTableView
        setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    if (aTableView == shoppingListTableView){
        [shoppingListArray setObject:object atIndexedSubscript:row];
    }
    else{

    }
}


- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace {
    return YES;
}

- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return YES;
}

@end
