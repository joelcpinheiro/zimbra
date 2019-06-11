#!/bin/bash

echo "digita o domínio"
read domain

if [ -z "$domain" ]; 
   then
     echo "digite um domínio válido"
     break;
else 
    all_account=`zmprov -l gaa $domain`;
    for account in ${all_account}
     do
       mb_size=`zmmailbox -z -m ${account} gms`;
       echo  ${account} = ${mb_size}. >> /scripts/relatorio;
     done
fi
