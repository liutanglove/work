package com.zpark.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zpark.dao.SpecItemDAO;
import com.zpark.dao.SpecOptionDAO;
import com.zpark.entity.ParaItem;
import com.zpark.entity.SpeItem;
import com.zpark.entity.SpeOption;
import com.zpark.service.SpeItemService;
@Component
@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED,readOnly=false,rollbackFor=Exception.class)
public class SpeItemServiceImpl implements SpeItemService {
	@Autowired
	private SpecItemDAO sd;
	@Autowired
	private SpecOptionDAO sod;
	public List<SpeItem> queryAllSpeItem() {
		return sd.selectAll();
	}
	public void insertSpeItem(SpeItem si) {
		si.setId(UUID.randomUUID().toString().substring(0, 8));
		si.setCreatetime(new Timestamp(new Date().getTime()));
		si.setLastupdatetime(new Timestamp(new Date().getTime()));
		sd.insert(si);
		for (SpeOption so : si.getList()) {
			so.setId(UUID.randomUUID().toString().substring(0, 8));
			so.setParentid(si.getId());
			so.setCreatetime(new Timestamp(new Date().getTime()));
			so.setLastupdatetime(new Timestamp(new Date().getTime()));
			sod.insert(so);
		}
	}
	public void deleteSpeItem(String ids) {
		String[] split = ids.split("-");
		List<String> list = Arrays.asList(split);
		sd.delete(list);
	}
	public SpeItem queryById(String id) {
		return sd.selectById(id);
	}
	public void modify(SpeItem si) {
		si.setLastupdatetime(new Timestamp(new Date().getTime()));
		sd.update(si);
		List<SpeOption> list = sd.selectById(si.getId()).getList();
		List<String> del = new ArrayList<String>();
		Map<String, SpeOption> ids = new HashMap<String, SpeOption>();
		for (SpeOption so : list) {
			ids.put(so.getId(), so);
		}
		for (SpeOption so : si.getList()) {
			if(so.getName() != null){
				if(so.getId() == null){
					so.setId(UUID.randomUUID().toString().substring(0, 8));
					so.setCreatetime(new Timestamp(new Date().getTime()));
					so.setLastupdatetime(new Timestamp(new Date().getTime()));
					sod.insert(so);
				}else{
					so.setLastupdatetime(new Timestamp(new Date().getTime()));
					sod.update(so);
					ids.remove(so.getId());
				}
			}
		}
		for (String id : ids.keySet()) {
			del.add(id);
		}
		if(del.size() != 0){
			sod.delete(del);
		}
	}

}
