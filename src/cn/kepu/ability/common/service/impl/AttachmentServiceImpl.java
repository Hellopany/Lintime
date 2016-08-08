package cn.kepu.ability.common.service.impl;

import java.io.File;
import java.security.InvalidParameterException;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.kepu.ability.common.Constants;
import cn.kepu.ability.common.bean.Attachment;
import cn.kepu.ability.common.dao.AttachmentDao;
import cn.kepu.ability.common.service.AttachmentService;
import cn.kepu.ability.utils.BusinessUtils;
import cn.kepu.utils.StringUtils;

/**
 * 文件（附件）上传相关的业务处理类
 * @author zhangzl
 */
@Repository("attachmentService")
public class AttachmentServiceImpl implements AttachmentService {

	private static final Log log = LogFactory.getLog(AttachmentServiceImpl.class);

	@Autowired
	private AttachmentDao attachmentDao;
	
	@Override
	public Attachment uploadFile(String category, int cid, File file, String filename) {
		if(StringUtils.isEmpty(category) || cid == 0 || file == null || StringUtils.isEmpty(filename)) {
			throw new InvalidParameterException("Can't upload file, not enough parameters");
		}
		String newFileName = BusinessUtils.uploadfile(file, filename);
		return addAttachment(category, file, filename, newFileName, cid, Constants.FILE_UPLOADED);
	}

	@Override
	public Attachment uploadFile(String category, File file, String filename) {
		if(StringUtils.isEmpty(category) || file == null || StringUtils.isEmpty(filename)) {
			throw new InvalidParameterException("Can't upload file, not enough parameters");
		}
		String newFileName = BusinessUtils.uploadfile(file, filename);
		return addAttachment(category, file, filename, newFileName, 0, Constants.FILE_UPLOADING);
	}
	
	@Override
	public Attachment uploadFileWithoutCheck(String category, int cid, File file, String filename) {
		if(StringUtils.isEmpty(category) || cid == 0 || file == null || StringUtils.isEmpty(filename)) {
			throw new InvalidParameterException("Can't upload file, not enough parameters");
		}
		String newFileName = BusinessUtils.uploadfileWithoutCheck(file, filename);
		return addAttachment(category, file, filename, newFileName, cid, Constants.FILE_UPLOADED);
	}

	@Override
	public Attachment uploadFileWithoutCheck(String category, File file, String filename) {
		if(StringUtils.isEmpty(category) || file == null || StringUtils.isEmpty(filename)) {
			throw new InvalidParameterException("Can't upload file, not enough parameters");
		}
		String newFileName = BusinessUtils.uploadfileWithoutCheck(file, filename);
		return addAttachment(category, file, filename, newFileName, 0, Constants.FILE_UPLOADING);
	}

	@Override
	public boolean completeUpload(int id, int cid) {
		if(cid == 0) {
			throw new InvalidParameterException("Can't complete uploading file, category data parameter is not set");
		}
		Attachment dbattachment = attachmentDao.get(id);
		if(dbattachment == null) {
			log.warn("The attachment ["+id+"] is not exist");
			return false;
		}
		dbattachment.setCid(cid);
		dbattachment.setStatus(Constants.FILE_UPLOADED);
		try {
			attachmentDao.update(dbattachment);
			return true;
		} catch (Exception e) {
			log.error("Complete upload file ["+dbattachment.getName()+"] failed", e);
		}
		return false;
	}

	@Override
	public boolean deleteAttachment(int id) {
		return attachmentDao.deleteAttachment(id);
	}

	@Override
	public boolean deleteAttachmentByCid(int cid) {
		return attachmentDao.deleteAttachmentByCid(cid);
	}

	@Override
	public Attachment getAttachment(int id) {
		return attachmentDao.get(id);
	}

	@Override
	public List<Attachment> getAttachmentByCid(String category, int cid) {
		return getAttachmentByCid(category, cid, Constants.FILE_UPLOADED);
	}

	@Override
	public List<Attachment> getAttachmentByCid(String category, int cid, String status) {
		return attachmentDao.getAttachmentByCid(category, cid, status);
	}

