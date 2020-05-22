$projectName = Read-Host -Prompt "Enter a Project Name that is used to generate resource and resource group names"
<#
$resourceGroupName = "${projectName}rg"
New-AzResourceGroup `
    -Name $resourceGroupName `
    -Location 'East US'
#>

$deploymentname = "DeployLinkedTemplate"

<#
$templateFile = "C:\Users\venka\Desktop\learning\ARMtemplateslearn\azuredeploy.json"

New-AzResourceGroupDeployment `
    -Name $deploymentname `
    -ResourceGroupName myResourceGroup05182020 `
    -TemplateFile $templateFile
#>

<#
Remove-AzResourceGroup `
    -Name myproj0522rg
#>

#Give storageName as parameter
<#
$templateFile = "C:\Users\venka\Desktop\learning\ARMtemplateslearn\azuredeploy.json"

New-AzResourceGroupDeployment `
    -Name $deploymentname `
    -ResourceGroupName myResourceGroup05192020 `
    -TemplateFile $templateFile `
    -storagePrefix "mystor" `
    -appServicePlanName "myappplan0519"

#>
#Parameters file
<#
$templateFile = "C:\Users\venka\Desktop\learning\ARMtemplateslearn\azuredeploy.json"
$parametersFile = "C:\Users\venka\Desktop\learning\ARMtemplateslearn\azuredeploy.parameters.dev.json"
New-AzResourceGroupDeployment `
    -Name $deploymentname `
    -ResourceGroupName myResourceGroup05222020 `
    -TemplateFile $templateFile `
    -TemplateParameterFile $parametersFile
#>
<#
$templateFile = Read-Host -Prompt "Enter the template file path and file name"
$parametersFile = Read-Host -Prompt "Enter the parameters file path and file name"
New-AzResourceGroupDeployment `
    -Name $deploymentname `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $templateFile `
    -TemplateParameterFile $parametersFile
#>

$templateFile = Read-Host -Prompt "Enter the main file and path."
<#
$parametersFile = Read-Host -Prompt "Enter the parameters file path and file name"
#>
$resourceGroupName = "${projectName}rg"
$storageAccountName = "${projectName}store"
$containerName = "templates"
$fileName = "storagedeploy.json"

$key = (Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName).Value[0]
$context = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $key

$linkedTemplateUri = New-AzStorageBlobSASToken `
    -Context $context `
    -Container $containerName `
    -Blob $fileName `
    -Permission r `
    -ExpiryTime (Get-Date).AddHours(2.0) `
    -FullUri

New-AzResourceGroupDeployment `
    -Name $deploymentname `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $templateFile `
    -linkedTemplateUri $linkedTemplateUri `
    -projectName $projectName `
    -Verbose
