$scriptPath = (split-path -parent $MyInvocation.MyCommand.Definition) + "\..\"
Set-Location ($scriptPath)+"src\"
MSBuild.SonarQube.Runner.exe end /d:"sonar.login=$env:SonarQubeToken"