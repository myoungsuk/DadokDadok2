package com.multi.mini6.loginpage.service;//package com.multi.mini6.service;

import com.multi.mini6.loginpage.PathUtil;
import com.multi.mini6.loginpage.dao.MemberDAO;
import com.multi.mini6.loginpage.vo.MemberDeleteReasonVO;
import com.multi.mini6.loginpage.vo.MemberVO;
import com.multi.mini6.loginpage.vo.PasswordChangeDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import static java.awt.SystemColor.info;

@Service
@RequiredArgsConstructor
@Log4j2
public class MemberService {

    private final MemberDAO memberDAO;
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    public List<MemberVO> getMemberList() {
        return memberDAO.getMemberList();
    }

    @Transactional
    public void insertMember(MemberVO memberVO) {
        memberDAO.insertMember(memberVO);
        memberDAO.insertMemberAuthority(memberVO);
    }

    public boolean checkEmail(String email) {
        return memberDAO.checkEmail(email) > 0;
    }

    public MemberVO getMember(String email) {
        return memberDAO.getMember(email);
    }

    public MemberVO getMemberById(int memberId) {
        return memberDAO.getMemberById(memberId);
    }

    public void updateMember(MemberVO member) {
//        member.setPassword(passwordEncoder.encode(member.getPassword()));
        memberDAO.updateMember(member);
    }

    //비밀번호 변경
//    public void changePassword(String email, String password) {
//        Map<String, Object> params = new HashMap<>();
//        params.put("email", email);
//        params.put("password", passwordEncoder.encode(password));
//        memberDAO.changePassword(params);
//    }
    @Transactional
    public boolean changePassword(String email, PasswordChangeDTO dto) {

        dto.setEmail(email);
        // 데이터베이스에서 현재 사용자의 해시된 비밀번호를 가져옵니다.
        String currentHashedPassword = memberDAO.getCurrentHashedPassword(email);

        // 현재 비밀번호가 일치하는지 확인합니다.
        if (!passwordEncoder.matches(dto.getCurrentPassword(), currentHashedPassword)) {
            log.info("currentHashedPassword: " + currentHashedPassword);
            return false; // 현재 비밀번호가 일치하지 않습니다.
        }

        // 새 비밀번호와 확인용 새 비밀번호가 일치하는지 확인합니다.
        if (!dto.getNewPassword().equals(dto.getConfirmNewPassword())) {
            log.info("newPassword: " + dto.getNewPassword());
            return false; // 새 비밀번호들이 일치하지 않습니다.
        }

        // 모든 검사를 통과했다면 비밀번호 변경을 진행합니다.
        // 새 비밀번호를 암호화합니다.
        String encryptedNewPassword = passwordEncoder.encode(dto.getNewPassword());
        log.info("encryptedNewPassword: " + encryptedNewPassword);

        dto.setNewPassword(encryptedNewPassword);
        log.info("dto.getNewPassword(): " + dto.getNewPassword());

        // 암호화된 새 비밀번호로 데이터베이스를 업데이트합니다.
        memberDAO.changePassword(dto);
        log.info("비밀번호 변경 완료");

        return true;
    }


    @Transactional
    public void saveProfileImage(MultipartFile profileImage, String email) {
        if (!profileImage.isEmpty()) {
            try {
                // 데이터베이스에서 기존 이미지 경로를 가져옵니다.
                String existingImagePath = memberDAO.getProfileImgPathByEmail(email);

                // 기존 이미지가 있으면 파일 시스템에서 삭제합니다.
                if (existingImagePath != null && !existingImagePath.isEmpty()) {
                    Path pathToDelete = Paths.get(existingImagePath);
                    if (Files.exists(pathToDelete)) {
                        Files.delete(pathToDelete);
                    }
                }

                // 새 이미지 파일을 저장하고 경로를 반환받습니다.
                String newFilePath = PathUtil.writeImageFile(profileImage, email);

                // 데이터베이스에 새 프로필 이미지 경로를 저장합니다.
                Map<String, Object> params = new HashMap<>();
                params.put("email", email);
                params.put("userImg", newFilePath); // 저장된 파일의 전체 경로
                memberDAO.updateProfileImg(params);

            } catch (IOException e) {
                throw new RuntimeException("프로필 이미지 저장 실패", e);
            }
        }
    }


    //    public void updateProfileImg(MultipartFile profileImg) {
//
//        String uuidImageName = PathUtil.writeImageFile(profileImg);
//        memberDAO.updateProfileImg(uuidImageName);
//    }
    @Transactional
    public void deleteMember(int id, String email, Optional<String> feedback) {

        // 탈퇴 이유 저장 (이유가 제공된 경우에만 저장)
        feedback.ifPresent(reason -> {
            MemberDeleteReasonVO memberDeleteReasonVO = new MemberDeleteReasonVO();
            memberDeleteReasonVO.setDeleteEmail(email);
            memberDeleteReasonVO.setMemberDeleteReason(reason);
            memberDAO.insertMemberDeleteReason(memberDeleteReasonVO);
        });

        memberDAO.deleteMemberAuthority(email);
        memberDAO.deleteMember(id);
    }


//    @Override
//    public PasswordEncoder passwordEncoder() {
//        return this.passwordEncoder;
//    }


//    public boolean isPasswordMatched(String rawPassword, String encodedPassword) {
//        return passwordEncoder.matches(rawPassword, encodedPassword);
//    }

}
