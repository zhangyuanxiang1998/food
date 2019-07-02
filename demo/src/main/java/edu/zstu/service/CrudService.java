package edu.zstu.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;

import com.google.common.collect.Lists;

import edu.zstu.repository.BaseDao;


public abstract class CrudService<T, D extends BaseDao<T>> {
	
	/**
	 * 从子类注入数据访问对象
	 * 
	 * @return
	 */
	protected abstract D getDao();
	
	public T findOne(Long id){
		return this.getDao().findOne(id);
	}
	
	public List<T> findAll(){
		Iterable<T> iter =  this.getDao().findAll();
		return Lists.newArrayList(iter);
	}
	
	public List<T> findAll(Sort sort){
		Iterable<T> iter =  this.getDao().findAll(sort);
		return Lists.newArrayList(iter);
	}
	
	public void save(T entity) {
		if(entity == null)
			return;
		this.getDao().save(entity);
	}
	
	public void delete(Long id) {
		this.getDao().delete(id);
	}
	
	
	public void deleteAll() {
		this.getDao().deleteAll();
	}
	
	/**
	 * 创建动态查询条件组合.
	 * @throws ParseException 
	 */
	protected Specification<T> buildSpecification(Map<String, Object> searchParams, final Class<T> clazz) throws ParseException {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		//特别处理日期类型的过滤条件
		for (Map.Entry<String, SearchFilter> entry : filters.entrySet()) {
			String value=(String)entry.getValue().value;
			if(value.matches("[0-9]{4}-[0-9]{2}-[0-9]{2}")){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				SearchFilter filter = new SearchFilter(entry.getValue().fieldName, entry.getValue().operator, sdf.parse(value));
				filters.put(entry.getKey(), filter);				
			}
		}
		Specification<T> spec = DynamicSpecifications.bySearchFilter(filters.values(), clazz);
		return spec;
	}	
	public List<T> getList(Map<String, Object> searchParams,
			Sort sort, final Class<T> clazz) throws ParseException {
		Specification<T> spec = buildSpecification(searchParams, clazz);

		return this.getDao().findAll(spec, sort);
	}	
	public Page<T> getList(Map<String, Object> searchParams, int pageNumber, int pageSize,
			String sortField, final Class<T> clazz) throws ParseException {
		Sort sort =null;		
		if(sortField.isEmpty())
			sort =  new Sort(Direction.DESC, "id");
		else
			sort =  new Sort(Direction.DESC, sortField);
		PageRequest pageRequest =new PageRequest(pageNumber - 1, pageSize, sort); 
		Specification<T> spec = buildSpecification(searchParams, clazz);
		return this.getDao().findAll(spec, pageRequest);
	}
	

}
