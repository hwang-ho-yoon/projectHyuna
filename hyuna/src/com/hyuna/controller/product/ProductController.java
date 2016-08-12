package com.hyuna.controller.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hyuna.common.util.FileUploadUtil;
import com.hyuna.service.product.ProductService;
import com.hyuna.vo.ProductAllVO;
import com.hyuna.vo.ProductVO;




@Controller
@RequestMapping(value="/product")
public class ProductController {
	Logger logger =Logger.getLogger(ProductController.class);
	@Autowired//BoardService로 구현된 구현체를 자동으로 찾아d와 setter를 불러 설정한다.
	private ProductService productService;
	
	//관리자
	//첨부파일 게시판	//파일의 realpath를 위해 request객체를 같이 보냄.
	@RequestMapping(value="/productInsert.do",  method = RequestMethod.POST)
	public String productInsert(@ModelAttribute ProductVO pvo,HttpServletRequest request) throws IllegalStateException, IOException{
		
		logger.info("productInsert호출 성공");
		logger.info("fileName : " +pvo.getFile1().getOriginalFilename());//file확인
		logger.info("b_title : " +pvo.getImg_1());//file확인
		int result=0;
		String url="";
		String img_1="";//main
		String img_2="";//thumb
		String img_3="";//detail
		
		if(pvo.getFile1()!=null || pvo.getFile1().equals("")){
			img_1=FileUploadUtil.fileUpload(pvo.getFile1(),request,1);
		}else{
			img_1="";
		}
		pvo.setImg_1(img_1);
		
		if(pvo.getFile2()!=null || pvo.getFile2().equals("")){
			img_2=FileUploadUtil.fileUpload(pvo.getFile2(),request,2);
		}else{
			img_2="";
		}
		pvo.setImg_2(img_2);
		
		if(pvo.getFile3()!=null || pvo.getFile3().equals("")){
			img_3=FileUploadUtil.fileUpload(pvo.getFile3(),request,3);
		}else{
			img_3="";
		}
		pvo.setImg_3(img_3);
		
		System.out.println(pvo.toString());
		
		result=productService.productInsert(pvo);
		if(result==1){
			url="/product/prdRgtList.do";//board
		}
		return "redirect:"+url;//movepage의 기능을 한다.  공백이 들어가면 안된다.		
	}
	
	//관리자
	@RequestMapping(value="/prdRgtList.do",  method = RequestMethod.GET)
	public String prdRgtList(@ModelAttribute ProductVO pvo, Model model){
		logger.info("prdRgtList 호출성공");

		
		
/*		//정렬에 대한 기본값 설정 :처음 조회시에는 매개변수가 없으므로 글번호로 내림차순 정렬한다.
		if(bvo.getOrder_by()==null)bvo.setOrder_by("b_num");
		if(bvo.getOrder_sc()==null)bvo.setOrder_sc("DESC");
		
		//정렬에 대한 데이터 확인
		logger.info("order_by=" + bvo.getOrder_by());
		logger.info("order_sc=" + bvo.getOrder_sc());
		
		//검색에 대한 데이터 확인
		logger.info("search =" + bvo.getSearch());
		logger.info("keyword=" + bvo.getKeyword());
		
		//페이지셋팅
		Paging.setPage(bvo);*/
		
		//전체레코드수 구현
		//int total=boardService.boardListCnt(bvo);
		//logger.info("total = " + total);
		//등록된 상품리스트를 조회한다.
		
		logger.info(pvo.getS_condition()+" "+pvo.getS_word());
		List<ProductVO> prdRgtList = productService.prdRgtList(pvo);
		logger.info("앞");
		model.addAttribute("prdRgtList", prdRgtList);
		logger.info("중간");
		//model.addAttribute("count", count);
		//model.addAttribute("total", total);
		model.addAttribute("data", pvo);
		logger.info("뒤");
		
		return "productAdmin/prdRgtList";
//		return "product/NewFile";
	}
	
	
	//관리자
	@RequestMapping(value="/prdWriteForm.do",  method = RequestMethod.GET)
	public String prdWriteForm(@ModelAttribute ProductVO pvo, Model model){
		logger.info("prdWriteForm호출성공");
		List<ProductVO> colorList = productService.colorList(pvo);
		List<ProductVO> modelList = productService.modelList(pvo);
		model.addAttribute("colorList",colorList);
		model.addAttribute("modelList",modelList);
		return "productAdmin/prdWriteForm";
	}
	//관리자
	@RequestMapping(value="/prdMgrDetail.do",  method = RequestMethod.GET)
	public String prdMgrDetail(@ModelAttribute ProductVO pvo, Model model){
		logger.info("prdMgrDetail호출성공");
		//master, img
		ProductVO prdMgrDetail=new ProductVO();
		prdMgrDetail=productService.prdMgrDetail(pvo);
		model.addAttribute("detail",prdMgrDetail);
		
		//option
		List<ProductVO> optList = productService.optList(pvo);
		model.addAttribute("optList", optList);
		
		
		return "productAdmin/prdMgrDetail";
	}
	//관리자
		@RequestMapping(value="/prdUpdateForm.do",  method = RequestMethod.POST)
		public String prdUpdateForm(@ModelAttribute ProductVO pvo, Model model){
			logger.info("prdUpdateForm호출성공");
			//master, img
			ProductVO prdMgrDetail=new ProductVO();
			prdMgrDetail=productService.prdMgrDetail(pvo);
			model.addAttribute("detail",prdMgrDetail);
			
			List<ProductVO> colorList = productService.colorList(pvo);
			List<ProductVO> modelList = productService.modelList(pvo);
			model.addAttribute("colorList",colorList);
			model.addAttribute("modelList",modelList);
			
			//option
			List<ProductVO> optList = productService.optList(pvo);
			model.addAttribute("optList", optList);
			
			
			return "productAdmin/prdUpdateForm";
		}
		@RequestMapping(value="/prdUpdate.do",  method = RequestMethod.POST)
		public String prdUpdate(@ModelAttribute ProductVO pvo, MultipartHttpServletRequest request, Model model) throws IllegalStateException, IOException{
			logger.info("prdUpdate호출성공");
			//master, img
			int result, imgResult=0;
			String page="";
			
			String img_1="";//main
			String img_2="";//thumb
			String img_3="";//detail
			
			
			
//			if(pvo.getFile1()!=null || !pvo.getFile1().equals("")||!pvo.getFile1().isEmpty()||){sout
			
			
			
			if(!pvo.getFile1().isEmpty()){
				img_1=FileUploadUtil.fileUpload(pvo.getFile1(),request,1);
			}else{
				img_1="";
			}
			pvo.setImg_1(img_1);
			
			if(!pvo.getFile2().isEmpty()){
				img_2=FileUploadUtil.fileUpload(pvo.getFile2(),request,2);
			}else{
				img_2="";
			}
			pvo.setImg_2(img_2);
			
			if(!pvo.getFile3().isEmpty()){
				img_3=FileUploadUtil.fileUpload(pvo.getFile3(),request,3);
			}else{
				img_3="";
			}
			pvo.setImg_3(img_3);
			System.out.println("File1.isEmpty : "+pvo.getFile1().isEmpty());
			System.out.println("File1.getName : "+pvo.getFile1().getName());
			System.out.println("File1.getSize : "+pvo.getFile1().getSize());
			System.out.println(pvo.toString());
			
			result=productService.prdUpdate(pvo);
			if(!img_1.equals("")||!img_2.equals("")||!img_3.equals("")){
				
			imgResult=productService.prdImageUpdate(pvo);
				if(imgResult<1){
					imgResult=productService.prdImageInsert(pvo);
				}
			}
			if(result==1){
				page="redirect:/product/prdRgtList.do";
			}else{
				model.addAttribute("detail",pvo);
				page="productAdmin/prdUpdateForm";
			}
			return page;
		}
		
