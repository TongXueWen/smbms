package com.yc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Select;

import com.yc.po.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    @Select("select rolename from smbms_role")
    List<String> selectRoleNameByAll();
    
    @Select("select id,rolename from smbms_role")
    List<Role> selectRoleNameAndIdByAll();
}