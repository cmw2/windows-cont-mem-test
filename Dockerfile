FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019
RUN PowerShell.exe Enable-WindowsOptionalFeature -online -FeatureName MSMQ
RUN PowerShell.exe Enable-WindowsOptionalFeature -online -FeatureName MSMQ-Services
RUN PowerShell.exe Enable-WindowsOptionalFeature -online -FeatureName MSMQ-Server
CMD [ "cmd" ]