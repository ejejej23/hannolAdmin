package com.sp.amenity;

import java.util.List;
import java.util.Map;

public interface AmenityService {
	public List<Amenity> checkList(Map<String,Object> map);
	public int datanum(Map<String,Object> map);
	
}
