package com.dcits.credit.serviceaccept;

public class IServiceAcceptWSPwdProxy implements com.dcits.credit.serviceaccept.IServiceAcceptWSPwd_PortType {
  private String _endpoint = null;
  private com.dcits.credit.serviceaccept.IServiceAcceptWSPwd_PortType iServiceAcceptWSPwd_PortType = null;
  
  public IServiceAcceptWSPwdProxy() {
    _initIServiceAcceptWSPwdProxy();
  }
  
  public IServiceAcceptWSPwdProxy(String endpoint) {
    _endpoint = endpoint;
    _initIServiceAcceptWSPwdProxy();
  }
  
  private void _initIServiceAcceptWSPwdProxy() {
    try {
      iServiceAcceptWSPwd_PortType = (new com.dcits.credit.serviceaccept.IServiceAcceptWSPwd_ServiceLocator()).getServiceAcceptWSPwdImplPort();
      if (iServiceAcceptWSPwd_PortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)iServiceAcceptWSPwd_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)iServiceAcceptWSPwd_PortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (iServiceAcceptWSPwd_PortType != null)
      ((javax.xml.rpc.Stub)iServiceAcceptWSPwd_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.dcits.credit.serviceaccept.IServiceAcceptWSPwd_PortType getIServiceAcceptWSPwd_PortType() {
    if (iServiceAcceptWSPwd_PortType == null)
      _initIServiceAcceptWSPwdProxy();
    return iServiceAcceptWSPwd_PortType;
  }
  
  public java.lang.String passwordModifReq(java.lang.String querymessage) throws java.rmi.RemoteException{
    if (iServiceAcceptWSPwd_PortType == null)
      _initIServiceAcceptWSPwdProxy();
    return iServiceAcceptWSPwd_PortType.passwordModifReq(querymessage);
  }
  
  
}