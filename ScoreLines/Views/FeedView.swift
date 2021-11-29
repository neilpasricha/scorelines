//
//  FeedView.swift
//  Localist
//
//  Created by Steven Tran on 9/26/20.
//  Copyright © 2020 Localist. All rights reserved.
//

import SwiftUI
import Request
import SlideOverCard

struct FeedView: View {
    let categories = ["Deals":1, "Happy Hour":2, "Recreation":3, "What's Happening?":4, "Misc":5]

    @State private var sortBy: SortBy = .hot
    @State private var showSortSheet: Bool = false
    @State private var showSubmitPost: Bool = false
    @State private var showCreateUser: Bool = false
    @State private var post_content: String = ""
    @State private var position = CardPosition.bottom
    @State private var isMenu: Bool = false
    @State private var currCategory: String = ""
    @State private var isShowing = false
    
    @Binding var category: String
    
    @EnvironmentObject var userAuth: UserAuth
    @EnvironmentObject var locationViewModel: LocationViewModel
    @EnvironmentObject var categoryGlobal: Category
    
    var body: some View
    {
        
            
        if #available(iOS 14.0, *) {
            ScrollView{
            VStack{
                
                GameFrame()
                GameFrame()
                GameFrame()
                GameFrame()
                GameFrame()
                GameFrame()
            }
            }
            .padding()
            
            .offset(y:80)
            .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.85)
            .padding(.bottom, UIScreen.main.bounds.height*0.18)
        } else {
            // Fallback on earlier versions
        }
            
        
//        let self.category_global.currCategory = category //issue here
    }
    
}




struct UITextViewWrapper: UIViewRepresentable {
    typealias UIViewType = UITextView

    @Binding var text: String
    @Binding var calculatedHeight: CGFloat
    var onDone: (() -> Void)?

