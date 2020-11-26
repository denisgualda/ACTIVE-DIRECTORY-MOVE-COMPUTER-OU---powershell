$computers = Get-Content C:\MOURE_EQUIP_OU_powershell\llistat.txt

# Specify the path to the OU where computers will be moved.
#$TargetOU   = "OU=NOUS,OU=BECARIS,OU=ADMINISTRACIO_GRUP1,OU=SECTOR_ADMINISTRACIO,DC=domini,DC=lab" 
Write-Host " "
$TargetOU = Read-Host "Introdueix UO desti "
ForEach( $computer in $computers){
    Get-ADComputer $computer |
    Move-ADObject -TargetPath $TargetOU
}
Write-Host " "
Write-Host "-------------------------------"
Write-Host " "
Write-Host " Equips moguts a la nova OU: $TargetOu " 
Write-Host " "
Write-Host "-------------------------------"
