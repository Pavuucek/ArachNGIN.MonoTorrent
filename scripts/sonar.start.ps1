$scriptPath = (split-path -parent $MyInvocation.MyCommand.Definition) + "\..\src"
Set-Location $scriptPath

if ($env:APPVEYOR_PULL_REQUEST_NUMBER) {
    MSBuild.SonarQube.Runner.exe begin `
        /k:"info.pavucina.arachngin.monotorrent" `
        /d:"sonar.host.url=https://sonarqube.com" `
        /d:"sonar.login=$env:SonarQubeToken" `
        /d:"sonar.analysis.mode=preview" `
        /d:"sonar.github.pullRequest=$env:APPVEYOR_PULL_REQUEST_NUMBER" `
        /d:"sonar.github.repository=pavuucek/ArachNGIN.MonoTorrent" `
        /d:"sonar.github.oauth=$env:EncryptedGitHubAuthToken"
}
if (-Not $env:APPVEYOR_PULL_REQUEST_NUMBER) {
    echo MSBuild.SonarQube.Runner.exe begin `
        /k:"info.pavucina.arachngin.monotorrent" `
        /d:"sonar.host.url=https://sonarqube.com" `
        /d:"sonar.login=$env:SonarQubeToken" `

}