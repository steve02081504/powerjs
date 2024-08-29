Add-Type -LiteralPath $PSScriptRoot/Microsoft.JavaScript.NodeApi.dll -PassThru

$script:Platform = [Microsoft.JavaScript.NodeApi.Runtime.NodejsPlatform]::new("$PSScriptRoot/libnode.dll")
function New-JsEnv($BaseDictionary) {
	$result = $script:Platform.CreateEnvironment($BaseDictionary)
	Add-Member -InputObject $result -MemberType ScriptMethod -Name RunScript -Value {
		param($JsCode)
		$this.Run([System.Action]{[Microsoft.JavaScript.NodeApi.JSValue]::RunScript($JsCode)})
	}
	$result
}

Export-ModuleMember -Function New-JsEnv
