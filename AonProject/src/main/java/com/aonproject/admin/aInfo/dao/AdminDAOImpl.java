package com.aonproject.admin.aInfo.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.jdbc.JdbcDaoImpl;
import org.springframework.stereotype.Repository;

import com.aonproject.admin.aInfo.controller.AdminController;
import com.aonproject.admin.aInfo.vo.AdminVO;


@Repository
public class AdminDAOImpl extends JdbcDaoImpl implements AdminDAO{
	
	private Logger logger = Logger.getLogger(AdminController.class);
	
	@Autowired
	private DataSource dataSource;
	
	@PostConstruct
	void init(){
		setDataSource(dataSource);
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		List<UserDetails> users = loadUsersByUsername(username);
		
		if(users.size() == 0){
			logger.debug("Query returned no results for user '" + username + "'");
			UsernameNotFoundException ue = new UsernameNotFoundException(messages.getMessage("JdbcDaoImpl.notFound", new Object[]{username}, "Username {0} not found"));
			throw ue;
		}
		
		AdminVO user = (AdminVO) users.get(0);
		
		Set<GrantedAuthority> dbAuthsSet = new HashSet<GrantedAuthority>();
		
		if(getEnableAuthorities()){
			dbAuthsSet.addAll(loadUserAuthorities(username));
		}
		
		if(getEnableGroups()){
			dbAuthsSet.addAll(loadGroupAuthorities(username));
		}
		
		List<GrantedAuthority> dbAuths = new ArrayList<GrantedAuthority>(dbAuthsSet);
		user.setAuthorities(dbAuths);
		
		if(dbAuths.size() == 0){
			logger.debug("User '" + username + "' has no authorities and will be treated as 'not found'");
			UsernameNotFoundException ue = new UsernameNotFoundException(messages.getMessage("JdbcDaoImpl.noAuthority", new Object[] {username}, "User {0} has no GrantedAuthority"));
			throw ue;
		}
		return user;
	}
	
	@Override
	protected List<UserDetails> loadUsersByUsername(String username) {
		// TODO Auto-generated method stub
		return getJdbcTemplate().query(getUsersByUsernameQuery(), new String[] {username}, new RowMapper<UserDetails>() {
			public UserDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
				int a_no = rs.getInt(1);
				String a_id = rs.getString(2);
				String a_pwd = rs.getString(3);

				return new AdminVO(a_no, a_id, a_pwd, AuthorityUtils.NO_AUTHORITIES);
				}
			});
		}
	
	@Override
	protected List<GrantedAuthority> loadUserAuthorities(String username) {
	// TODO Auto-generated method stub
	return getJdbcTemplate().query(getAuthoritiesByUsernameQuery(), new String[] {username}, new RowMapper<GrantedAuthority>() {
		public GrantedAuthority mapRow(ResultSet rs, int rowNum) throws SQLException {
			String roleName = getRolePrefix() + rs.getString(1);
			return new SimpleGrantedAuthority(roleName);
			}
		});
	}
	@Override
	protected List<GrantedAuthority> loadGroupAuthorities(String username) {
		// TODO Auto-generated method stub
		return super.loadGroupAuthorities(username);
	}

	// 아래서부터 AdminDAO 구현
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int joinGo(AdminVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("joinGo",vo);
	}

	@Override
	public int overlapChk(AdminVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("overlapChk", vo);
	}

	@Override
	public int myInfoUpdate(AdminVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("myInfoUpdate", vo);
	}

	@Override
	public AdminVO adminInfo(AdminVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminInfo", vo);
	}

	@Override
	public int newNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("newNo");
	}
}
