package com.example.boardinfo.service.admin;

import com.example.boardinfo.model.admin.dto.AdminDTO;
import com.example.boardinfo.model.game.dto.GameDTO;
import com.example.boardinfo.model.game.dto.gameRating.GameRatingDTO;
import com.example.boardinfo.model.member.dto.MemberDTO;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface AdminService {
    List<AdminDTO> getAdminList();
    /*admin 로그인*/
    boolean loginCheck(AdminDTO aDto, HttpSession session);
    boolean checkPw(String admin_id, String passwd);


    boolean getDelValue(String admin_id);

    void logout(HttpSession session);

    boolean checkDuplicateId(String admin_id);

    boolean checkDuplicateNick(String nickname);

    /*admin crud*/
    void insertAdmin(AdminDTO aDto);
    void insertAdmin(AdminDTO aDto, HttpServletResponse response, MultipartFile profile_img);

    AdminDTO viewAdmin(String admin_id);

    /*admin U 파일첨부 있을 때와 없을 때*/
    void updateAdmin(AdminDTO aDto, HttpSession session);
    void updateAdmin(AdminDTO aDto, HttpServletResponse response, MultipartFile profileImg, HttpSession session);

    void deleteAdmin(String admin_id, HttpSession session);
    
    /*member 관련*/
    List<MemberDTO> getMemberlist();
    /*member보기*/
    AdminDTO viewMember(String admin_id);

    /*member 재제*/
    void memberWarn(String userid);

    void memberBlock(String userid);

    /*어드민 대시보드 보기*/
    void moveToAdminDashboard();

    /*게임 정보 통계*/
    void gameStatistics();
    /*회원 활동 통계*/
    void memberStatistics();
    /*리뷰 통계*/
    void reviewStatistics();

    List<GameRatingDTO> gameRatinglist(String userid);

    Map<String, Object> confirmList(int curPage, String sort);

    void deleteitem(String filter, int num);

    void denyGame(int gnum, String userid);

    void allowGame(GameDTO dto);

    void deleteGameAdmin(int gnum, String admin_id);

    Map<String, Object> getMemberList(int curPage);

    Map<String, Object> getAdminTabList();

    Map<String, Object> getAllReListTab(int curPage);
}
