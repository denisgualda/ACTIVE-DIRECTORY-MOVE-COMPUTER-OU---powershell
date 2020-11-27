Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{
    InitialDirectory = [Environment]::GetFolderPath('Desktop')
}
$Null = $FileBrowser.ShowDialog()

#GUARDA RUTA FITXER PER SER LLEGIDA
$computers = Get-Content $FileBrowser.FileName
#$computers = Get-Content C:\MOURE_EQUIP_OU_powershell\llistat.txt

#DETERMINA UO ON MOURE
#$TargetOU   = "OU=NOUS,OU=BECARIS,OU=ADMINISTRACIO_GRUP1,OU=SECTOR_ADMINISTRACIO,DC=domini,DC=lab" 
Write-Host " "
$TargetOU = Read-Host "Introdueix UO desti "       #DEMANA UO DESTÍ.
ForEach( $computer in $computers){
    Get-ADComputer $computer |
    Move-ADObject -TargetPath $TargetOU
    
}
Write-Host " "
Write-Host "-------------------------------"
Write-Host " "
Write-Host " Equips moguts a la nova UO: $TargetOu " 
Write-Host " "
Write-Host "-------------------------------"

