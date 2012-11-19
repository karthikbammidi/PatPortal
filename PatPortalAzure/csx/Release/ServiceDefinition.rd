<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="PatPortalAzure" generation="1" functional="0" release="0" Id="9df0553d-b88d-4195-9fdc-e8b85903842a" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="PatPortalAzureGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="PatPortal:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/PatPortalAzure/PatPortalAzureGroup/LB:PatPortal:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="PatPortal:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/PatPortalAzure/PatPortalAzureGroup/MapPatPortal:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="PatPortalInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/PatPortalAzure/PatPortalAzureGroup/MapPatPortalInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:PatPortal:Endpoint1">
          <toPorts>
            <inPortMoniker name="/PatPortalAzure/PatPortalAzureGroup/PatPortal/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapPatPortal:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/PatPortalAzure/PatPortalAzureGroup/PatPortal/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapPatPortalInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/PatPortalAzure/PatPortalAzureGroup/PatPortalInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="PatPortal" generation="1" functional="0" release="0" software="G:\Azure\PatPortalAzure\PatPortalAzure\csx\Release\roles\PatPortal" entryPoint="base\x86\WaHostBootstrapper.exe" parameters="base\x86\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;PatPortal&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;PatPortal&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/PatPortalAzure/PatPortalAzureGroup/PatPortalInstances" />
            <sCSPolicyUpdateDomainMoniker name="/PatPortalAzure/PatPortalAzureGroup/PatPortalUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/PatPortalAzure/PatPortalAzureGroup/PatPortalFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="PatPortalUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="PatPortalFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="PatPortalInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="5b4f37e2-cbe3-4963-aa36-4cfaf64e10e1" ref="Microsoft.RedDog.Contract\ServiceContract\PatPortalAzureContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="03adf2d1-8c0b-4ad4-b7c3-d734cea3e230" ref="Microsoft.RedDog.Contract\Interface\PatPortal:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/PatPortalAzure/PatPortalAzureGroup/PatPortal:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>