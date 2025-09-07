:: Fix Windows Drivers

:: List all third party drivers
dism /online /get-drivers /format:table

:: Force delete
pnputil /delete-driver oemXX.inf /uninstall /force
