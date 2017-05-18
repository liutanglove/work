package com.zpark.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zpark.entity.SpeItem;
import com.zpark.entity.SpeOption;
import com.zpark.entity.SpeciDTO;
import com.zpark.service.SpeItemService;

@Controller()
@RequestMapping("/speci")
public class SpeciController {
	@Autowired
	private SpeItemService ss;
	@RequestMapping("/imgUpload")
	public void imgUpload(@RequestParam MultipartFile source,HttpSession session){
		try {
			String path=session.getServletContext().getRealPath("/upload");
			String fileName=source.getOriginalFilename();
			System.out.println(path);
			source.transferTo(new File(path+"/"+fileName));
			System.out.println(path+"\\"+fileName);
		} catch (IllegalStateException e){
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/browser")
	@ResponseBody
	public List<SpeciDTO> browser(HttpSession session,HttpServletRequest req){
		String paths = session.getServletContext().getRealPath("/upload");
		File file = new File(paths);
		File[] files = file.listFiles();
		List<SpeciDTO> list = new ArrayList<SpeciDTO>();
		for (File f : files) {
			SpeciDTO sd = new SpeciDTO();
			sd.setIsDirectory(f.isDirectory());
			sd.setName(f.getName());
			sd.setUrl(req.getContextPath()+"/upload/"+f.getName());
			sd.setSize(f.length());
			sd.setLastModified(f.lastModified());
			list.add(sd);
		}
		return list;
	}
	@RequestMapping("/queryAllSpeItem")
	public String queryAllSpeItem(HttpServletRequest request){
		List<SpeItem> list = ss.queryAllSpeItem();
		request.setAttribute("list",list);
		return "forward:/back/specification/list.jsp";
	}
	@RequestMapping("/saveSpeItem")
	@ResponseBody
	public void saveSpeItem(SpeItem si){
		ss.insertSpeItem(si);
	}
	@RequestMapping("/delSpeItem")
	@ResponseBody
	public void delSpeItem(String ids){
		ss.deleteSpeItem(ids);
	}
	@RequestMapping("/queryById")
	public String queryById(String id,HttpServletRequest req){
		SpeItem item = ss.queryById(id);
		req.setAttribute("item", item);
		return "forward:/back/specification/edit.jsp";
	}
	@RequestMapping("/alterSpeItem")
	@ResponseBody
	public void alterSpeItem(SpeItem si){
		ss.modify(si);
	}
}
