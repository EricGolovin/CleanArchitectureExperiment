//
//  FullScreenSheetModifier.swift
//
//
//  Created by Eric Golovin on 10/01/2024.
//

import SwiftUI

public extension View {

    func fullScreenSheet<Content: View>(
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        modifier(FullScreenSheetModifier<Content>(isPresented: isPresented, onDismiss: onDismiss, sheetContent: content))
    }

    func fullScreenSheet<Item: Identifiable, Content: View>(
        item: Binding<Item?>,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping (Item) -> Content
    ) -> some View {
        modifier(FullScreenSheetItemModifier<Item, Content>(item: item, onDismiss: onDismiss, sheetContent: content))
    }
    
    func fullScreenSheet<Path: Hashable, Content: View>(
        container: Binding<SheetContainer<Path>>,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping (SheetContainer<Path>.IdentifiableAdapter) -> Content
    ) -> some View {
        modifier(FullScreenSheetItemModifier<SheetContainer<Path>.IdentifiableAdapter, Content>(item: container.path, onDismiss: onDismiss, sheetContent: content))
    }
}

private struct FullScreenSheetModifier<SheetContent: View>: ViewModifier {

    @Environment(\.fullScreenSheetState)
    private var fullScreenSheetState: PresentationState

    let isPresented: Binding<Bool>
    let onDismiss: (() -> Void)?
    let sheetContent: () -> SheetContent

    func body(content: Content) -> some View {
        content
            .fullScreenCover(
                isPresented: isPresented,
                onDismiss: {
                    fullScreenSheetState.isPresented = false
                    onDismiss?()
                },
                content: {
                    sheetContent()
                        .onLoad {
                            fullScreenSheetState.isPresented = true
                        }
                }
            )
    }
}

private struct FullScreenSheetItemModifier<Item: Identifiable, SheetContent: View>: ViewModifier {

    @Environment(\.fullScreenSheetState)
    private var fullScreenSheetState: PresentationState

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
            .fullScreenCover(
                item: item,
                onDismiss: {
                    fullScreenSheetState.isPresented = false
                    onDismiss?()
                },
                content: { item in
                    sheetContent(item)
                        .onLoad {
                            fullScreenSheetState.isPresented = true
                        }
                }
            )
    }
}
