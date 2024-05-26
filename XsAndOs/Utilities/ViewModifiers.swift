//
//  ViewModifiers.swift
//  XsAndOs
//
//  Created by Farid Bastoros on 2024-05-25.
//

import SwiftUI

struct NavStackContainer: ViewModifier {
    
    func body(content: Content) -> some View {
        if #available (iOS 16, *){
            NavigationStack{
                content
            }
        } else { NavigationView {content}.navigationViewStyle(.stack)}
    }
}

extension View {
    public func inNavigationStack() -> some View {
        return self.modifier(NavStackContainer())
    }
}
