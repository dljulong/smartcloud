package com.julong.cloud.smartcommon.exception;


import com.julong.cloud.smartcommon.constant.CommonConstants;

/**
 * Created by ace on 2017/9/8.
 */
public class UserTokenException extends BaseException {
    public UserTokenException(String message) {
        super(message, CommonConstants.EX_USER_INVALID_TOKEN);
    }
}
