# Setting up the SmellSense environment

## Enable Hyper-V in Windows 10

- Run the following _Powershell_ command: `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All`

## Configure supported app devices

- Enable Android support: `flutter config --no-enable-windows-desktop`
