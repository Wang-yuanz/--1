package com.yan.service;

import java.util.List;

import com.yan.pojo.ApiWithBLOBs;

public interface ApiService {

	List<ApiWithBLOBs> getlist();

	int addApi(ApiWithBLOBs api);

	int updateApi(ApiWithBLOBs api);

}
