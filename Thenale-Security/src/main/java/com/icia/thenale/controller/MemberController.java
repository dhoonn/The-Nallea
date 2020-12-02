package com.icia.thenale.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.icia.thenale.api.KakaoJoinApi;
import com.icia.thenale.api.KakaoLoginApi;
import com.icia.thenale.api.NaverJoinApi;
import com.icia.thenale.api.NaverLoginApi;
import com.icia.thenale.dto.FoodDTO;
import com.icia.thenale.dto.HotelDTO;
import com.icia.thenale.dto.MemberDTO;
import com.icia.thenale.dto.PlaceDTO;
import com.icia.thenale.service.IndexListService;
import com.icia.thenale.service.MemberService;

@Controller
public class MemberController {


	@Autowired
	private HttpSession session;

	@Autowired
	private KakaoJoinApi kakaoJoinApi;

	@Autowired
	private KakaoLoginApi kakaoLoginApi;

	@Autowired
	private NaverJoinApi naverJoinApi;

	@Autowired
	private NaverLoginApi naverLoginApi;
	
	@Autowired
	private IndexListService iService;
	
	@Autowired
	private MemberService mService;
	private ModelAndView mav;

	@Inject // 서비스를 호출하기 위해서 의존성을 주입
	JavaMailSender mailSender; // 메일 서비스를 사용하기 위해 의존성을 주입함.

	// 로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private static final String String = null;

	@RequestMapping(value = "/index")
	public String gohome() {
		return "index";
	}

	// 이메일 화면
	@RequestMapping(value = "/goemail")
	public String gomail() {
		return "memberv/email";
	}

	// 가입 페이지 이동
	@RequestMapping(value = "/memberjoinform")
	public String join() {
		return "memberv/memberjoin";
	}

	// 카카오 페이
	@RequestMapping(value = "/tests")
	public String gotest() {
		return "testv/kakao";
	}

	// 지도 페이지 이동
	@RequestMapping(value = "/goMap")
	public String goMap() {
		return "mapv/map";
	}

	// 일정 페이지 이동
	@RequestMapping(value = "/membercalender")
	public ModelAndView calender(@ModelAttribute HotelDTO hotel, FoodDTO food, PlaceDTO place) {
		mav = iService.calendar(hotel, food, place);
		return mav;
	}

	// 회원가입
	@RequestMapping(value = "/memberjoin")
	public ModelAndView memberJoin(@ModelAttribute MemberDTO member) throws IllegalStateException, IOException {
		mav = mService.memberJoin(member);
		return mav;
	}

	// 로그인 페이지 이동
	@RequestMapping(value = "/memberloginform")
	public String login() {
		return "memberv/memberlogin";
	}

	// 로그인
	@RequestMapping(value = "/memberlogin")
	public ModelAndView memberLogin(@ModelAttribute MemberDTO member) {
		mav = mService.memberLogin(member);
		return mav;
	}

	// 내 정보 보러가기
	@RequestMapping(value = "/mypage")
	public ModelAndView memberView(@RequestParam("m_id") String m_id) {
		mav = mService.memberView(m_id);
		return mav;
	}

	// 정보 수정하기
	@RequestMapping(value = "/updateform")
	public ModelAndView memberUpdate(@RequestParam("m_id") String m_id) {
		mav = mService.memberUpdate(m_id);
		return mav;
	}

	// 멤버 수정 목록
	@RequestMapping(value = "/memberupdateprocess")
	public ModelAndView memberUpdateProcess(@ModelAttribute MemberDTO member)
			throws IllegalStateException, IOException {
		mav = mService.memberUpdateProcess(member);
		return mav;
	}

	// 로그아웃
	@RequestMapping(value = "/memberlogout")
	public String memberLogout() {
		session.invalidate();
		return "index2";
	}

	// 카카오 서버에 로그인 화면 출력
	@RequestMapping(value = "/kakaojoin")
	public ModelAndView kakaoJoin(HttpSession session) {
		String kakaoUrl = kakaoJoinApi.getAuthorizationUrl(session);
		mav = new ModelAndView();
		mav.addObject("kakaoUrl", kakaoUrl);
		mav.setViewName("memberv/KakaoLogin2");
		return mav;

	}

	// 카카오 아이디 불러오기
	@RequestMapping(value = "/kakaojoinOK")
	public ModelAndView kakaoJoinOK(@RequestParam("code") String code, HttpSession session) {
		JsonNode token = kakaoJoinApi.getAccessToken(code);
		JsonNode profile = kakaoJoinApi.getKakaoUserInfo(token.path("access_token"));
		String m_k_id = profile.get("id").asText();
		mav = new ModelAndView();
		mav.addObject("m_k_id", m_k_id);
		mav.setViewName("memberv/memberjoin");
		return mav;
	}

	// 카카오 로그인 오청
	@RequestMapping(value = "/kakaologin")
	public ModelAndView kakaoLogin(HttpSession session) {
		String kakaoUrl = kakaoLoginApi.getAuthorizationUrl(session);

		mav = new ModelAndView();
		mav.addObject("kakaoUrl", kakaoUrl);
		mav.setViewName("memberv/KakaoLogin");

		return mav;
	}

