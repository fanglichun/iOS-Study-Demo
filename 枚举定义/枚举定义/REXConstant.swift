//
//  REXConstant.swift
//  枚举定义
//
//  Created by mfang032 on 3/22/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

enum SDETransitionType {
    //UINavigationControllerOperation 是枚举类型，有 None, Push, Pop 三种值。
    case NavigationTransition(UINavigationControllerOperation)
    case TabTransition(TabOperationDirection)
    case ModalTransition(ModalOperation)
}

enum TabOperationDirection{
    case Left, Right
}

enum ModalOperation{
    case Presentation, Dismissal
}
