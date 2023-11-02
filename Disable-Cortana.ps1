Write-Host "Disabling Cortana"
$cortanaSettings = "HKCU:\SOFTWARE\Microsoft\Personalization\Settings"
$cortanaPersonalization = "HKCU:\SOFTWARE\Microsoft\InputPersonalization"
$cortanaDataStore = "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore"
If (!(Test-Path $cortanaSettings)) {
	New-Item $cortanaSettings
}

Set-ItemProperty $cortanaSettings AcceptedPrivacyPolicy -Value 0
If (!(Test-Path $cortanaPersonalization)) {
	New-Item $cortanaPersonalization
}

Set-ItemProperty $cortanaPersonalization RestrictImplicitTextCollection -Value 1
Set-ItemProperty $cortanaPersonalization RestrictImplicitInkCollection -Value 1
If (!(Test-Path $cortanaDataStore)) {
	New-Item $cortanaDataStore
}

Set-ItemProperty $cortanaDataStore HarvestContacts -Value 0
