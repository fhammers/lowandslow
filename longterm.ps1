
# Temp Folder
$tempfolder = 'C:\temp'


if (!(Get-Item $tempfolder -ea ignore)) { mkdir $tempfolder }


# Static Variables
$countfile = 'C:\temp\bootcount.txt'




# Boot Count
if (Get-Item $countfile -ea ignore) {
    [int]$bootcount = Get-Content $countfile
    if ($bootcount -match "^\d{1,2}$") { ([int]$bootcount) ++ }
    else { $bootcount = 1 }
}
else { $bootcount = 1 }
$bootcount | Out-File $countfile


switch ($bootcount) {
    
    1 {
        # Fill in anything needed on first run
        
        systeminfo >> C:\temp\1.txt
        exit
        ##################################################
        ###############     --REBOOT--     ###############
    }
    
    2 {
        # Fill in anything needed on second reboot; remove if unneeded
            
        whoami >> C:\temp\2.txt
        exit
        ##################################################
        ###############     --REBOOT--     ###############
    }
    
    3 {
        # Fill in anything needed on third reboot; remove if unneeded
        # Create more reboots as needed
        
        echo "bla" >> C:\temp\3.txt
        exit
        ##################################################
        ###############      --END--      ################
    }
    
    default {
        # Dropper is complete; clean up
        rm $countfile
        rm $bootbatch
        rm $dropperscript
    }
}
