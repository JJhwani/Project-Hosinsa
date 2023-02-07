package com.hosinsa.controller;

import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hosinsa.domain.ProductVO;
import com.hosinsa.mapper.CrawlingMapper;
import com.hosinsa.service.CrawlingService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/crawling")
@Log4j
public class CrawlingController {

	@Autowired
	private CrawlingMapper mapper;
	
	@GetMapping("/do")
	public void crawling() {	
		
		String category=""; //카테고리
		String proname; //제품명
		String proimg; //제품 이미지
		String brand; //브랜드
		String detail; //상세이미지
		int pronum; //품번
		int price; //가격
		int stock; //재고
		int proview; //조회수
		
		String[] categories = {"001","002","003","004","020","022","005","006","007","011"};			
		//001:상의, 002:아우터, 003:바지, 004:가방, 020:원피스, 022:스커트, 005:신발, 006:시계, 007:모자, 011:액세서리
			
		try {
			for(int i=0; i<categories.length; i++) {
				
				Document doc_product = Jsoup.connect("https://www.musinsa.com/ranking/best?period=now&age=ALL&mainCategory="+categories[i]+"&subCategory=&leafCategory=&price=&golf=false&kids=false&newProduct=false&exclusive=false&discount=false&soldOut=false&page=1").get();
				Elements img_product = doc_product.select("div.list-box li.li_box img.lazyload");
				
				//System.out.println(categories[i]);
									
				Path originPath = Paths.get("");
				String originPath2 = originPath.toAbsolutePath().toString();
				
				switch(categories[i]) {
					case "001" : category = "상의";
							break;
					case "002" : category = "아우터";
							break;
					case "003" : category = "바지";
							break;
					case "004" : category = "가방";
							break;
					case "020" : category = "원피스";
							break;
					case "022" : category = "스커트";
							break;
					case "005" : category = "신발";
							break;
					case "006" : category = "시계";
							break;
					case "007" : category = "모자";
							break;
					case "011" : category = "액세서리";
							break;
					default : category = "미분류";
							break;
				}
				
				//디렉토리 생성
				String path = originPath2+"\\productImg\\"+category;
									
				try {
		            Files.createDirectories(Paths.get(path));
		            System.out.println("디렉토리 생성: " + path);
		        } catch (IOException e) {
		            System.out.println("디렉토리 생성 실패: " + path + " : " + e);
		        }
				
				
				ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
				
				try {
					for(int j=0; j<img_product.size(); j++) {
						Elements pNum = doc_product.select("div.list-box li.li_box");
						Document doc2 = Jsoup.connect("https://www.musinsa.com/app/goods/"+pNum.get(j).attr("data-goods-no")+"?loc=goods_rank").get();
						Elements pName = doc_product.select("div.list-box li.li_box div.article_info p.list_info a");
						Elements pBrand = doc_product.select("div.list-box li.li_box div.article_info p.item_title a");
						Elements pPrice = doc2.select("ul.product_article #normal_price");
						Elements imgBig = doc2.select("div.wrap_product div.product-img img");
						Elements pDetail = doc2.select("#detail_view");
													
						int pNumber = Integer.parseInt(pNum.get(j).attr("data-goods-no"));
						//재고, 조회수: 1~100 랜덤 생성
						stock = (int)(Math.random()*100+1);
						proview = (int)(Math.random()*100+1);	
						
						proname = pName.get(j).attr("title");
						proimg = imgBig.attr("src").substring(imgBig.attr("src").lastIndexOf("/")+1);
						brand = pBrand.get(j).text();
						pronum = pNumber;
						price = Integer.parseInt(pPrice.get(0).text());
						detail = pDetail.html();
						
						System.out.println("번호 : "+(j+1));
						System.out.println("카테고리 : "+category);							
						System.out.println("제품명 : "+proname);							
						System.out.println("이미지주소 : "+proimg);
						System.out.println("브랜드 : "+brand);
						System.out.println("제품번호 : "+pronum);
						System.out.println("가 격 : "+price);
						System.out.println("재 고 : "+stock);
						System.out.println("조회수 : "+proview);
						System.out.println("상세정보 : "+detail);
						System.out.println("==================================");
									
						//이미지 다운로드
						String img = "http:"+imgBig.attr("src");
						
						//경로를 제외한 파일명
						String filename = img.substring(img.lastIndexOf("/")+1);
						HttpURLConnection conn = null;
						
						URL imgUrl;
						
						try {
							imgUrl=new URL(img);
							conn=(HttpURLConnection)imgUrl.openConnection();
							//log.info("IMG URL :"+img);
							
							BufferedImage buffImg = ImageIO.read(conn.getInputStream());
							FileOutputStream file = new FileOutputStream(path+"\\"+filename+".jpg");
							ImageIO.write(buffImg, "jpg", file);
							
						}catch(IOException e){
							e.printStackTrace();
						}
					
						ProductVO vo = new ProductVO();
						vo.setCategory(category);
						vo.setProname(proname);
						vo.setProimg(proimg);
						vo.setDetail(detail);
						vo.setBrand(brand);
						vo.setPronum(pronum);
						vo.setPrice(price);
						vo.setStock(stock);
						vo.setProview(proview);
						productList.add(vo);
						
					}//end for
					
					
				} catch(Exception e) {
					e.printStackTrace();
				}
				
				mapper.crawling(productList);
				
			}//end for		
			
		} catch(Exception e) {
			e.printStackTrace();
		}
				
		
	}
}
