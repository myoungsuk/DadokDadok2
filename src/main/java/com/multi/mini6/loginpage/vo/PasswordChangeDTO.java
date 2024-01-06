package com.multi.mini6.loginpage.vo;

import lombok.Data;
import lombok.extern.log4j.Log4j2;

@Data
public class PasswordChangeDTO {
    private String email;
    private String currentPassword;
    private String newPassword;
    private String confirmNewPassword;
}
