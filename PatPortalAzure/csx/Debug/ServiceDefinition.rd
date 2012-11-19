<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="PatPortalAzure" generation="1" functional="0" release="0" Id="3b2ecbad-e915-4cca-af13-70e7caa7aa18" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
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
          <role name="PatPortal" generation="1" functional="0" release="0" software="G:\Azure\PatPortalAzure\PatPortalAzure\csx\Debug\roles\PatPortal" entryPoint="base\x86\WaHostBootstrapper.exe" parameters="base\x86\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
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
    <implementation Id="3a5d7786-a718-4ffb-95d1-ef65a99f0e40" ref="Microsoft.RedDog.Contract\ServiceContract\PatPortalAzureContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="8e876fd3-de01-409d-8ec7-2427c7dfa77b" ref="Microsoft.RedDog.Contract\Interface\PatPortal:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/PatPortalAzure/PatPortalAzureGroup/PatPortal:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>