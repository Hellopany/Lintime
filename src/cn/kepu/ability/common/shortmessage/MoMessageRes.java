package cn.kepu.ability.common.shortmessage;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for moMessageRes complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="moMessageRes">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="resDetail" type="{http://sms.jwsserver.server.ema.ctc.com/}moMessageResDetail" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="revStat" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="revStatDes" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "moMessageRes", propOrder = { "resDetail", "revStat",
		"revStatDes" })
public class MoMessageRes {

	@XmlElement(nillable = true)
	protected List<MoMessageResDetail> resDetail;
	protected String revStat;
	protected String revStatDes;

	/**
	 * Gets the value of the resDetail property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live list, not a
	 * snapshot. Therefore any modification you make to the returned list will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the resDetail property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getResDetail().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the list
	 * {@link MoMessageResDetail }
	 * 
	 * 
	 */
	public List<MoMessageResDetail> getResDetail() {
		if (resDetail == null) {
			resDetail = new ArrayList<MoMessageResDetail>();
		}
		return this.resDetail;
	}

	/**
	 * Gets the value of the revStat property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getRevStat() {
		return revStat;
	}

	/**
	 * Sets the value of the revStat property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setRevStat(String value) {
		this.revStat = value;
	}

	/**
	 * Gets the value of the revStatDes property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getRevStatDes() {
		return revStatDes;
	}

	/**
	 * Sets the value of the revStatDes property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setRevStatDes(String value) {
		this.revStatDes = value;
	}

}