    func makeUIView(context: UIViewRepresentableContext<UITextViewWrapper>) -> UITextView {
        let textField = UITextView()
        textField.delegate = context.coordinator
        textField.isEditable = true
        textField.font = UIFont.preferredFont(forTextStyle: .body)
        textField.isSelectable = true
        textField.isUserInteractionEnabled = true
        textField.isScrollEnabled = false
        textField.backgroundColor = UIColor.clear
        
        if nil != onDone {
            textField.returnKeyType = .done
        }

        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        return textField
    }

    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<UITextViewWrapper>) {
        if uiView.text != self.text {
            uiView.text = self.text
        }
        
        if uiView.window != nil, !uiView.isFirstResponder {
            uiView.becomeFirstResponder()
        }
        
        UITextViewWrapper.recalculateHeight(view: uiView, result: $calculatedHeight)
    }

    fileprivate static func recalculateHeight(view: UIView, result: Binding<CGFloat>)
    {
        let newSize = view.sizeThatFits(CGSize(width: view.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        
        if result.wrappedValue != newSize.height
        {
            DispatchQueue.main.async
            {
                result.wrappedValue = newSize.height // !! must be called asynchronously
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text, height: $calculatedHeight, onDone: onDone)
    }

    final class Coordinator: NSObject, UITextViewDelegate
    {
        var text: Binding<String>
        var calculatedHeight: Binding<CGFloat>
        var onDone: (() -> Void)?

        init(text: Binding<String>, height: Binding<CGFloat>, onDone: (() -> Void)? = nil)
        {
            self.text = text
            self.calculatedHeight = height
            self.onDone = onDone
        }

        func textViewDidChange(_ uiView: UITextView)
        {
            text.wrappedValue = uiView.text
            UITextViewWrapper.recalculateHeight(view: uiView, result: calculatedHeight)
        }

        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
        {
            if let onDone = self.onDone, text == "\n"
            {
                textView.resignFirstResponder()
                onDone()
                return false
            }
            return true
        }
    }
}

struct MultilineTextField: View {
    @State private var dynamicHeight: CGFloat = 100
    @State private var showingPlaceholder = false
    
    private var placeholder: String
    private var onCommit: (() -> Void)?

    @Binding private var text: String
    private var internalText: Binding<String> {
        Binding<String>(get: { self.text } ) {
            self.text = $0
            self.showingPlaceholder = $0.isEmpty
        }
    }

    init (_ placeholder: String = "", text: Binding<String>, onCommit: (() -> Void)? = nil) {
        self.placeholder = placeholder
        self.onCommit = onCommit
        self._text = text
        self._showingPlaceholder = State<Bool>(initialValue: self.text.isEmpty)
    }

    var body: some View {
        UITextViewWrapper(text: self.internalText, calculatedHeight: $dynamicHeight, onDone: onCommit)
            .frame(minHeight: dynamicHeight, maxHeight: dynamicHeight)
            .background(placeholderView, alignment: .topLeading)
    }

    var placeholderView: some View
    {
        Group
        {
            if showingPlaceholder
            {
                Text(placeholder).foregroundColor(.gray)
                    .padding(.leading, 4)
                    .padding(.top, 8)
            }
        }
    }
}

//
//  FeedView.swift
//  Localist
//
//  Created by Steven Tran on 9/26/20.
//  Copyright © 2020 Localist. All rights reserved.
//
//import SwiftUI
//import Request
//import SlideOverCard
//
//struct FeedView: View {
//    let categories = ["Deals":1, "Happy Hour":2, "Recreation":3, "What's Happening?":4, "Misc":5]
//
//    @State private var sortBy: SortBy = .hot
//    @State private var showSortSheet: Bool = false
//    @State private var showSubmitPost: Bool = false
//    @State private var showCreateUser: Bool = false
//    @State private var post_content: String = ""
//    @State private var position = CardPosition.bottom
//    @State private var isMenu: Bool = false
//    @State private var currCategory: String = ""
//    @State private var isShowing = false
//
//    @Binding var category: String
//
//    @EnvironmentObject var userAuth: UserAuth
//    @EnvironmentObject var locationViewModel: LocationViewModel
//    @EnvironmentObject var categoryGlobal: Category
//
//    var body: some View
//    {
//
//
//        if #available(iOS 14.0, *) {
//            List{
//                ForEach(categoryGlobal.posts[categoryGlobal.categoriesMap[category]! - 1]){post in
//                PostView(post: post)
//                    .listRowBackground(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
//
//                }
//            }
//
//            .background(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
//            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//            .pullToRefresh(isShowing: $isShowing) {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                    locationViewModel.retriveCurrentLocation()
//                    categoryGlobal.refreshCategory(category: categoryGlobal.currCategory, longitude: locationViewModel.userLongitude , latitude: locationViewModel.userLatitude)
//                    self.isShowing = false
//                }
//            }.onChange(of: self.isShowing){value in
//                //categoryGlobal.fetchData()
//               // print("oops")
//               // categoryGlobal.refreshCategory(category: categoryGlobal.currCategory)
//            }
//        } else {
//            // Fallback on earlier versions
//        }
//
//
////        let self.category_global.currCategory = category //issue here
//    }
//
//}
//
//
//
//
//struct UITextViewWrapper: UIViewRepresentable {
//    typealias UIViewType = UITextView
//
//    @Binding var text: String
//    @Binding var calculatedHeight: CGFloat
//    var onDone: (() -> Void)?
//
//    func makeUIView(context: UIViewRepresentableContext<UITextViewWrapper>) -> UITextView {
//        let textField = UITextView()
//        textField.delegate = context.coordinator
//        textField.isEditable = true
//        textField.font = UIFont.preferredFont(forTextStyle: .body)
//        textField.isSelectable = true
//        textField.isUserInteractionEnabled = true
//        textField.isScrollEnabled = false
//        textField.backgroundColor = UIColor.clear
//
//        if nil != onDone {
//            textField.returnKeyType = .done
//        }
//
//        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
//
//        return textField
//    }
//
//    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<UITextViewWrapper>) {
//        if uiView.text != self.text {
//            uiView.text = self.text
//        }
//
//        if uiView.window != nil, !uiView.isFirstResponder {
//            uiView.becomeFirstResponder()
//        }
//
//        UITextViewWrapper.recalculateHeight(view: uiView, result: $calculatedHeight)
//    }
//
//    fileprivate static func recalculateHeight(view: UIView, result: Binding<CGFloat>)
//    {
//        let newSize = view.sizeThatFits(CGSize(width: view.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
//
//        if result.wrappedValue != newSize.height
//        {
//            DispatchQueue.main.async
//            {
//                result.wrappedValue = newSize.height // !! must be called asynchronously
//            }
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(text: $text, height: $calculatedHeight, onDone: onDone)
//    }
//
//    final class Coordinator: NSObject, UITextViewDelegate
//    {
//        var text: Binding<String>
//        var calculatedHeight: Binding<CGFloat>
//        var onDone: (() -> Void)?
//
//        init(text: Binding<String>, height: Binding<CGFloat>, onDone: (() -> Void)? = nil)
//        {
//            self.text = text
//            self.calculatedHeight = height
//            self.onDone = onDone
//        }
//
//        func textViewDidChange(_ uiView: UITextView)
//        {
//            text.wrappedValue = uiView.text
//            UITextViewWrapper.recalculateHeight(view: uiView, result: calculatedHeight)
//        }
//
//        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
//        {
//            if let onDone = self.onDone, text == "\n"
//            {
//                textView.resignFirstResponder()
//                onDone()
//                return false
//            }
//            return true
//        }
//    }
//}
//
//struct MultilineTextField: View {
//    @State private var dynamicHeight: CGFloat = 100
//    @State private var showingPlaceholder = false
//
//    private var placeholder: String
//    private var onCommit: (() -> Void)?
//
//    @Binding private var text: String
//    private var internalText: Binding<String> {
//        Binding<String>(get: { self.text } ) {
//            self.text = $0
//            self.showingPlaceholder = $0.isEmpty
//        }
//    }
//
//    init (_ placeholder: String = "", text: Binding<String>, onCommit: (() -> Void)? = nil) {
//        self.placeholder = placeholder
//        self.onCommit = onCommit
//        self._text = text
//        self._showingPlaceholder = State<Bool>(initialValue: self.text.isEmpty)
//    }
//
//    var body: some View {
//        UITextViewWrapper(text: self.internalText, calculatedHeight: $dynamicHeight, onDone: onCommit)
//            .frame(minHeight: dynamicHeight, maxHeight: dynamicHeight)
//            .background(placeholderView, alignment: .topLeading)
//    }
//
//    var placeholderView: some View
//    {
//        Group
//        {
//            if showingPlaceholder
//            {
//                Text(placeholder).foregroundColor(.gray)
//                    .padding(.leading, 4)
//                    .padding(.top, 8)
//            }
//        }
//    }
//}
