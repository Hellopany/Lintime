package cn.kepu.ability.common.shortmessage;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for balanceRes complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="balanceRes">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="demo" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
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
@XmlType(name = "balanceRes", propOrder = { "demo", "revStat", "revStatDes" })
public class BalanceRes {

	protected String demo;
	protected String revStat;
	protected String revStatDes;

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
