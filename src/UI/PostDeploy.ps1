#
# PostDeploy.ps1
#
$hibernateConfig = "bin\hibernate.cfg.xml"
$integratedSecurity = "Integrated Security=true"
$DatabaseServer = $OctopusParameters["DatabaseServer"]
$DatabaseName = $OctopusParameters["DatabaseName"]
$connection_string = "server=$DatabaseServer;database=$DatabaseName;$integratedSecurity;"
poke-xml $hibernateConfig "//e:property[@name = 'connection.connection_string']" $connection_string @{"e" = "urn:nhibernate-configuration-2.2"}




function script:poke-xml($filePath, $xpath, $value, $namespaces = @{}) {
    [xml] $fileXml = Get-Content $filePath
    
    if($namespaces -ne $null -and $namespaces.Count -gt 0) {
        $ns = New-Object Xml.XmlNamespaceManager $fileXml.NameTable
        $namespaces.GetEnumerator() | %{ $ns.AddNamespace($_.Key,$_.Value) }
        $node = $fileXml.SelectSingleNode($xpath,$ns)
    } else {
        $node = $fileXml.SelectSingleNode($xpath)
    }
    
    Assert ($node -ne $null) "could not find node @ $xpath"
        
    if($node.NodeType -eq "Element") {
        $node.InnerText = $value
    } else {
        $node.Value = $value
    }

    $fileXml.Save($filePath) 
} 