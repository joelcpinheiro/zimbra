#!/bin/bash

for i in `cat list_adm_domains`
        do
        domain=$(echo "$i" | awk -F'@' {'print $2'})
        cos=$(zmprov cta $domain | sed -n '3p' | awk {'print $1'})
        echo "COS da Conta é $cos"
        echo "ADM $i"
	zmprov grr cos $cos usr $i getCos 
	zmprov grr cos $cos usr $i assignCos 
	zmprov grr cos $cos usr $i modifyCos 
	zmprov grr cos $cos usr $i adminConsoleCOSACLTabRights 
	zmprov grr cos $cos usr $i adminConsoleCOSFeaturesTabRights 
	zmprov grr cos $cos usr $i adminConsoleCOSAdvancedTabRights 
	zmprov grr cos $cos usr $i adminConsoleCOSInfoTabRights 
	zmprov grr cos $cos usr $i configureCosConstraint 
	zmprov grr cos $cos usr $i domainAdminCosRights 
	zmprov grr cos $cos usr $i setAdminConsoleCOSACLTab 
	zmprov grr cos $cos usr $i viewAdminConsoleCOSACLTab 
	zmprov grr cos $cos usr $i migrationAdminCosRights
	echo "Reload domain_right"
	/opt/zimbra/scripts/domain_right.sh $domain $i
	echo FIM
	done
