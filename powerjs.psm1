Add-Type $PSScriptRoot/Microsoft.JavaScript.NodeApi.dll

$script:Platform = [Microsoft.JavaScript.NodeApi.NodejsPlatform]::new("$PSScriptRoot/libnode.dll")
function New-JsEnv($BaseDictionary) {
	$script:Platform.CreateEnvironment($BaseDictionary)
}

Export-ModuleMember -Function New-JsEnv