		//public String prdUpdateForm(@RequestBody ProductVO pvo){
		@RequestMapping(value="/prdOptAdd.do",  method = RequestMethod.POST)
		public ResponseEntity<String> OptAddlist(@RequestBody ProductVO pvo){
			logger.info("prdOptAdd호출 성공");
			String url="";
			ResponseEntity<String> entity = null;
			int result=0;
			try{
				result=productService.prdOptAdd(pvo);
				if(result == 1){
					entity=new ResponseEntity<>("SUCCESS",HttpStatus.OK);
				}
				return entity;
				
			}catch(Exception e){
				e.printStackTrace();
				entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		}
		
		@RequestMapping(value="/prdOptDelete.do",  method = RequestMethod.POST)
		public ResponseEntity<String> OptDeletelist(@RequestBody ProductVO pvo){
			logger.info("prdOptAdd호출 성공");
			String url="";
			ResponseEntity<String> entity = null;
			int result=0;
			try{
				result=productService.prdOptDelete(pvo);
				if(result == 1){
					entity=new ResponseEntity<>("SUCCESS",HttpStatus.OK);
				}
				return entity;
				
			}catch(Exception e){
				e.printStackTrace();
				entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		}
	@RequestMapping(value="/prdOptUpdate.do",  method = RequestMethod.POST)
	public ResponseEntity<String> prdOptUpdate(@RequestBody ProductVO pvo){
			logger.info("prdOptUpdate호출 성공");
			String url="";
			ResponseEntity<String> entity = null;
			int result=0;
			pvo.setPrd_d_display(pvo.getPrd_d_display().trim());
			try{
				result=productService.prdOptUpdate(pvo);
				if(result == 1){
					entity=new ResponseEntity<>("SUCCESS",HttpStatus.OK);
				}
				return entity;
				
			}catch(Exception e){
				e.printStackTrace();
				entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		}
		
	
	//사용자 	pr
	@RequestMapping(value="/prdMainList.do",  method = RequestMethod.GET)
	public String prdMainList(@ModelAttribute ProductVO pvo, Model model){
		logger.info("prdMainList호출성공");
		logger.info("model:"+pvo.getModel_machine());
		List<ProductVO> prdMainList = productService.prdMainList(pvo);
		//logger.info("Img_1 : "+prdMainList.get(0).getImg_1());
		
		model.addAttribute("prdMainList", prdMainList);
		model.addAttribute("data", pvo);
		return "product/prdMainList";
	}
	//사용자 
	@RequestMapping(value="/prdSingleDetail.do",  method = RequestMethod.GET)
	public String prdSingleDetail(@ModelAttribute ProductVO pvo, Model model){
		logger.info("prdSingleDetail호출성공");
		logger.info("Prd_no="+ pvo.getPrd_no());
		
		ProductVO detail=new ProductVO();
		detail=productService.prdSingleDetail(pvo);
		
		/*if(detail!=null && (!detail.equals(""))){
			detail.setB_content(detail.getB_content().toString().replace("\n", "<br>"));
		}*/
		List<ProductVO> opt=productService.prdSingleOption(pvo);
		opt=productService.prdSingleOption(pvo);
		
		model.addAttribute("detail",detail);
		model.addAttribute("opt",opt);
		return "product/prdSingleDetail";		
	}	
	
	@RequestMapping(value="/prdList.do",  method = RequestMethod.GET)
	public String prdList(@ModelAttribute ProductVO pvo, Model model){
		logger.info("prdList호출성공");
		List<ProductVO> prdListBest = productService.prdListBest(pvo);		
		List<ProductVO> prdListLatest = productService.prdListLatest(pvo);		
		model.addAttribute("prdListBest", prdListBest);
		model.addAttribute("prdListLatest", prdListLatest);
		return "product/prdList";
	}
	@RequestMapping(value="/prdDelete.do",  method = RequestMethod.POST)
	public String prdDelete(@ModelAttribute ProductVO pvo, Model model){
		logger.info("prdDelete 호출성공");
		//int result=productService.detailPrdDelete(pvo);
		int result=productService.masterPrdDelete(pvo);
		return "redirect:/product/prdRgtList.do";
	}
	
	
	//product전체정보
	/*@RequestMapping(value="/prdAll.do")
	public String prdAll(@ModelAttribute ProductAllVO pvo, Model model ){
		logger.info("prdAll 호출성공");

		List<ProductAllVO> prdAll = productService.prdAllList(pvo);
		model.addAttribute("prdAll", prdAll);
	
		return "product/prdAllList";
	}*/

	//ResponseEntity<List<ProductVO>> list(@PathVariable("b_num") Integer b_num) {// list형태
	//var url="/product/colorOptList.do?prd_no="+prd_no+"&model_no="+model_no+".do";
	@ResponseBody
	@RequestMapping(value="/colorOptList.do")
	public ResponseEntity<List<ProductVO>> list(@RequestParam("prd_nol")int prd_no,@RequestParam("model_nol")int model_no   ) {// list형태 String colorOptList(@ModelAttribute ProductVO pvo, Model model ){
		logger.info("colorOptList 호출성공");
		ResponseEntity<List<ProductVO>> entity=null;

		try{
			
			ProductVO pvo=new ProductVO();
			pvo.setModel_no(model_no);
			pvo.setPrd_no(prd_no);
			System.out.println(pvo.getPrd_no()+" "+pvo.getModel_no());
			entity = new ResponseEntity<>(productService.colorOptList(pvo), HttpStatus.OK);			
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/prdOptList.do",  method = RequestMethod.GET)
	public String prdOptList(@ModelAttribute ProductAllVO pvo, Model model){
		//int result=productService.detailPrdDelete(pvo);
		List<ProductAllVO> prdOptColorList = productService.prdOptColorList(pvo);		
		List<ProductAllVO> prdOptMachineList = productService.prdOptMachineList(pvo);		
		model.addAttribute("clrList", prdOptColorList);
		model.addAttribute("brdList", prdOptMachineList);
		return "product/prdOptList";
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteOpt.do",  method = RequestMethod.POST)
	public String depeteOpt(@RequestParam("dataList") String options){
		logger.info("deleteOpt 호출성공");
		options=options.substring(0, options.length()-1);
		logger.info(options);
		String[] opt=options.split(",");
		int option_nos[]=new int[opt.length];
		for(int ii=0;ii<opt.length; ii++){
			option_nos[ii]=Integer.parseInt(opt[ii]);
		}
		
		int result=productService.deleteOpt(option_nos);
		return result+"";
	}
	
	@RequestMapping(value = "/insertBrdOpt")//boardInsert와 비교.!!
	public ResponseEntity<String> listBrd(@RequestBody ProductVO pvo) {// json형태의 값을 자동으로 mapping, json이 아니라면 modelAttribute
		logger.info("insertBrdOpt 호출성공");
		ResponseEntity<String> entity = null;
		int result;
		try {
			result = productService.insertBrdOpt(pvo);
			if (result == 1) {
				entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/insertClrOpt")//boardInsert와 비교.!!
	public ResponseEntity<String> listClr(@RequestBody ProductVO pvo) {// json형태의 값을 자동으로 mapping, json이 아니라면 modelAttribute
		logger.info("insertClrOpt 호출성공");
		ResponseEntity<String> entity = null;
		int result;
		try {
			result = productService.insertClrOpt(pvo);
			if (result == 1) {
				entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
}

