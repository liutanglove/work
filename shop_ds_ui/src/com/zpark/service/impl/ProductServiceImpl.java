package com.zpark.service.impl;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zpark.dao.ImageDAO;
import com.zpark.dao.ProductDAO;
import com.zpark.entity.Image;
import com.zpark.entity.Product;
import com.zpark.service.ProductService;
import com.zpark.util.ImageUtils;
@Component
@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED,readOnly=false,rollbackFor=Exception.class)
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO pd;
	@Autowired
	private ImageDAO im;
	public void addProduct(Product product,HttpServletRequest req) {
		String path = req.getServletContext().getRealPath("/upload/");
		product.setId(UUID.randomUUID().toString().substring(0, 8));
		product.setNumb(product.getNumb()+UUID.randomUUID().toString().substring(0, 8));
		pd.insertProduct(product);
		for (Image i : product.getList()) {
			i.setId(UUID.randomUUID().toString().substring(0, 8));
			i.setProductid(product.getId());
			String[] split = i.getImgUrlLarge().split("/");
			String largePath = path+"\\"+split[3];
			String[] split2 = split[3].split("\\.");
			String smallPath = path+"\\"+split2[0]+"_small."+split2[1];
			String middlePath = path+"\\"+split2[0]+"_middle."+split2[1];
			//生成middle图片
			ImageUtils.scale(largePath, middlePath, true);
			//生成small图片
			ImageUtils.scale(largePath, smallPath, false);
			//设置middle图片
			i.setImgUrlMiddle(middlePath.substring(64, middlePath.length()));
			//设置small图片
			i.setImgUrlSmall(smallPath.substring(64, smallPath.length()));
			im.insertImage(i);
		}
	}
	public List<Product> queryAllProduct() {
		return pd.selectAllProduct();
	}

}
