package com.zpark.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zpark.entity.Category;
import com.zpark.entity.ParaGroup;
import com.zpark.entity.ParaGroupDTO;
import com.zpark.service.CategoryService;
import com.zpark.service.ParamService;

@Controller()
@RequestMapping("/param")
public class ParamController {
	@Autowired
	private ParamService ps;
	@Autowired
	private CategoryService cs;
	@RequestMapping("/queryAllParam")
	@ResponseBody
	public ParaGroupDTO queryAllParam(Integer rows,Integer page){
		ParaGroupDTO pgd = new ParaGroupDTO();
		pgd.setRows(ps.queryParam(rows,page));
		pgd.setTotal(ps.queryParam(0, 0).size());
		return pgd;
	}
	@RequestMapping("/addParam")
	@ResponseBody
	public void addParam(ParaGroup pg){
		ps.addParam(pg);
	}
	@RequestMapping("/removeParamGroup")
	@ResponseBody
	public void removeParamGroup(String idStr){
		ps.removeParaGroup(idStr);
	}
	@RequestMapping("/queryParamById") 
	public String queryParamById(String gid,String cid,HttpServletRequest request){
		List<Category> list = cs.queryAllCategory();
		request.setAttribute("list", list);
		ParaGroup pg = ps.queryParaGroup(gid);
		request.setAttribute("pg", pg);
		return "forward:/back/params/edit.jsp?id="+cid;
	}
	@RequestMapping("/alterParamGroup")
	@ResponseBody
	public String alterParamGroup(ParaGroup pg){
		ps.modifyParam(pg);
		return "success";
	}
}
