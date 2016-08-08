package cn.kepu.ability.common.dao;

import java.util.List;

import cn.kepu.ability.common.bean.Attachment;
import cn.kepu.base.dao.BaseDao;

/**
 * 附件信息
 * @author zhangzl
 */
public interface AttachmentDao extends BaseDao<Attachment> {

	public List<Attachment> getAttachmentByCid(int cid, String status);

	public List<Attachment> getAttachmentByCid(String category, int cid, String status);
	
	public Attachment getAttachmentByisphoto(String category,int cid, String status,String isphoto);

	public boolean deleteAttachment(int id);

	public boolean deleteAttachmentByCid(int cid);
	
	public boolean deleteAttachmentByisphoto(String category,int cid,String isphoto);

	public List<Attachment> getAttachmentAllByCid(String category,int cid);
	
	public List<Attachment> getAttachmentByCid(int cid);
	
	public Attachment updateAttachment(Attachment attachment);
}
