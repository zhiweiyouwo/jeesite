/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.pm.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.pm.entity.PmTree;
import com.thinkgem.jeesite.pm.service.PmTreeService;
import com.thinkgem.jeesite.common.utils.StringUtils;

/**
 * 项目生成Controller
 * 
 * @author ThinkGem
 * @version 2015-04-06
 */
@Controller
@RequestMapping(value = "${adminPath}/pm/pmTree")
public class PmTreeController extends BaseController {

	@Autowired
	private PmTreeService pmTreeService;
	
	@Autowired
	private SystemService systemService;

	@RequiresPermissions("pm:pmTree:view")
	@RequestMapping(value = { "index" })
	public String index(User user, Model model) {
		return "jeesite/pm/pmIndex";
	}

	@RequiresPermissions("pm:pmTree:view")
	@RequestMapping(value = { "detail" })
	public String detail(@RequestParam(required = false) String id, Model model) {
		PmTree testTree = null;
		if (StringUtils.isNotBlank(id)) {
			testTree = pmTreeService.get(id);
		}
		pmForm(testTree, model);
		return "jeesite/pm/pmDetail";
	}

	@ModelAttribute
	public PmTree get(@RequestParam(required = false) String id) {
		PmTree entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = pmTreeService.get(id);
		}
		if (entity == null) {
			entity = new PmTree();
		}
		return entity;
	}

	@RequiresPermissions("pm:pmTree:view")
	@RequestMapping(value = { "list", "" })
	public String list(PmTree testTree, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<PmTree> list = pmTreeService.findList(testTree);
		model.addAttribute("list", list);
		return "jeesite/pm/pmTreeList";
	}

	@RequiresPermissions("pm:pmTree:view")
	@RequestMapping(value = "form")
	public String form(PmTree testTree, Model model) {
		pmForm(testTree, model);
		return "jeesite/pm/pmTreeForm";
	}

	private void pmForm(PmTree testTree, Model model) {
		if (testTree.getParent() != null && StringUtils.isNotBlank(testTree.getParent().getId())) {
			testTree.setParent(pmTreeService.get(testTree.getParent().getId()));
			// 获取排序号，最末节点排序号+30
			if (StringUtils.isBlank(testTree.getId())) {
				PmTree testTreeChild = new PmTree();
				testTreeChild.setParent(new PmTree(testTree.getParent().getId()));
				List<PmTree> list = pmTreeService.findList(testTree);
				if (list.size() > 0) {
					testTree.setSort(list.get(list.size() - 1).getSort());
					if (testTree.getSort() != null) {
						testTree.setSort(testTree.getSort() + 30);
					}
				}
			}
		}
		if (testTree.getSort() == null) {
			testTree.setSort(30);
		}
		String userIds = testTree.getUserids();
		String names = "";
		if(StringUtils.isNotBlank(userIds)){
			for(String userId : userIds.split(","))
			{
				User user = systemService.getUser(userId);
				if(user != null){
					names += ","+user.getName();
				}
			}
			if(names.length()>0){
				names = names.substring(1);
			}
			testTree.setUsernames(names);
		}
		
		model.addAttribute("testTree", testTree);
	}

	@RequiresPermissions("pm:pmTree:edit")
	@RequestMapping(value = "save")
	public String save(PmTree testTree, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, testTree)) {
			return form(testTree, model);
		}
		pmTreeService.save(testTree);
		addMessage(redirectAttributes, "保存项目成功");
		return "redirect:" + Global.getAdminPath() + "/pm/pmTree/?repage";
	}

	@RequiresPermissions("pm:pmTree:edit")
	@RequestMapping(value = "saveMy")
	public String saveMy(PmTree testTree, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, testTree)) {
			return form(testTree, model);
		}
		pmTreeService.save(testTree);
		addMessage(redirectAttributes, "保存项目成功");
		return "redirect:" + Global.getAdminPath() + "/pm/pmTree/detail?id=" + testTree.getId();
	}

	@RequiresPermissions("pm:pmTree:edit")
	@RequestMapping(value = "delete")
	public String delete(PmTree testTree, RedirectAttributes redirectAttributes) {
		pmTreeService.delete(testTree);
		addMessage(redirectAttributes, "删除项目成功");
		return "redirect:" + Global.getAdminPath() + "/pm/pmTree/?repage";
	}

	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required = false) String extId,
			HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<PmTree> list = pmTreeService.findList(new PmTree());
		gentTree(extId, mapList, list);
		return mapList;
	}

	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeDataMy")
	public List<Map<String, Object>> treeDataMy(@RequestParam(required = false) String extId, String pname,
			HttpServletRequest request, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		PmTree testTree = new PmTree();
		testTree.setName(pname);
		testTree.setUserid(UserUtils.getPrincipal().getId());
		List<PmTree> list = pmTreeService.findList(testTree);
		gentTree(extId, mapList, list);
		return mapList;
	}

	private void gentTree(String extId, List<Map<String, Object>> mapList, List<PmTree> list) {
		for (int i = 0; i < list.size(); i++) {
			PmTree e = list.get(i);
			if (StringUtils.isBlank(extId) || (extId != null && !extId.equals(e.getId())
					&& e.getParentIds().indexOf("," + extId + ",") == -1)) {
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParentId());
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
	}

}