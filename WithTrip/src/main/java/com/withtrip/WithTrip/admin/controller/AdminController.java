package com.withtrip.WithTrip.admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.withtrip.WithTrip.admin.model.exception.AdminException;
import com.withtrip.WithTrip.admin.model.service.AdminService;
import com.withtrip.WithTrip.admin.model.vo.Monthly;
import com.withtrip.WithTrip.goods.model.vo.Goods;
import com.withtrip.WithTrip.member.model.service.MemberService;
import com.withtrip.WithTrip.member.model.vo.Member;
import com.withtrip.WithTrip.member.model.vo.MemberPagination;
import com.withtrip.WithTrip.member.model.vo.Report;
import com.withtrip.WithTrip.notice.model.vo.Notice;
import com.withtrip.WithTrip.order.model.vo.Order;
import com.withtrip.WithTrip.trip.model.vo.PageInfo;

@SessionAttributes("loginUser")
@Controller
public class AdminController {
	
	
	@Autowired
	private AdminService aService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("adminIfPage.ad")
	public String adminPage() {
		return "adminInfo";
	}
	// 6/23 ?????? ????????? ?????? ????????? ?????? ?????????
		public String saveFile(MultipartFile file, HttpServletRequest request) {
			// ?????? ???????????? ?????? ??????? webapp/resources/profileUploadFiles
			// ?????? ????????? ?????? request ????????????
			// \\??? ?????? ?????? \profileUploadFiles??? ????????????. ??????????????? ????????? ??? ??? ??? ???
			// ?????? ?????? without publishing
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\profileUploadFiles";
//			System.out.println("root : " + root);

			// ????????? ???????????? ????????? ????????? 
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			// ?????? ?????? ??????
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

									//   ?????? ????????? ?????? ?????? ?????? ???????????? ?????????
			String originFileName = file.getOriginalFilename();
			// ????????? ?????? ?????? ?????? + ?????? ?????? ?????? ?????? ????????? ??????????????? ????????????
			String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + originFileName.substring(originFileName.lastIndexOf("."));
			
			// ?????? ?????? ????????? ??????
			String renamePath = folder + "\\" + renameFileName;
//			System.out.println(renamePath);
			
			try {
				// ????????? ?????????, ????????? ?????? ????????? ??????
				file.transferTo(new File(renamePath));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return renameFileName;
		}
		
	// 6/23 ?????? ????????? ?????? ?????????
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\profileUploadFiles";
		
		// File???????????? ????????? ????????? ??????????????? ????????? ?????? ????????? ?????? ??????????????? ???????????? ????????? File??? ????????????
		File f = new File(savePath + "\\" + fileName);
		// ????????? ???????????? ??? ???????????? ??????, ????????? ?????????
		if(f.exists()) {
			f.delete();
		}
	}
	
	
	// 6/22 ?????? ??????
		@RequestMapping(value="adminUpdate.ad")
		public String updateUser(@ModelAttribute Member m, 
								 @RequestParam("reloadFile") MultipartFile reloadFile,
								 HttpServletRequest request, Model model) {
			String pwd = ((Member)model.getAttribute("loginUser")).getUserPwd();
			m.setUserPwd(pwd);
			// ?????? ????????? ????????? ?????????
			if(reloadFile != null && !reloadFile.isEmpty()) {
				// ?????? ????????? ?????? ?????? ?????? ???????????? ?????? ????????? ??????
				if(m.getChangeName() != null) {
					deleteFile(m.getChangeName(), request);
				}
				
				// ?????? ????????? ????????? ?????? ????????? ?????? ??????
				String changeName = saveFile(reloadFile, request);
				m.setOriginName(reloadFile.getOriginalFilename());
				m.setChangeName(changeName);
				
			}
			
			System.out.println("????????? ?????? ?????? : " + m);
			
			int result = mService.updateUser(m);
			Member loginUser = mService.login(m);
			
//			System.out.println("updateUser : " + loginUser);
			
			if(result > 0) {
				model.addAttribute("loginUser", loginUser);
				return "redirect:adminIfPage.ad";
			} else {
				model.addAttribute("msg", "?????? ?????? ????????? ?????????????????????");
				return "../common/errorPage";
			}
		}
	
