/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.pm.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.TreeService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.pm.dao.PmTreeDao;
import com.thinkgem.jeesite.pm.entity.PmTree;

/**
 * 树结构生成Service
 * @author ThinkGem
 * @version 2015-04-06
 */
@Service
@Transactional(readOnly = true)
public class PmTreeService extends TreeService<PmTreeDao, PmTree> {

	public PmTree get(String id) {
		return super.get(id);
	}
	
	public List<PmTree> findList(PmTree testTree) {
		if (StringUtils.isNotBlank(testTree.getParentIds())){
			testTree.setParentIds(","+testTree.getParentIds()+",");
		}
		return super.findList(testTree);
	}
	
	@Transactional(readOnly = false)
	public void save(PmTree testTree) {
		super.save(testTree);
		if(testTree.getParent().getId() == "0"){
			PmTree gk = new PmTree();
			gk.setParent(testTree);
			gk.setName("概况");
			gk.setSort(1);
			super.save(gk);
		}
		
	}
	
	@Transactional(readOnly = false)
	public void delete(PmTree testTree) {
		super.delete(testTree);
	}
	
}