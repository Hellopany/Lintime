package cn.kepu.ability.common.shortmessage;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for mtMessage complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="mtMessage">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="sendTime" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="content" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="demo" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="phoneNumber" type="{http://www.w3.org/2001/XMLSchema}string" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="smsId" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="subCode" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "mtMessage", propOrder = { "sendTime", "content", "demo",
		"phoneNumber", "smsId", "subCode" })
public class MtMessage {

	protected Date sendTime;
	protected String content;
	protected String demo;
	protected String[] phoneNumber;
	protected String smsId;
	protected String subCode;

	/**
	 * Gets the value of the sendTime property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public Date getSendTime() {
		return sendTime;
	}

	/**
	 * Sets the value of the sendTime property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setSendTime(Date value) {
		this.sendTime = value;
	}

	/**
	 * Gets the value of the content property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getContent() {
		return content;
	}

	/**
	 * Sets the value of the content property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setContent(String value) {
		this.content = value;
	}

	/**
	 * Gets the value of the demo property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getDemo() {
		return demo;
	}

	/**
	 * Sets the value of the demo property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setDemo(String value) {
		this.demo = value;
	}

	/**
	 * Gets the value of the phoneNumber property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live list, not a
	 * snapshot. Therefore any modification you make to the returned list will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the phoneNumber property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getPhoneNumber().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the list {@link String }
	 * 
	 * 
	 */
	public String[] getPhoneNumber() {

		return this.phoneNumber;
	}

	public void setPhoneNumber(String[] list) {
			phoneNumber = list;
	}
	/**
	 * Gets the value of the smsId property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getSmsId() {
		return smsId;
	}

	/**
	 * Sets the value of the smsId property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setSmsId(String value) {
		this.smsId = value;
	}

	/**
	 * Gets the value of the subCode property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getSubCode() {
		return subCode;
	}

	/**
	 * Sets the value of the subCode property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setSubCode(String value) {
		this.subCode = value;
	}

}
