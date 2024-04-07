//
//  ModalSheetViewModifier.swift
//
//
//  Created by Eric Golovin on 11/01/2024.
//

import SwiftUI

public extension View {
    
    func modalSheet<Content: View>(
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        modifier(ModalSheetModifier<Content>(isPresented: isPresented, onDismiss: onDismiss, sheetContent: content))
    }
    
    func modalSheet<Item: Identifiable, Content: View>(
        item: Binding<Item?>,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping (Item) -> Content
    ) -> some View {
        modifier(ModalSheetItemModifier<Item, Content>(item: item, onDismiss: onDismiss, sheetContent: content))
    }
    
    func modalSheet<Path: Identifiable, Content: View>(
        container: Binding<SheetContainer<Path>>,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping (Path) -> Content
    ) -> some View {
        modifier(ModalSheetItemModifier<Path, Content>(item: container.path, onDismiss: onDismiss, sheetContent: content))
    }
}

private struct ModalSheetModifier<SheetContent: View>: ViewModifier {
    
    @Environment(\.modalSheetState)
    private var modalSheetState: PresentationState
    
    let isPresented: Binding<Bool>
    let onDismiss: (() -> Void)?
    let sheetContent: () -> SheetContent
    
    func body(content: Content) -> some View {
        content
            .sheet(
                isPresented: isPresented,
                onDismiss: {
                    modalSheetState.isPresented = false
                    onDismiss?()
                },
                content: {
                    sheetContent()
                        .onLoad {
                            modalSheetState.isPresented = true
                        }
                }
            )
    }
}

private struct ModalSheetItemModifier<Item: Identifiable, SheetContent: View>: ViewModifier {
    
    @Environment(\.modalSheetState)
    private var modalSheetState: PresentationState
    
    let item: Binding<Item?>
    let onDismiss: (() -> Void)?
    let sheetContent: (Item) -> SheetContent
    
    init(
        item: Binding<Item?>,
        onDismiss: (() -> Void)?,
        sheetContent: @escaping (Item) -> SheetContent
    ) {
        self.item = item
        self.onDismiss = onDismiss
        self.sheetContent = sheetContent
    }
    
    func body(content: Content) -> some View {
        content
            .sheet(
                item: item,
                onDismiss: {
                    modalSheetState.isPresented = false
                    onDismiss?()
                },
                content: { item in
                    sheetContent(item)
                        .onLoad {
                            modalSheetState.isPresented = true
                        }
                }
            )
    }
}
