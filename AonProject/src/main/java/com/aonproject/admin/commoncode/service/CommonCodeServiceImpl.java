package com.aonproject.admin.commoncode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.admin.commoncode.dao.CommonCodeDAO;
import com.aonproject.admin.commoncode.vo.CommonCodeVO;

@Service
@Transactional
public class CommonCodeServiceImpl implements CommonCodeService {
	
	@Autowired
	private CommonCodeDAO commonCodeDAO;
	
	// 怨듯넻 肄붾뱶 由ъ뒪�듃 援ы쁽
	@Override
	public List<CommonCodeVO> commonCodeList(CommonCodeVO cvo) {
		return commonCodeDAO.commonCodeList(cvo);
	}

}
