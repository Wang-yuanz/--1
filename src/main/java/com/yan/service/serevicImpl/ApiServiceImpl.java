package com.yan.service.serevicImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yan.dao.ApiMapper;
import com.yan.pojo.ApiWithBLOBs;
import com.yan.service.ApiService;
import com.yan.util.ToolUtil;

@Service
public class ApiServiceImpl implements ApiService {
	@Autowired
	ApiMapper apiMapper;

	@Override
	public List<ApiWithBLOBs> getlist() {

		List<ApiWithBLOBs> list = apiMapper.selectApis();

		return list;
	}

	@Override
	public int addApi(ApiWithBLOBs api) {
		if (ToolUtil.isEmpty(api)) {
			return 0;
		}
		int isok = apiMapper.insert(api);
		return isok;
	}

	@Override
	public int updateApi(ApiWithBLOBs api) {
		if (ToolUtil.isEmpty(api)) {
			return 0;
		}

		int isok = apiMapper.updateByPrimaryKeySelective(api);
		return isok;
	}

}
