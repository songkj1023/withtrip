package com.withtrip.WithTrip.goods.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.withtrip.WithTrip.common.Attachment;
import com.withtrip.WithTrip.common.PaginationGoods;
import com.withtrip.WithTrip.goods.model.exception.GoodsException;
import com.withtrip.WithTrip.goods.model.service.GoodsService;
import com.withtrip.WithTrip.goods.model.vo.Goods;
import com.withtrip.WithTrip.goods.model.vo.PageInfo;
import com.withtrip.WithTrip.goods.model.vo.Reply;
import com.withtrip.WithTrip.member.model.vo.Member;



@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService gService;

	
	// 여행용품 리스트 조회
	@RequestMapping("glist.go")
	private ModelAndView goodsList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) throws GoodsException {
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = gService.getListCount();

		PageInfo pi = PaginationGoods.getPageInfo(currentPage, listCount);
		
	   ArrayList<Goods> gList = gService.selectGList(pi);
	   
//	   System.out.println(gList);
//	   System.out.println(gList.size());
	   
	   if(gList != null) {
		   mv.addObject("gList", gList);
		   mv.addObject("pi", pi);
		   mv.addObject("listCount", listCount);
		   mv.setViewName("goodsList");
	   } else {
		   throw new GoodsException("게시글 전체 조회에 실패하였습니다.");
	   }
	   return mv;
	}
	 
	
	// 용품 게시판 글쓰기 페이지 넘어오기
	   @RequestMapping("goodsWriteForm.go")
	   public String write() {
		   
		  return "goodsWriteForm";
	   }	
	
	// 용품 게시판 글쓰기
	@RequestMapping("ginsert.go")
	public String ginsert(@ModelAttribute Goods g, @RequestParam("fileNm") List<MultipartFile> files, HttpServletRequest request) throws GoodsException {
		
		ArrayList<Attachment> fileList = new ArrayList<Attachment>();
		
		for(int i = 0; i < files.size(); i++) {
			if(files.get(i) != null && !files.get(i).isEmpty()) {
				
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\guploadFiles";
				
				String changeName = saveFile(files.get(i), savePath);
				
				
				Attachment a = new Attachment();
				
				a.setOriginName(files.get(i).getOriginalFilename());
				a.setChangeName(changeName);
				a.setFilePath(savePath);
				
				
				if(files.get(i) == files.get(0)) {
					a.setFileLevel(0);
					
				} else {
					a.setFileLevel(1);
				}
				
				fileList.add(a);	
			}
			
		}
		
		int result = gService.insertGoods(g, fileList);
		
		if(result == fileList.size() + 1) {
			return "redirect:glist.go";
		} else {
			throw new GoodsException("게시글 등록에 실패하였습니다.");
		}
		
	}
	
   @RequestMapping("gdetail.go")
   public ModelAndView goodsDetail(@RequestParam("gId") int gId, @RequestParam(value="page", required=false) Integer page, ModelAndView mv) throws GoodsException {
      
//	      System.out.println(gId);
      Goods goods = gService.selectGoods(gId);
      ArrayList<Attachment> fList = gService.selectFiles(gId);
      
      if(goods != null) {
         if(page != null) {
             mv.addObject("g", goods).addObject("fList", fList).addObject("page", page).setViewName("goods_detail");
         } else if (page == null) {
            mv.addObject("g", goods).addObject("fList", fList).setViewName("goods_detail");
         }
      } else {
         throw new GoodsException("게시글 상세조회에 실패하였습니다.");
      }
      
      return mv;
   }
	
	// 용품 게시글 수정 페이지로 넘어가기
	@RequestMapping("gupView.go")
	public String gupdateForm(@ModelAttribute Goods g, @RequestParam("page") int page, @RequestParam("originName") String[] originName, 
							  @RequestParam("changeName") String[] changeName ,Model model) {
		
		ArrayList<Attachment> fileList = new ArrayList<>();
		
		for(int i = 0; i < changeName.length; i++) {
			Attachment a = new Attachment();
			a.setOriginName(originName[i]);
			a.setChangeName(changeName[i]);
			
			fileList.add(a);
		}
		
		model.addAttribute("goods", g).addAttribute("page", page).addAttribute("fileList", fileList);
		
		return "goodsUpdateForm";
	}
	

	// 게시글 수정
	@RequestMapping("gupdate.go")
	public String updateGoods(@ModelAttribute Goods g, @RequestParam("page") int page, @RequestParam("originalFile") String[] originalFile,
							  @RequestParam("reloadFiles") List<MultipartFile> reloadFiles, HttpServletRequest request, Model model) throws GoodsException {
		
		ArrayList<Attachment> fileList = new ArrayList<Attachment>();
//		System.out.println(reloadFiles.get(0) != null); // 새로운 파일 업로드 시 null은 아닌데 true
//		System.out.println(reloadFiles.get(0).isEmpty()); // 객체는 생성되었으나 비어있음 true
//		System.out.println(reloadFiles.get(0).getSize()); // 0
//		System.out.println(reloadFiles.get(1) != null); // true
//		System.out.println(reloadFiles.get(1).isEmpty()); // true
//		System.out.println(reloadFiles.get(1).getSize()); // 0
//		System.out.println(reloadFiles != null); // true
//		System.out.println(reloadFiles.isEmpty()); //  false
//		System.out.println(reloadFiles.size()); // false
//		System.out.println(reloadFiles); // 2
//		System.out.println(originalFile[0]);
//		System.out.println(originalFile[1]);
		
		// 새 파일이 존재하면 기존 파일 삭제 후 새 파일 저장   -> 새로운 파일 업로드 안했을 때는..기존 파일 삭제 안되는지 체크할 것
		
//		자꾸썸네일만 삭제가 됨.. 왜그런지 알아보기(새로운 파일 업로드 안했을 때는..기존 파일 삭제 안되는지 체크, 에러 안나도록)
		// 각각의 reloadFiles는 비어있는게 맞는데 list는 비어있지 않으므로 조건 수정
		
		System.out.println(g);
	 	
		for(int i = 0; i < reloadFiles.size(); i++) {  
			if(reloadFiles.get(i) != null && !reloadFiles.get(i).isEmpty()) {  // 새로운 파일 업로드 하고
				
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\guploadFiles";
				
				// 기존 파일 삭제(updateForm에서 기존 파일의 name을 originFile로 같게 넘겨서 배열로 받아옴)
				if(originalFile[i] != null) {
					deleteFile(originalFile[i], savePath);
				}
				
				// 새로운 파일 업로드
				String changeName = saveFile(reloadFiles.get(i), savePath);
				
				Attachment a = new Attachment();
				
				a.setOriginName(reloadFiles.get(i).getOriginalFilename());
				a.setChangeName(changeName);
				a.setFilePath(savePath);
				a.setBoardId(g.getGoodsId());
				
				if(reloadFiles.get(i) == reloadFiles.get(0)) {
					a.setFileLevel(0);
				} else {
					a.setFileLevel(1);
				}
				
				fileList.add(a);	
				System.out.println(fileList);
			}
			
		} 
			
		// Goods와 Attachment 테이블 수정
		int result = gService.updateGoods(g, fileList);
		
		System.out.println(result);
		if(result == fileList.size() + 1) { // 사진 2장 + 글 1개 수정 성공하면
			model.addAttribute("gId", g.getGoodsId());
			model.addAttribute("page", page);
			return "redirect:gdetail.go";
		} else {
			throw new GoodsException("게시글 수정에 실패하였습니다.");
		}
	
	}
	
	
	// 새로운 파일 이름 짓기
	public String saveFile(MultipartFile file, String savePath) {
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String originName = file.getOriginalFilename();
		String changeName = sdf.format(new Date(System.currentTimeMillis())) + originName.substring(originName.lastIndexOf("."));
	
		String renamePath = folder + "\\" + changeName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	
	// 용품 게시글 삭제하기
	   @RequestMapping("gdelete.go")
	   public String deleteGoods(@RequestParam("gId") int gId, @RequestParam("changeName") String[] changeName, HttpServletRequest request) throws GoodsException {
	      
		  String root = request.getSession().getServletContext().getRealPath("resources");
		  String savePath = root + "\\guploadFiles";
		  
		  // 삭제된 게시글에 있는 사진을 폴더에서 삭제하기 위해 폴더에 저장된 이름을 view에서 가져왔는데 삭제 게시글을 status ='N'으로 바꿀 경우
		  // 폴더에 저장된 사진은 삭제하는 것이 좋을지 어떨지 의문
//		  for(int i = 0; i < changeName.length; i++) {
//		      if(!changeName[i].equals("")) { 		   // goods_detail에 사진이 존재하면
//		         deleteFile(changeName[i], savePath);  // 그 사진을 guploadFiles 폴더에서 삭제
//		      }
//		  }
		  
		  Attachment a = new Attachment();
		  a.setBoardId(gId);
		  
	      int result = gService.deleteGoods(gId);

	      if(result == changeName.length + 1 ) { // Goods게시글(1개), Attachment(2개) 첨부파일 모두 삭제
	         return "redirect:glist.go";
	      } else {
	         throw new GoodsException("게시글 삭제에 실패하였습니다.");
	      }
	   }
	   
	// 사진 삭제 (게시글 수정, 삭제 할 때 사용하는 메소드)
	   public void deleteFile(String fileName, String savePath2) {
	       
	       File f = new File(savePath2 + "\\" + fileName);
	       if(f.exists()) {
	          f.delete();
	       }

	   }

   // 검색하기
   @RequestMapping("search.go")
   public ModelAndView searchGoods(@RequestParam(value="page", required=false) Integer page, @RequestParam("searchGoods") String searchgName,
		   							ModelAndView mv) throws GoodsException {
	   // pi, goodsList, searchgName을 보내야함
	   
	   int currentPage = 1;
	   
	   if(page != null) {
		   currentPage = page;
	   }
	   
	   // 검색한 리스트에 대한 개수 가져오기
	   int listCount = gService.getSearchListCount(searchgName);
	   
	   PageInfo pi = PaginationGoods.getPageInfo(currentPage, listCount);
	   
	   // 검색 값(searchgName)과 페이징 처리 데이터(pi) 전달
	   ArrayList<Goods> List = gService.selectSearchList(searchgName, pi);
	   
	   if(List != null) {
		   mv.addObject("gList", List);
		   mv.addObject("pi", pi);
		   mv.addObject("searchgName", searchgName);
		   mv.addObject("listCount", listCount);
		   mv.setViewName("goodsList");
	   } else {
		   throw new GoodsException("상품 검색에 실패하였습니다.");
	   }
	   
	   return mv;
   }

   // 카테고리 리스트
   @RequestMapping("gCate.go")
   public String getCataList(@RequestParam(value="page", required=false) Integer page, @RequestParam("category") String category, HttpServletResponse response, Model model) {
	   
	   int currentPage= 1;
	   
	   if(page != null) {
		   currentPage = page;
	   }
	   
	   // 카테고리에 해당하는 게시글 개수 가져오기
	   int listCount = gService.getCateListCount(category);
	   
	   PageInfo pi = PaginationGoods.getPageInfo(currentPage, listCount);
	   
	   ArrayList<Goods> gList = gService.selectCateList(category, pi);
	   
	   
	   model.addAttribute("gList", gList);
	   model.addAttribute("pi", pi);
	   model.addAttribute("category", category);
	   model.addAttribute("listCount", listCount);
	   
	   return "goodsList";
   }

   	
   	// 구매하기 버튼 클릭
   	@RequestMapping("order.od")
   	public String orderGoods(@RequestParam("goodsId") int gId, @RequestParam("goodsName") String gName, @RequestParam("goodsBrand") String gBarnd, 
   							 @RequestParam("goodsSize") String gSize, @RequestParam("goodsColor") String gColor, 
   							 @RequestParam("totalPrice") String gPrice, @RequestParam("thumbnail") String photo,
   							 @RequestParam("goodsQtt") int quantity, Model model) {
   		Goods g = new Goods();
   		g.setGoodsId(gId);
   		g.setGoodsName(gName);
   		g.setGoodsBrand(gBarnd);
   		g.setGoodsSize(gSize);
   		g.setGoodsColor(gColor);
   		g.setChangeName(photo);
   		g.setStock(quantity);
   		g.setPrice(gPrice);
   		
   		model.addAttribute("g", g);
   		
   		System.out.println(g);
   	
   		return "order";
   	}
   
   
   
	// 메인화면에 용품 리스트 출력
	@RequestMapping("goodsList.go")
	public String mainGoodsList(Model model, HttpServletResponse response) {
		
		ArrayList<Goods> gList = gService.mainGoodsList();
		Goods goods = new Goods();
		
		model.addAttribute("gList", gList);
		model.addAttribute("goods", goods);
		
		return "mainGoodsList";
		
	}
	
	// 댓글 등록
    @RequestMapping("addReply.go")
    @ResponseBody 
    public void addReply(@ModelAttribute Reply r, @RequestParam("gId") int gId, HttpSession session, HttpServletResponse response) throws GoodsException {
	   String id = ((Member)session.getAttribute("loginUser")).getEmail();
	   r.setEmail(id);
	   r.setGoodsId(gId);
	   
//	   System.out.println(r + "댓글작성 r");
//	   System.out.println(id + "댓글작성id");
	   
	   int result = gService.insertReply(r);
	   System.out.println(result);
	   if(result > 0) {
	   		ArrayList<Reply> list = gService.selectReplyList(gId);
	   		
	   		response.setContentType("application/json; charset=UTF-8");
	   		Gson gson = new GsonBuilder().serializeNulls().setDateFormat("yyyy-MM-dd").create();
	   		try {
					gson.toJson(list, response.getWriter());
				} catch (JsonIOException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
	   } else {
		   throw new GoodsException("댓글 등록에 실패하였습니다.");
	   }
    }
	
    
	// 댓글 리스트 가져오기
    @RequestMapping("rList.go")
    @ResponseBody
    public void getReplyList(@RequestParam("gId") int gId, HttpServletResponse response) {
	   
	   ArrayList<Reply> list = gService.selectReplyList(gId);
//	   System.out.println(list + "댓글 목록");
//	   System.out.println(gId + "댓글 해당 게시물번호");
	   
	   
	   response.setContentType("application/json; charset=UTF-8"); 
	   // gson사용하면 날짜 이상하게 나온다
	   Gson gson = new GsonBuilder().serializeNulls().setDateFormat("yyyy-MM-dd").create();
	   try {
		gson.toJson(list, response.getWriter());
	   } catch (JsonIOException e) {
		e.printStackTrace();
	   } catch (IOException e) {
		e.printStackTrace();
	   }
    }

    // 댓글 수정
    @RequestMapping("rupdate.go")
    @ResponseBody
    public void rupdate(@ModelAttribute Reply r, @RequestParam("rId") int rId, @RequestParam("gId") int gId, @RequestParam("rContent") String rContent, HttpServletResponse response) throws GoodsException {
//    	System.out.println(rId);
//    	System.out.println(rContent);
    	
    	r.setReplyId(rId);
    	r.setReplyContent(rContent);
    	
    	int result = gService.updateReply(r);
    	
    	if(result > 0) {
	   		ArrayList<Reply> list = gService.selectReplyList(gId);
	   		response.setContentType("application/json; charset=UTF-8");
	   	    Gson gson = new GsonBuilder().serializeNulls().setDateFormat("yyyy-MM-dd").create();
	   		try {
					gson.toJson(list, response.getWriter());
				} catch (JsonIOException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
    		} else {
		   throw new GoodsException("댓글 등록에 실패하였습니다.");
	   }
    }
    
    
	// 댓글 삭제
    @RequestMapping("rdelete.go")
    public void rdelete(@RequestParam("rId") int rId, @RequestParam("gId") int gId, HttpServletResponse response) throws GoodsException {
    	
    	int result = gService.deleteReply(rId);
    	
    	if(result > 0) {
    		ArrayList<Reply> list = gService.selectReplyList(gId);
    		response.setContentType("application/json; charset=UTF-8");
    		Gson gson = new GsonBuilder().serializeNulls().setDateFormat("yyyy-MM-dd").create();
    		try {
				gson.toJson(list, response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
    	} else {
 		   throw new GoodsException("댓글 삭제에 실패하였습니다.");
 	   }
    }
	   

    // 내가 쓴 용품 후기에서 삭제 버튼 눌렀을 때 댓글 삭제
    @RequestMapping("myRdelete.go")
    public String myRdelete(@RequestParam("rId") int rId, HttpServletResponse response) throws GoodsException {
       
       int result = gService.deleteReply(rId);
       
       if(result > 0) {
          return "redirect:myReply.me";
       } else {
          throw new GoodsException("댓글 삭제에 실패하였습니다.");
       }
    }


    // 품절 상품 제외한 리스트 가져오기
    @RequestMapping("saleGoods.go")
    public String soldoutExc(@RequestParam(value="page", required=false) Integer page, Model model) {
    	
    	int currentPage = 1;
    	
    	if(page != null) {
    		currentPage = page;
    	}
    	
    	int listCount = gService.getSaleGListCount();
    	
    	System.out.println(listCount);
    	
    	PageInfo pi = PaginationGoods.getPageInfo(currentPage, listCount);

    	ArrayList<Goods> gList = gService.saleGoodsList(pi);
    	model.addAttribute("gList", gList);
    	model.addAttribute("pi", pi);
    	model.addAttribute("listCount", listCount);
    	
    	return "goodsList";
    	
    }
    
   // 선택한 항목으로 글 조회 
    @RequestMapping("select_type.go")
    public void selectType(@RequestParam(value="page", required=false) Integer page, @RequestParam("select_type") String select_type, HttpServletResponse response) {
		
    	// 페이징 처리
    	int currentPage = 1;
    	
    	if(page != null) {
    		currentPage = page;
    	}
    	
    	int listCount = gService.getListCount();
    	
    	PageInfo pi = PaginationGoods.getPageInfo(currentPage, listCount);
    	System.out.println(listCount);

		// 선택 타입으로 글 리스트 조회
//		ArrayList<Goods> gList = gService.selectType(pi, select_type);
    	
    	ArrayList<Goods> gList = gService.selectType(select_type);
    	
    	
    	response.setContentType("application/json; charset=UTF-8");
    	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    	try {
			gson.toJson(gList, response.getWriter());
//			gson.toJson(pi, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
        System.out.println(gList);
        System.out.println(gList.size());

    }
    
    @RequestMapping("getSelectTypePage.go")
    public void getPage(@RequestParam("page") Integer page, HttpServletResponse response) {
    	// 페이징 처리
    	int currentPage = 1;
    	
    	if(page != null) {
    		currentPage = page;
    	}
    	
    	int listCount = gService.getListCount();
    	
    	PageInfo pi = PaginationGoods.getPageInfo(currentPage, listCount);
    	
    	response.setContentType("application/json; charset=UTF-8");
    	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    	
    	try {
			gson.toJson(pi, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
    	
    	System.out.println(pi);
    	
    }
    	
    
    
}

