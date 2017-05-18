package com.zpark.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zpark.dao.ParamDAO;
import com.zpark.entity.Category;
import com.zpark.entity.ParaGroup;
import com.zpark.entity.ParaItem;
import com.zpark.service.ParamService;
@Component
@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED,readOnly=false,rollbackFor=Exception.class)
public class ParamServiceImpl implements ParamService {
	@Autowired
	private ParamDAO pd;
	
	public List<ParaGroup> queryParam(Integer rows,Integer page) {
		return pd.selectParaGroup(null,rows,page);
	}
	
	public void addParam(ParaGroup pg) {
		pg.setId(UUID.randomUUID().toString().substring(0, 8));
		pg.setCreateTime(new Timestamp(new Date().getTime()));
		pg.setLastUpdateTime(new Timestamp(new Date().getTime()));
		pd.insertParaGroup(pg);
		List<ParaItem> items = pg.getItems();
		for (ParaItem pi : items) {
			pi.setId(UUID.randomUUID().toString().substring(0, 8));
			pi.setCreateTime(new Timestamp(new Date().getTime()));
			pi.setLastUpdateTime(new Timestamp(new Date().getTime()));
			pi.setgId(pg.getId());
			pd.insertParaItem(pi);
		}
	}
	
	public void removeParaGroup(String ids) {
		String[] arr = ids.split(",");
		List<String> list = Arrays.asList(arr);
		pd.deleteParaItem(list);
	}

	public ParaGroup queryParaGroup(String id) {
		return pd.selectParaGroup(id,0,0).get(0);
	}
	public void modifyParam(ParaGroup pg) {
		pg.setLastUpdateTime(new Timestamp(new Date().getTime()));
		pd.updateParamGroup(pg);
		List<ParaItem> list = pd.selectParaGroup(pg.getId(),0,0).get(0).getItems();
		List<String> del = new ArrayList<String>();
		Map<String, ParaItem> items1 = new HashMap<String, ParaItem>();
		for (ParaItem pl : list) {
			items1.put(pl.getId(), pl);
		}
		for (ParaItem pi : pg.getItems()) {
			if(pi.getName() != null){
				if(pi.getId() == null){
					pi.setId(UUID.randomUUID().toString().substring(0, 8));
					pi.setgId(pg.getId());
					pi.setCreateTime(new Timestamp(new Date().getTime()));
					pi.setLastUpdateTime(new Timestamp(new Date().getTime()));
					pd.insertParaItem(pi);
				}else{
						pi.setLastUpdateTime(new Timestamp(new Date().getTime()));
						pd.updateParamItem(pi);
						items1.remove(pi.getId());
				}
			}
		}
		for (String id : items1.keySet()) {
			del.add(id);
		}
		if(del.size() != 0){
			pd.deleteParaItems(del);
		}
	}

}