	@RequestMapping(value = "adminManage.ad")
	public ModelAndView memberList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) throws AdminException {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = aService.getMemberCount();
		
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Member> list = aService.getMemberList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("adminManage");
		}else {
	         mv.addObject("msg", "?????? ?????? ????????? ?????????????????????.");
	         mv.setViewName("../common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "adminSearch.ad" , method = RequestMethod.POST)
	public ModelAndView searchMember(@RequestParam(value="page", required=false) Integer page, @RequestParam("searchValue") String searchValue, ModelAndView mv) throws AdminException {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchValue", searchValue);
		
		int listCount = aService.getSearchListCount(map);
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		ArrayList<Member> list = aService.searchMember(map, pi);
		
		if(list != null) {
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.addObject("searchValue", searchValue);
		mv.setViewName("adminManage");
		}else {
	         mv.addObject("msg", "?????? ????????? ?????????????????????.");
	         mv.setViewName("../common/errorPage");
		}
		
		return mv;
	}
	

	@RequestMapping(value="deleteMember.ad")
	public String deleteMember(@RequestParam("mId") String mId, Model model) throws AdminException {
		
		int result = aService.deleteMember(mId);
		
		if(result > 0) {
			model.addAttribute("mId", mId);
			return "redirect:adminManage.ad";
		}else {
			model.addAttribute("msg", "?????? ?????? ????????? ?????????????????????");
			return "../common/errorPage";
		}
	}
	
	@RequestMapping(value="suspendMember.ad")
	public String suspendMember(@RequestParam("mId") String mId, Model model) throws AdminException {
		
		int result = aService.suspendMember(mId);
		
		if(result > 0) {
			model.addAttribute("mId", mId);
			return "redirect:adminManage.ad";
		}else {
			model.addAttribute("msg", "?????? ?????? ????????? ?????????????????????");
			return "../common/errorPage";
		}
	}
	
	@RequestMapping(value="unlockMember.ad")
	public String unlockMember(@RequestParam("mId") String mId, Model model) throws AdminException {
		
		int result = aService.unlockMember(mId);
		
		if(result > 0) {
			model.addAttribute("mId", mId);
			return "redirect:adminManage.ad";
		}else {
			model.addAttribute("msg", "?????? ?????? ????????? ?????????????????????");
			return "../common/errorPage";
		}
	}
	
	@RequestMapping( value = "adminReport.ad")
	public ModelAndView adminReport(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) throws AdminException {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = aService.getReportCount();
		
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Report> list = aService.getReportList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("adminReport");
		}else {
	         mv.addObject("msg", "?????? ?????? ????????? ?????????????????????");
	         mv.setViewName("../common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "reportTake.ad" )
	public String reportTake(@RequestParam("rId") int rId, Model model) throws AdminException {
	
		int result = aService.reportTake(rId);
		
		if(result > 0) {
			model.addAttribute("rId", rId);
			return "redirect:adminReport.ad";
		}else {
			model.addAttribute("msg", "?????? ?????? ????????? ?????????????????????");
				return "../common/errorPage";
		}
	}
	
	@RequestMapping(value = "addCount.ad")
	public String getAddReCount(@RequestParam("rId") int rId, Model model) throws AdminException {
	
		
		int result = aService.getAddReCount(rId);
		
		if(result > 0) {
			model.addAttribute("rId", rId);
			return "redirect:adminReport.ad";
		}else {
			model.addAttribute("msg", "?????? ?????? ????????? ?????????????????????");
			return "../common/errorPage";
		}
	}
	
	@RequestMapping(value = "noticePost.ad")
	public ModelAndView noticePost(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) throws AdminException {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = aService.getNoticeCount();
		
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Notice> list = aService.getNoticeList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("noticePost");
		}else {
	         mv.addObject("msg", "???????????? ????????? ????????? ?????????????????????.");
	         mv.setViewName("../common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "goodsPost.ad")
	public ModelAndView goodsPost(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) throws AdminException {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = aService.getGoodsCount();
		
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Goods> list = aService.getGoodsList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("goodsPost");
		}else {
	         mv.addObject("msg", "?????? ????????? ????????? ?????????????????????.");
	         mv.setViewName("../common/errorPage");
		}
		return mv;

	}	
	
	@RequestMapping(value = "statusChangeN.go")
	public String statusChangeN(@RequestParam("gId") int gId, Model model) throws AdminException {
		int result = aService.statusChangeN(gId);
		
		if(result > 0) {
			model.addAttribute("gId", gId);
			return "redirect:goodsPost.ad";
		}else {
			model.addAttribute("msg", "?????? ?????? ????????? ?????????????????????");
			return "../common/errorPage";
		}
		
	}
	@RequestMapping(value = "/statusChangeY.go" , method = RequestMethod.POST )
	public String statusChangeY(@RequestParam("gId") int gId, Model model) throws AdminException {
		int result = aService.statusChangeY(gId);
		
		if(result > 0) {
			model.addAttribute("gId", gId);
			return "redirect:goodsPost.ad";
		}else {
			model.addAttribute("msg", "?????? ?????? ????????? ?????????????????????");
			return "../common/errorPage";
		}
		
	}
	
	@RequestMapping(value = "prdManage.ad")
	public ModelAndView prdManage(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) throws AdminException {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = aService.getGoodsCount();
		
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Goods> list = aService.getGoodsList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("prdManage");
		}else {
	         mv.addObject("msg", "?????? ????????? ?????????????????????");
	         mv.setViewName("../common/errorPage");

		}
		return mv;
	}

	@RequestMapping(value = "goodsSearch.ad" , method = RequestMethod.POST)
	public ModelAndView searchGoods(@RequestParam(value="page", required=false) Integer page, @RequestParam("searchValue") String searchValue, ModelAndView mv) throws AdminException {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchValue", searchValue);
		
		int listCount = aService.getSearchCount(map);
		
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		ArrayList<Goods> list = aService.searchGoods(map, pi);
		
		if(list != null) {
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.addObject("searchValue", searchValue);
		mv.setViewName("prdManage");
		}else {
	         mv.addObject("msg", "?????? ????????? ?????????????????????");
	         mv.setViewName("../common/errorPage");

		}
		
		return mv;
	}
	
	@RequestMapping(value = "selectGoodsOp.ad")
	public ModelAndView selectGoodsOp(@RequestParam(value="page", required=false) Integer page, @RequestParam("optionNum") Integer optionNum, ModelAndView mv) throws AdminException {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("optionNum", optionNum);
		
		int listCount = aService.getSelectCount(map);
		
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Goods> list = aService.selectGoodsOp(map, pi);
		
		if(list != null) {
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.addObject("optionNum", optionNum);
		mv.setViewName("prdManage");
		}else {
	         mv.addObject("msg", "?????? ????????? ?????????????????????");
	         mv.setViewName("../common/errorPage");
		}
		
		return mv;
	}

	
	@RequestMapping(value = "goodsUpdate.ad"/*, method = RequestMethod.POST*/)
	public ModelAndView goodsUpdate(@RequestParam("gId") Integer gId, 
								@RequestParam("gStock") Integer gStock, 
								@RequestParam("gCate") Integer gCate, 
								ModelAndView mv,
								Model model) throws AdminException {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("gId", gId);
		map.put("gStock", gStock);
		map.put("gCate", gCate);
		
		
		int result = aService.goodsUpdate(map);
	
		
		if(result > 0) {
			mv.addObject("gId",gId);
			mv.addObject("gStock",gStock);
			mv.addObject("gCate", gCate);
			mv.setViewName("prdManage");
		}else {
	         mv.addObject("msg", "?????? ?????? ????????? ?????????????????????");
	         mv.setViewName("../common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("orderManage.ad")
	public ModelAndView orderManage(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) throws AdminException {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = aService.getOrderCount();
		
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Goods> list = aService.getOrderList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("orderManage");
		}else {
	         mv.addObject("msg", "?????? ????????? ?????????????????????");
	         mv.setViewName("../common/errorPage");
		}
		return mv;
	}
	@RequestMapping(value= "orderSearch.ad", method = RequestMethod.POST)
	public ModelAndView orderSearch(@RequestParam(value="page", required=false) Integer page, @RequestParam("searchValue") String searchValue, ModelAndView mv) throws AdminException {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchValue", searchValue);
		
		int listCount = aService.getSearchOrderCount(map);
		
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Goods> list = aService.searchOrder(map, pi);
		
		if(list != null) {
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.addObject("searchValue", searchValue);
		mv.setViewName("orderManage");
		}else {
	         mv.addObject("msg", "?????? ????????? ?????????????????????");
	         mv.setViewName("../common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "selectStatus.ad")
	public ModelAndView selectOrderSt(@RequestParam(value="page", required=false) Integer page, @RequestParam("optionOd") String optionOd, ModelAndView mv) throws AdminException {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		if(optionOd =="????????????"){
			optionOd = "Y";
		}else if(optionOd =="????????????") {
			optionOd ="N";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("optionOd", optionOd);
		
		
		int listCount = aService.getSelectOrderCount(map);
		
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Order> list = aService.selectOrderSt(map, pi);
		
		if(list != null) {
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.addObject("optionOd", optionOd);
		mv.setViewName("orderManage");
		}else {
	         mv.addObject("msg", "?????? ????????? ?????????????????????");
	         mv.setViewName("../common/errorPage");
		}
		
		return mv;
	}
	
	
	@RequestMapping(value = "searchDate.ad", method=RequestMethod.POST)
	public ModelAndView searchDate(@RequestParam(value="page", required=false) Integer page, 
									@RequestParam("startDate") String startDate,
									@RequestParam("endDate") String endDate,
									ModelAndView mv) throws AdminException {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		if(startDate == "") {
			startDate ="0001-01-01";
		}
		
		if(endDate =="") {
			endDate = "9999-12-31";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		int listCount = aService.searchDateCount(map);
		
		PageInfo pi = MemberPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Order> list = aService.searchDate(map, pi);
		
		if(list != null) {
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.addObject("startDate", startDate);
		mv.addObject("endDate", endDate);
		mv.setViewName("orderManage");
		}else {
	         mv.addObject("msg", "?????? ????????? ?????????????????????");
	         mv.setViewName("../common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "updateOrderSt.ad"/*, method = RequestMethod.POST*/)
	public ModelAndView updateOrderSt(@RequestParam("oId") String oId, 
								@RequestParam("changeOs") String changeOs
								, ModelAndView mv
								) throws AdminException {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("oId", oId);
		map.put("changeOs", changeOs);
		
		int result = aService.updateOrderSt(map);

		
		if(result > 0) {
			mv.addObject("oId",oId);
			mv.addObject("changeOs",changeOs);
			mv.setViewName("orderManage");
		}else {
	         mv.addObject("msg", "?????? ?????? ????????? ?????????????????????.");
	         mv.setViewName("../common/errorPage");
		}
		return mv;
	}
	
	// ??????????????? ??????
	@RequestMapping("totalManage.ad")
	public ModelAndView totalManage(ModelAndView mv) {
		Integer cate1 = aService.getCate1();
		Integer cate2 = aService.getCate2();
  		Integer cate3 = aService.getCate3();
  		Integer totaltoday = aService.getTodaysales();
  		Integer variance = aService.getVariance();
  		
  		mv.addObject("cate1", cate1);
  		mv.addObject("cate2", cate2);
  		mv.addObject("cate3", cate3);
  		mv.addObject("totaltoday", totaltoday);
  		mv.addObject("variance", variance);
  		mv.setViewName("totalManage");
  		return mv;
	}
	
	
	@RequestMapping(value = "topList.ad", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String topList() {
		ArrayList<Order> list = aService.topList();
		JSONArray jArr = new JSONArray();
		
		for (Order o : list) {
			JSONObject job = new JSONObject();
			job.put("goodsName", o.getGoodsName());
			
			jArr.put(job);
		}
		
		
//		System.out.println(jArr);
		
		return jArr.toString();
	}
	
	@RequestMapping(value = "monthamount.ad", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String monthAmount() {
		ArrayList<Monthly> list = aService.monthAmount();
		JSONArray jArr = new JSONArray();
		
		for (Monthly m : list) {
			JSONObject job = new JSONObject();
			job.put("month", m.getMonth());
			job.put("amount", m.getAmount());
			
			jArr.put(job);
		}
		
		
		System.out.println(jArr);
		
		return jArr.toString();
	}
}
