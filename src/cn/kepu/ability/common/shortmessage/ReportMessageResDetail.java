package cn.kepu.ability.common.shortmessage;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for reportMessageResDetail complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="reportMessageResDetail">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="phoneNumber" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="smsId" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="stat" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="statDes" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "reportMessageResDetail", propOrder = { "phoneNumber", "smsId",
		"stat", "statDes" })
public class ReportMessageResDetail {

	protected String phoneNumber;
	protected String smsId;
	protected String stat;
	protected String statDes;

	/**
	 * Gets the value of the phoneNumber property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getPhoneNumber() {
		return phoneNumber;
	}

	/**
	 * Sets the value of the phoneNumber property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setPhoneNumber(String value) {
		this.phoneNumber = value;
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
	 * Gets the value of the stat property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getStat() {
		return stat;
	}

	/**
	 * Sets the value of the stat property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setStat(String value) {
		this.stat = value;
	}

	/**
	 * Gets the value of the statDes property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getStatDes() {
		return statDes;
	}

	/**
	 * Sets the value of the statDes property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setStatDes(String value) {
		this.statDes = value;
	}

}
