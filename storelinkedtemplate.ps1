$projectName = Read-Host -Prompt "Enter a project name:"
$location = Read-Host -Prompt "Enter the location:"

$resourceGroupName = $projectName + "rg"
$storageAccountName = $projectName + "store"
$containerName = "templates"

$linkedTemplateURL = "https://github.com/durgasai/ARMtemplateslearn/blob/master/storagedeploy.json"
$fileName = "storagedeploy.json"

Invoke-WebRequest -Uri $linkedTemplateURL -OutFile "$home/$fileName"

New-AzResourceGroup -Name $resourceGroupName -Location $location

$storageAccount = New-AzStorageAccount `
    -ResourceGroupName $resourceGroupName `
    -Name $storageAccountName `
    -Location $location `
    -SkuName "Standard_LRS"

$context = $storageAccount.Context

New-AzStorageContainer -Name $containerName -Context $context -Permission Container

Set-AzStorageBlobContent `
    -Container $containerName `
    -File $home/$fileName `
    -Blob $fileName `
    -Context $context