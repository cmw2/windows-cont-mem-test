echo Please verify you're in the right subscription
call az account show
echo off
timeout /t 30
set RG_NAME=winconttest-rg
set RG_REGION=centralus
set PLAN_NAME=winconttest-plan
set PLAN_SKU=P1V3
set WEBAPP_NAMEBASE=cmwwincont
set DELAY_S=10
REM NOT WORKING with tag:
REM set WEBAPP_IMAGE=chwestbr/aspnet-msmq:4.8-windowsservercore-lts
REM   error: The parameter DOCKER_REGISTRY_SERVER_URL has an invalid value. Unexpected error when connecting to the registry. Cannot find available registry. https://chwestbr
REM Added latest tag and using below
set WEBAPP_IMAGE="chwestbr/aspnet-msmq"
echo on
call az group create -n %RG_NAME% -l %RG_REGION%
call az appservice plan create -g %RG_NAME% -n %PLAN_NAME% --hyper-v --sku %PLAN_SKU%
FOR %%i IN (1 2 3 4) DO (
   timeout /t %DELAY_S%
   call az webapp create -n %WEBAPP_NAMEBASE%%%i --plan %PLAN_NAME% -g %RG_NAME% -i %WEBAPP_IMAGE%   
)

