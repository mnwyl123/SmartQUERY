
package com.dcits.credit.wsimport.password;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.9-b130926.1035
 * Generated source version: 2.2
 * 
 */
@WebService(name = "IServiceAcceptWSPwd", targetNamespace = "http://serviceaccept.ws.service.pwd.channel.pbccrc.org/")
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface IServiceAcceptWSPwd {


    /**
     * 
     * @param querymessage
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(partName = "return")
    public String passwordModifReq(
        @WebParam(name = "querymessage", partName = "querymessage")
        String querymessage);

}
