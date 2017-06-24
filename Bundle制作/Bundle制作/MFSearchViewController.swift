//
//  MFSearchViewController.swift
//  Bundle制作
//
//  Created by mfang032 on 2017/6/14.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

enum MFHotSearchStyle: NSInteger {
    case normal
    case colorful
    case border
    case rank
    case rectange
    case `default`
}

enum MFSearchHistoryStyle {
    case cell
    case normal
    case colorful
    case border
    case ARCBorder
    case `default`
}

enum MFSearchResultShowMode {
    case custom
    case embed
    case push
    case `default`
}

enum Expression {
    case num(Int)
    indirect case add(Expression, Expression)
    indirect case mul(Expression, Expression)
    
    func calculateResult(_ param: Expression) ->Int {
        switch param {
        case .num(let value):
            return value
        case .add(let one, let two):
            return calculateResult(one) + calculateResult(two)
        case .mul(let one, let two):
            return calculateResult(one) * calculateResult(two)
        }
    }
}


@objc public protocol MFSearchViewControllerDataSource: NSObjectProtocol {
    
    @objc optional func search(_ suggestionView: UITableView, numberOfRowsInSection section: Int) -> Int
    @objc optional func numberOfSections(in searchSuggestionView: UITableView) ->Int
    @objc optional func search(_ suggestionView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    @objc optional func search(_ suggestionView: UITableView, heightForRowAt indexPath: IndexPath) ->CGFloat
}

@objc protocol MFSearchViewControllerDelegate: NSObjectProtocol {
    
    @objc optional func search(_ viewController: MFSearchViewController, didSearchWith searchBar: UISearchBar, searchWith text: String)
    
    @objc optional func search(_ viewController: MFSearchViewController, didSelectSearchHotSearchAt index: NSInteger, searchWith text: String)
    
    @objc optional func search(_ viewController: MFSearchViewController, didSelectSearchHistoryAt index: NSInteger, searchWith text: String)
    
    @objc optional func search(_ viewController: MFSearchViewController, didSelectSearchSuggestionAt index: NSInteger, searchWith text: String)
    
    @objc optional func search(_ viewController: MFSearchViewController, didSelectSearchSuggestionAt indexPath: IndexPath, with searchBar: UISearchBar)
    
    @objc optional func search(_ viewController: MFSearchViewController, searchTextDidChange searchBar: UISearchBar, searchWith text: String)
    
    func didClickCancel(_ searchViewController: MFSearchViewController)
    
}


typealias didSearchBlcok = (_ searchViewController: MFSearchViewController, _ searchBar: UISearchBar, _ searchText: String) ->()


@objc protocol Transaction {
    func commit() -> Bool
    @objc optional func isComplete() -> Bool
}


class MFSearchViewController: UIViewController {
    
    weak var delegate: MFSearchViewControllerDelegate?
    weak var dataSource: MFSearchViewControllerDataSource?
    
    var rankTagBackgroundColorHexStrings = Array<String>()
    var colorPool:[UIColor] = Array()
    var isSwapHotSeachWithSearchHistory = false
    
    var hotSearches:[String] = Array()
    var hotSearchTags: [UILabel] = Array()
    var isShowHotSearch = true
    var hotSearchTitle: String?
    var hotSearchStype:MFHotSearchStyle = .normal
    
    
    var searchHistoryTags: [UILabel] = Array()
    weak var searchHistoryHeader: UILabel?
    var searchHistoryTitle: String?
    var isShowSearchHistory = false
    var searchHistoriesCachePath: String?
    var searchHistoriesCount: NSInteger = 20
    var searchHistoryStyle: MFSearchHistoryStyle = .cell
    
    weak var emptyButton: UIButton?
    weak var emptySearchHistoryLabel: UILabel?
    
    var searchResultShowMode: MFSearchResultShowMode = .custom
    
    weak var searchBar: UISearchBar?
    var searchBarBackgroundColor: UIColor?
    
    weak private(set) var searchSuggestionView: UITableView?
    
    var didSearchBlock: didSearchBlcok?
    var searchSuggestions: [String] = Array()
    var isSearchSuggestionHidden = false
    
    var searchResultController: UIViewController?
    var showSearchResultWhenSearchTextChanged = false
    var showSearchResultWhenSearchBarRefocused = false
    
    fileprivate weak var headerView: UIView?
    fileprivate weak var hotSearchView: UIView?
    fileprivate weak var searchHistoryView: UIView?
    fileprivate var searchHistories: [String] = Array()
    fileprivate var isKeyboardShowing = false
    fileprivate var keyboardHeight: CGFloat = 0.0
    
    convenience init(with hotSearches: [String], searchBarPlaceholder placeholder: String) {
        self.init()
    }
    
    convenience init(with hotSearches: [String], searchBarPlaceholder placeholder: String, didSeachBlcok block: didSearchBlcok ) {
        self.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    convenience init() {
        self.init()
        self.hotSearchStype = .default
        self.searchHistoryStyle = .default
        self.searchResultShowMode = .default
        searchResultShowMode = .default
        isSearchSuggestionHidden = false
        searchHistoriesCachePath = ""
        searchHistoriesCount = 20
        isShowSearchHistory = true
        isShowHotSearch = true
        showSearchResultWhenSearchTextChanged = false
        showSearchResultWhenSearchBarRefocused = false
    }
    
    init(isShowSearchHistory: Bool) {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        let stype = MFSearchHistoryStyle.ARCBorder.hashValue
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
