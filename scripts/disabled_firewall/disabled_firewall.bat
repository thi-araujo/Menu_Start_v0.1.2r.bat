rem --> Desabilitando o Firewall do Windows
:startDisabledFirewall
cls

rem --> Faz a pesquisa no registro do Windows para verificar se a chave do Firewall existe
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v EnableFirewall /t REG_DWORD | find /i /c "EnableFirewall    REG_DWORD    0x0" > %tmp%\checkFirewall.txt

rem --> Define o valor da variav�l de acordo com o arquivo checkFirewall.txt
set /p checkDisabledFirewall=<%tmp%\checkFirewall.txt

rem --> Define a variav�l com o valor igual a 1
set disabledFirewall=1

title Firewall

rem --> Compara a vari�vel disabledFirewall com a vari�vel checkDisabledFirewall, executa os comandos de acordo com o resultado
if '%disabledFirewall%' EQU '%checkDisabledFirewall%' (
	echo.
	echo Os perfis de firewall j� est�o desativados.
	del /q %tmp%\checkFirewall.txt >nul 2>&1
	echo 0-Os perfis de firewall j� est�o desativados, realizar o logoff >> %tmp%\logoff.txt
	timeout /t 5 >nul 2>&1
	goto checkFiles
) else (
	echo.
	echo Desativando os perfis do Firewall
	netsh advfirewall set allprofiles state off >nul 2>&1
	del /q %tmp%\checkFirewall.txt >nul 2>&1
	echo 1-Desativando os perfis do Firewall, realizar o restart >> %tmp%\restart.txt
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo Reiniciando a verifica��o para confirmar que os perfis de Firewall foram desativados
	timeout /t 5 >nul 2>&1
	goto startDisabledFirewall
	)
:checkFiles
rem --> Verifica a exist�ncia do arquivo de restart e caso exista remove o arquivo de logoff
if exist %tmp%\restart.txt (
	del /q %tmp%\logoff.txt >nul 2>&1
	exit /b
) else (
	exit /b
	)
