$computers = Get-Content C:\llistat.txt

# Specify the path to the OU where computers will be moved.
$TargetOU   = "OU=grupadm02,OU=PRE_administracio,DC=domini,DC=lab" 
ForEach( $computer in $computers){
    Get-ADComputer $computer |
    Move-ADObject -TargetPath $TargetOU

}