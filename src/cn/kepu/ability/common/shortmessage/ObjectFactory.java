package cn.kepu.ability.common.shortmessage;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;

/**
 * This object contains factory methods for each Java content interface and Java
 * element interface generated in the cn.kepu.ability.common package.
 * <p>
 * An ObjectFactory allows you to programatically construct new instances of the
 * Java representation for XML content. The Java representation of XML content
 * can consist of schema derived interfaces and classes representing the binding
 * of schema type definitions, element declarations and model groups. Factory
 * methods for each of these are provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

	private final static QName _ComCtcEmaServerJwsserverSmsMtMessageResDetail_QNAME = new QName(
			"http://sms.jwsserver.server.ema.ctc.com/",
			"com.ctc.ema.server.jwsserver.sms.MtMessageResDetail");
	private final static QName _ComCtcEmaServerJwsserverSmsReportMessageRes_QNAME = new QName(
			"http://sms.jwsserver.server.ema.ctc.com/",
			"com.ctc.ema.server.jwsserver.sms.ReportMessageRes");
	private final static QName _ComCtcEmaServerJwsserverSmsBalanceRes_QNAME = new QName(
			"http://sms.jwsserver.server.ema.ctc.com/",
			"com.ctc.ema.server.jwsserver.sms.BalanceRes");
	private final static QName _ComCtcEmaServerJwsserverSmsReportMessageResDetail_QNAME = new QName(
			"http://sms.jwsserver.server.ema.ctc.com/",
			"com.ctc.ema.server.jwsserver.sms.ReportMessageResDetail");
	private final static QName _ComCtcEmaServerJwsserverSmsMoMessageRes_QNAME = new QName(
			"http://sms.jwsserver.server.ema.ctc.com/",
			"com.ctc.ema.server.jwsserver.sms.MoMessageRes");
	private final static QName _ComCtcEmaServerJwsserverSmsMtMessage_QNAME = new QName(
			"http://sms.jwsserver.server.ema.ctc.com/",
			"com.ctc.ema.server.jwsserver.sms.MtMessage");
	private final static QName _ComCtcEmaServerJwsserverSmsMoMessageResDetail_QNAME = new QName(
			"http://sms.jwsserver.server.ema.ctc.com/",
			"com.ctc.ema.server.jwsserver.sms.MoMessageResDetail");
	private final static QName _ComCtcEmaServerJwsserverSmsMtMessageRes_QNAME = new QName(
			"http://sms.jwsserver.server.ema.ctc.com/",
			"com.ctc.ema.server.jwsserver.sms.MtMessageRes");

	/**
	 * Create a new ObjectFactory that can be used to create new instances of
	 * schema derived classes for package: cn.kepu.ability.common
	 * 
	 */
	public ObjectFactory() {
	}

	/**
	 * Create an instance of {@link ReportMessageRes }
	 * 
	 */
	public ReportMessageRes createReportMessageRes() {
		return new ReportMessageRes();
	}

	/**
	 * Create an instance of {@link MoMessageRes }
	 * 
	 */
	public MoMessageRes createMoMessageRes() {
		return new MoMessageRes();
	}

	/**
	 * Create an instance of {@link MtMessageRes }
	 * 
	 */
	public MtMessageRes createMtMessageRes() {
		return new MtMessageRes();
	}

	/**
	 * Create an instance of {@link MtMessage }
	 * 
	 */
	public MtMessage createMtMessage() {
		return new MtMessage();
	}

	/**
	 * Create an instance of {@link MtMessageArray }
	 * 
	 */
	public MtMessageArray createMtMessageArray() {
		return new MtMessageArray();
	}

	/**
	 * Create an instance of {@link ReportMessageResDetail }
	 * 
	 */
	public ReportMessageResDetail createReportMessageResDetail() {
		return new ReportMessageResDetail();
	}

	/**
	 * Create an instance of {@link MoMessageResDetail }
	 * 
	 */
	public MoMessageResDetail createMoMessageResDetail() {
		return new MoMessageResDetail();
	}

	/**
	 * Create an instance of {@link BalanceRes }
	 * 
	 */
	public BalanceRes createBalanceRes() {
		return new BalanceRes();
	}

	/**
	 * Create an instance of {@link MtMessageResDetail }
	 * 
	 */
	public MtMessageResDetail createMtMessageResDetail() {
		return new MtMessageResDetail();
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}
	 * {@link MtMessageResDetail }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://sms.jwsserver.server.ema.ctc.com/", name = "com.ctc.ema.server.jwsserver.sms.MtMessageResDetail")
	public JAXBElement<MtMessageResDetail> createComCtcEmaServerJwsserverSmsMtMessageResDetail(
			MtMessageResDetail value) {
		return new JAXBElement<MtMessageResDetail>(
				_ComCtcEmaServerJwsserverSmsMtMessageResDetail_QNAME,
				MtMessageResDetail.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}
	 * {@link ReportMessageRes }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://sms.jwsserver.server.ema.ctc.com/", name = "com.ctc.ema.server.jwsserver.sms.ReportMessageRes")
	public JAXBElement<ReportMessageRes> createComCtcEmaServerJwsserverSmsReportMessageRes(
			ReportMessageRes value) {
		return new JAXBElement<ReportMessageRes>(
				_ComCtcEmaServerJwsserverSmsReportMessageRes_QNAME,
				ReportMessageRes.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link BalanceRes }
	 * {@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://sms.jwsserver.server.ema.ctc.com/", name = "com.ctc.ema.server.jwsserver.sms.BalanceRes")
	public JAXBElement<BalanceRes> createComCtcEmaServerJwsserverSmsBalanceRes(
			BalanceRes value) {
		return new JAXBElement<BalanceRes>(
				_ComCtcEmaServerJwsserverSmsBalanceRes_QNAME, BalanceRes.class,
				null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}
	 * {@link ReportMessageResDetail }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://sms.jwsserver.server.ema.ctc.com/", name = "com.ctc.ema.server.jwsserver.sms.ReportMessageResDetail")
	public JAXBElement<ReportMessageResDetail> createComCtcEmaServerJwsserverSmsReportMessageResDetail(
			ReportMessageResDetail value) {
		return new JAXBElement<ReportMessageResDetail>(
				_ComCtcEmaServerJwsserverSmsReportMessageResDetail_QNAME,
				ReportMessageResDetail.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link MoMessageRes }
	 * {@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://sms.jwsserver.server.ema.ctc.com/", name = "com.ctc.ema.server.jwsserver.sms.MoMessageRes")
	public JAXBElement<MoMessageRes> createComCtcEmaServerJwsserverSmsMoMessageRes(
			MoMessageRes value) {
		return new JAXBElement<MoMessageRes>(
				_ComCtcEmaServerJwsserverSmsMoMessageRes_QNAME,
				MoMessageRes.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link MtMessage }
	 * {@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://sms.jwsserver.server.ema.ctc.com/", name = "com.ctc.ema.server.jwsserver.sms.MtMessage")
	public JAXBElement<MtMessage> createComCtcEmaServerJwsserverSmsMtMessage(
			MtMessage value) {
		return new JAXBElement<MtMessage>(
				_ComCtcEmaServerJwsserverSmsMtMessage_QNAME, MtMessage.class,
				null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}
	 * {@link MoMessageResDetail }{@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://sms.jwsserver.server.ema.ctc.com/", name = "com.ctc.ema.server.jwsserver.sms.MoMessageResDetail")
	public JAXBElement<MoMessageResDetail> createComCtcEmaServerJwsserverSmsMoMessageResDetail(
			MoMessageResDetail value) {
		return new JAXBElement<MoMessageResDetail>(
				_ComCtcEmaServerJwsserverSmsMoMessageResDetail_QNAME,
				MoMessageResDetail.class, null, value);
	}

	/**
	 * Create an instance of {@link JAXBElement }{@code <}{@link MtMessageRes }
	 * {@code >}
	 * 
	 */
	@XmlElementDecl(namespace = "http://sms.jwsserver.server.ema.ctc.com/", name = "com.ctc.ema.server.jwsserver.sms.MtMessageRes")
	public JAXBElement<MtMessageRes> createComCtcEmaServerJwsserverSmsMtMessageRes(
			MtMessageRes value) {
		return new JAXBElement<MtMessageRes>(
				_ComCtcEmaServerJwsserverSmsMtMessageRes_QNAME,
				MtMessageRes.class, null, value);
	}

}