	// 카카오 로그인 OK
	@RequestMapping(value = "/kakaologinOK")
	public ModelAndView kakaoLoginOK(@RequestParam("code") String code) {
		JsonNode token = kakaoLoginApi.getAccessToken(code);
		JsonNode profile = kakaoLoginApi.getKakaoUserInfo(token.path("access_token"));
		mav = mService.kakaoLogin(profile);
		return mav;
	}

	// 네이버 서버 로그인
	@RequestMapping(value = "/naverjoin")
	public ModelAndView naverJoin(HttpSession session) {
		String naverUrl = naverJoinApi.getAuthorizationUrl(session);
		mav = new ModelAndView();
		mav.addObject("naverUrl", naverUrl);
		mav.setViewName("memberv/NaverLogin2");

		return mav;

	}

	// 네이버 서버인증 아이디 받아오기
	@RequestMapping(value = "/naverjoinok")
	public ModelAndView naverJoinOK(@RequestParam("code") String code, @RequestParam("state") String state,
			HttpSession session) throws IOException, ParseException {
		mav = new ModelAndView();
		OAuth2AccessToken oauthToken = naverJoinApi.getAccessToken(session, code, state);
		String profile = naverJoinApi.getUserProfile(oauthToken);
		JSONParser parser = new JSONParser();

		Object obj = parser.parse(profile);

		JSONObject naverUser = (JSONObject) obj;
		JSONObject userInfo = (JSONObject) naverUser.get("response");
		String m_n_id = (String) userInfo.get("id");

		mav.addObject("m_n_id", m_n_id);
		mav.setViewName("memberv/memberjoin");

		return mav;
	}

	// 네이버 로그인 요청
	@RequestMapping(value = "/naverlogin")
	public ModelAndView naverLogin(HttpSession session) {
		String naverUrl = naverLoginApi.getAuthorizationUrl(session);
		mav = new ModelAndView();
		mav.addObject("naverUrl", naverUrl);
		mav.setViewName("memberv/NaverLogin");

		return mav;
	}

	// 네이버 로그인 OK
	@RequestMapping(value = "/naverloginok")
	public ModelAndView naverLoginOk(@RequestParam("code") String code, @RequestParam("state") String state,
			HttpSession session) throws ParseException, IOException {
		OAuth2AccessToken aouthToken = naverLoginApi.getAccessToken(session, code, state);
		String profile = naverLoginApi.getUserProfile(aouthToken);
		mav = mService.naverLogin(profile);

		return mav;
	}

	// mailSending 코드
	@RequestMapping(value = "/auth_do", method = RequestMethod.POST)
	public ModelAndView mailSending(HttpServletRequest request, String m_email, HttpServletResponse responsem_email)
			throws IOException {

		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)

		String setfrom = "vskyking007@gamil.com";
		String tomail = request.getParameter("m_email"); // 받는 사람 이메일
		String title = "회원가입 인증 이메일 입니다."; // 제목
		String content =

				System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

						System.getProperty("line.separator") +

						"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						" 인증번호는 " + dice + " 입니다. "

						+ System.getProperty("line.separator") +

						System.getProperty("line.separator") +

						"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		ModelAndView mv = new ModelAndView(); // ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
		mv.setViewName("/memberv/memberjoin"); // 뷰의이름
		mv.addObject("dice", dice);

		System.out.println("mv : " + mv);

		responsem_email.setContentType("text/html; charset=UTF-8");
		PrintWriter out_email = responsem_email.getWriter();
		out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		out_email.flush();

		return mv;

	}

//이메일 인증 페이지 맵핑 메소드
	@RequestMapping("/memberv/email.do")
	public String email() {
		return "memberv/email";
	}

//이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
//내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
//틀리면 다시 원래 페이지로 돌아오는 메소드
	@RequestMapping(value = "/join_injeung.do{dice}", method = RequestMethod.POST)
	public ModelAndView join_injeung(String email_injeung, @PathVariable String dice,
			HttpServletResponse response_equals) throws IOException {

		System.out.println("마지막 : email_injeung : " + email_injeung);

		System.out.println("마지막 : dice : " + dice);

		// 페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음

		ModelAndView mv = new ModelAndView();

		mv.setViewName("/member/join.do");

		mv.addObject("e_mail", email_injeung);

		if (email_injeung.equals(dice)) {

			// 인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함

			mv.setViewName("index");

			mv.addObject("m_email", email_injeung);

			// 만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
			// 한번더 입력할 필요가 없게 한다.

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
			out_equals.flush();

			return mv;

		} else if (email_injeung != dice) {

			ModelAndView mv2 = new ModelAndView();

			mv2.setViewName("member/email_injeung");

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
			out_equals.flush();

			return mv2;
		}
		return mv;
	}

	// 아이디 중복 확인
	@RequestMapping(value = "/idoverlap")
	public @ResponseBody String idOverlap(@RequestParam("m_id") String m_id) {
		String resultMsg = mService.idOverlap(m_id);
		return resultMsg;
	}

}
