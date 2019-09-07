//
//  PCStatefulVCState.h
//  OSStateViewDemo
//
//  Created by wuguanyu on 2019/8/30.
//  Copyright © 2019 wuguanyu. All rights reserved.
//

#import "PCState.h"

NS_ASSUME_NONNULL_BEGIN

@interface PCStatefulVCContentState : PCState
@end

@interface PCStatefulVCLoadingState : PCState
@end

@interface PCStatefulVCErrorState : PCState
@end

@interface PCStatefulVCEmptyState : PCState
@end

NS_ASSUME_NONNULL_END
