package cn.kepu.ability.common.shortmessage;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

/**
 * This class was generated by the JAX-WS RI. JAX-WS RI 2.1.3-hudson-390-
 * Generated source version: 2.0
 * 
 */
@WebService(name = "ISmsOperator", targetNamespace = "http://sms.jwsserver.server.ema.ctc.com/")
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface ISmsOperator {

	/**
	 * 
	 * @param arg1
	 * @param arg0
	 * @return returns cn.kepu.ability.common.ReportMessageRes
	 */
	@WebMethod
	@WebResult(partName = "return")
	public ReportMessageRes getReport(
			@WebParam(name = "arg0", partName = "arg0") String arg0,
			@WebParam(name = "arg1", partName = "arg1") String arg1);

	/**
	 * 
	 * @param arg3
	 * @param arg2
	 * @param arg1
	 * @param arg0
	 * @return returns cn.kepu.ability.common.MtMessageRes
	 */
	@WebMethod
	@WebResult(partName = "return")
	public MtMessageRes sendSms(
			@WebParam(name = "arg0", partName = "arg0") String arg0,
			@WebParam(name = "arg1", partName = "arg1") String arg1,
			@WebParam(name = "arg2", partName = "arg2") String arg2,
			@WebParam(name = "arg3", partName = "arg3") MtMessage arg3);

	/**
	 * 
	 * @param arg1
	 * @param arg0
	 * @return returns cn.kepu.ability.common.MoMessageRes
	 */
	@WebMethod
	@WebResult(partName = "return")
	public MoMessageRes getSms(
			@WebParam(name = "arg0", partName = "arg0") String arg0,
			@WebParam(name = "arg1", partName = "arg1") String arg1);

	/**
	 * 
	 * @param arg1
	 * @param arg0
	 * @return returns cn.kepu.ability.common.BalanceRes
	 */
	@WebMethod
	@WebResult(partName = "return")
	public BalanceRes getBalance(
			@WebParam(name = "arg0", partName = "arg0") String arg0,
			@WebParam(name = "arg1", partName = "arg1") String arg1);

	/**
	 * 
	 * @param arg3
	 * @param arg2
	 * @param arg1
	 * @param arg0
	 * @return returns cn.kepu.ability.common.MtMessageRes
	 */
	@WebMethod
	@WebResult(partName = "return")
	public MtMessageRes bathSendSms(
			@WebParam(name = "arg0", partName = "arg0") String arg0,
			@WebParam(name = "arg1", partName = "arg1") String arg1,
			@WebParam(name = "arg2", partName = "arg2") String arg2,
			@WebParam(name = "arg3", partName = "arg3") MtMessageArray arg3);

}
