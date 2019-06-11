#!/bin/bash
# $1 domain
# $2 email
ZMPROV="/opt/zimbra/bin/zmprov"

if [[ $1 ]]; then

        DOMAIN=$1

else

		echo "Erro dominio nao especificado Ex:"
	    exit

fi

for DOMAIN in $($ZMPROV gad);	do
zmprov ma $1 zimbraIsDelegatedAdminAccount TRUE
zmprov ma $1 zimbraAdminConsoleUIComponents cartBlancheUI zimbraAdminConsoleUIComponents domainListView zimbraAdminConsoleUIComponents accountListView zimbraAdminConsoleUIComponents DLListView
zmprov ma $1 zimbraDomainAdminMaxMailQuota 0
zmprov grantRight domain $DOMAIN usr $1 +createAccount
zmprov grantRight domain $DOMAIN usr $1 +createAlias
zmprov grantRight domain $DOMAIN usr $1 +createCalendarResource
zmprov grantRight domain $DOMAIN usr $1 +createDistributionList
zmprov grantRight domain $DOMAIN usr $1 +deleteAlias
zmprov grantRight domain $DOMAIN usr $1 +listDomain
zmprov grantRight domain $DOMAIN usr $1 +domainAdminRights
zmprov grantRight domain $DOMAIN usr $1 +configureQuota
zmprov grantRight domain $DOMAIN usr $1 set.account.zimbraAccountStatus
zmprov grantRight domain $DOMAIN usr $1 set.account.sn
zmprov grantRight domain $DOMAIN usr $1 set.account.displayName
zmprov grantRight domain $DOMAIN usr $1 set.account.zimbraPasswordMustChange
zmprov grantRight domain $DOMAIN usr $1 getDomainQuotaUsage
zmprov grantRight account $1 usr $1 +deleteAccount
zmprov grantRight account $1 usr $1 +getAccountInfo
zmprov grantRight account $1 usr $1 +getAccountMembership
zmprov grantRight account $1 usr $1 +getMailboxInfo
zmprov grantRight account $1 usr $1 +listAccount
zmprov grantRight account $1 usr $1 +removeAccountAlias
zmprov grantRight account $1 usr $1 +renameAccount
zmprov grantRight account $1 usr $1 +setAccountPassword
zmprov grantRight account $1 usr $1 +viewAccountAdminUI
zmprov grantRight account $1 usr $1 +configureQuota
done
