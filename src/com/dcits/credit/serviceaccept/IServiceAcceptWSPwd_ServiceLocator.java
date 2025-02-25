/**
 * IServiceAcceptWSPwd_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.dcits.credit.serviceaccept;

public class IServiceAcceptWSPwd_ServiceLocator extends org.apache.axis.client.Service implements com.dcits.credit.serviceaccept.IServiceAcceptWSPwd_Service {

    public IServiceAcceptWSPwd_ServiceLocator() {
    }


    public IServiceAcceptWSPwd_ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public IServiceAcceptWSPwd_ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for ServiceAcceptWSPwdImplPort
    private java.lang.String ServiceAcceptWSPwdImplPort_address = "http://172.200.100.57:8080/creditreference/v2/prod/channel-change-password/ServiceAccept";

    public java.lang.String getServiceAcceptWSPwdImplPortAddress() {
        return ServiceAcceptWSPwdImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String ServiceAcceptWSPwdImplPortWSDDServiceName = "ServiceAcceptWSPwdImplPort";

    public java.lang.String getServiceAcceptWSPwdImplPortWSDDServiceName() {
        return ServiceAcceptWSPwdImplPortWSDDServiceName;
    }

    public void setServiceAcceptWSPwdImplPortWSDDServiceName(java.lang.String name) {
        ServiceAcceptWSPwdImplPortWSDDServiceName = name;
    }

    public com.dcits.credit.serviceaccept.IServiceAcceptWSPwd_PortType getServiceAcceptWSPwdImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(ServiceAcceptWSPwdImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getServiceAcceptWSPwdImplPort(endpoint);
    }

    public com.dcits.credit.serviceaccept.IServiceAcceptWSPwd_PortType getServiceAcceptWSPwdImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
        	com.dcits.credit.serviceaccept.IServiceAcceptWSPwdSoapBindingStub _stub = new com.dcits.credit.serviceaccept.IServiceAcceptWSPwdSoapBindingStub(portAddress, this);
            _stub.setPortName(getServiceAcceptWSPwdImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setServiceAcceptWSPwdImplPortEndpointAddress(java.lang.String address) {
        ServiceAcceptWSPwdImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.dcits.credit.serviceaccept.IServiceAcceptWSPwd_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
            	com.dcits.credit.serviceaccept.IServiceAcceptWSPwdSoapBindingStub _stub = new com.dcits.credit.serviceaccept.IServiceAcceptWSPwdSoapBindingStub(new java.net.URL(ServiceAcceptWSPwdImplPort_address), this);
                _stub.setPortName(getServiceAcceptWSPwdImplPortWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("ServiceAcceptWSPwdImplPort".equals(inputPortName)) {
            return getServiceAcceptWSPwdImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://serviceaccept.ws.service.pwd.channel.pbccrc.org/", "IServiceAcceptWSPwd");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://serviceaccept.ws.service.pwd.channel.pbccrc.org/", "ServiceAcceptWSPwdImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("ServiceAcceptWSPwdImplPort".equals(portName)) {
            setServiceAcceptWSPwdImplPortEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