	@Override
	public Attachment uploadImage(String category, int cid, File file,
			String filename) {
		if(StringUtils.isEmpty(category) || cid == 0 || file == null || StringUtils.isEmpty(filename)) {
			throw new InvalidParameterException("Can't upload file, not enough parameters");
		}
		String newFileName = BusinessUtils.uploadimage(file, filename);
		return addAttachment(category, file, filename, newFileName, cid, Constants.FILE_UPLOADED);
	}
	
	@Override
	public Attachment uploadImagephoto(String category, int cid, File file,
			String filename,String isphoto) {
		if(StringUtils.isEmpty(category) || cid == 0 || file == null || StringUtils.isEmpty(filename) || StringUtils.isEmpty(isphoto)) {
			throw new InvalidParameterException("Can't upload file, not enough parameters");
		}
		String newFileName = BusinessUtils.uploadimage(file, filename);
		return addAttachmentPhoto(category, file, filename, newFileName, cid, Constants.FILE_UPLOADED, isphoto);
	}

	@Override
	public Attachment uploadImage(String category, File file, String filename) {
		if(StringUtils.isEmpty(category) || file == null || StringUtils.isEmpty(filename)) {
			throw new InvalidParameterException("Can't upload file, not enough parameters");
		}
		String newFileName = BusinessUtils.uploadimage(file, filename);
		return addAttachment(category, file, filename, newFileName, 0, Constants.FILE_UPLOADING);
	}

	private Attachment addAttachment(String category, File file, String filename, String newFileName, int cid, String status) {
		if (!StringUtils.isEmpty(newFileName)) {
			Attachment attachment = new Attachment();
			attachment.setCategory(category);
			attachment.setCid(cid);
			attachment.setName(filename);
			attachment.setSize((int)file.length());
			attachment.setUrl(newFileName);
			attachment.setUploadTime(BusinessUtils.getRequestTime());
			attachment.setStatus(status);
			attachment.setDescribe("");
			try {
				int id = (Integer)attachmentDao.save(attachment);
				attachment.setId(id);
				return attachment;
			} catch (Exception e) {
				log.error("Upload file ["+filename+"] stored into DB failed", e);
			}
		}
		return null;
	}
	private Attachment addAttachmentPhoto(String category, File file, String filename, String newFileName, int cid, String status,String isphoto) {
		if (!StringUtils.isEmpty(newFileName)) {
			Attachment attachment = new Attachment();
			attachment.setCategory(category);
			attachment.setCid(cid);
			attachment.setName(filename);
			attachment.setSize((int)file.length());
			attachment.setUrl(newFileName);
			attachment.setUploadTime(BusinessUtils.getRequestTime());
			attachment.setStatus(status);
			attachment.setDescribe("");
			try {
				int id = (Integer)attachmentDao.save(attachment);
				attachment.setId(id);
				return attachment;
			} catch (Exception e) {
				log.error("Upload file ["+filename+"] stored into DB failed", e);
			}
		}
		return null;
	}

	@Override
	public Attachment getAttachmentByisphoto(String category, int cid,
			String status, String isphoto) {
		return attachmentDao.getAttachmentByisphoto(category,cid, status,isphoto);
	}

	@Override
	public boolean deleteAttachmentByisphoto(String category,int cid, String isphoto) {
		return attachmentDao.deleteAttachmentByisphoto(category,cid,isphoto);
	}

	@Override
	public boolean deleteAttachmentByCatAndCid(String pdAtteninclude, Integer id) {
		String sql = "delete From Attachment where category = ? and cid = ?";
		Object[] param = {pdAtteninclude,id};
		attachmentDao.executeHql(sql, param);
		return true;
	}
	@Override
	public List<Attachment> getAttachmentAllByCid(String category, int cid){
		return attachmentDao.getAttachmentAllByCid(category,cid);
	}

	public List<Attachment> getAttachmentByCid(int cid){
		return attachmentDao.getAttachmentByCid(cid);
	}
	
	public Attachment updateAttachment(Attachment attachment){
		return attachmentDao.updateAttachment(attachment);
	}
}
