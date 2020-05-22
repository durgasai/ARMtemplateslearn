$projectName = Read-Host -Prompt "Enter a Project Name that is used to generate resource and resource group names"
$resourceGroupName = "${projectName}rg"
New-AzResourceGroup `
    -Name $resourceGroupName `
    -Location 'East US'

$deploymentname = "DeployLocalTemplate"

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
$templateFile = Read-Host -Prompt "Enter the template file path and file name"
$parametersFile = Read-Host -Prompt "Enter the parameters file path and file name"
New-AzResourceGroupDeployment `
    -Name $deploymentname `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $templateFile `
    -TemplateParameterFile $parametersFile