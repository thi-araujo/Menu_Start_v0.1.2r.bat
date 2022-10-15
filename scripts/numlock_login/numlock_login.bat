rem --> Ativa o Numlock na tela de login

cls
:startNumLockOnLogin
rem -->Faz a pesquisa no registro do Windows para verificar se a chave InitialKeyboardIndicators existe e se est� com o valor padr�o
reg query "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ | find /i /c "InitialKeyboardIndicators    REG_SZ    2147483648" > %tmp%\checkNumlockOnLoginDefault.txt

reg query "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ | find /i /c "InitialKeyboardIndicators    REG_SZ    2" > %tmp%\checkNumlockOnLogin.txt

set /p checkNumlockOnLogin=<%tmp%\checkNumlockOnLogin.txt

rem --> Define o valor da variav�l de acordo com o arquivo checkNumlockOnLoginDefault.txt
set /p checkNumlockOnLoginDefault=<%tmp%\checkNumlockOnLoginDefault.txt

rem --> Define o valor da vari�vel igual a 1
set numLockOnLoginDefault=1

rem --> Define o valor da vari�vel igual a 1
set numLockOnLogin=1

title Numlock turned on on login screen

rem --> Compara a vari�vel numLockOnLogin com a vari�vel checkNumlockOnLogin, executa os comandos de acordo com o resultado
if '%numLockOnLoginDefault%' EQU '%checkNumlockOnLoginDefault%' (
	echo.
	echo O valor padr�o do sistema est� definido, resetando o valor e reiniciando a verifica��o
	reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d 0 /f >nul 2>&1
	del /q %tmp%\checkNumlockOnLoginDefault.txt >nul 2>&1
	timeout /t 5 >nul 2>&1
	goto startNumLockOnLogin
) else (
	if '%numLockOnLogin%' EQU '%checkNumlockOnLogin%' (
	echo.
	echo O Numlock j� est� configurado para ser ativado na tela de login
	del /q %tmp%\checkNumlockOnLogin.txt >nul 2>&1
	echo 0-O Numlock j� est� configurado para ser ativado na tela de login >> %tmp%\logoff.txt
	timeout /t 5 >nul 2>&1
	goto checkFiles
) else (
	echo.
	echo O Numlock est� sendo configurado para ser ativado na tela de login
	reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d 2 /f >nul 2>&1
	del /q %tmp%\checkNumlockOnLogin.txt >nul 2>&1
	echo 1-Configurado a ativa��o do Numlock na tela de login >> %tmp%\restart.txt
	timeout /t 5 >nul 2>&1
	cls
	echo.
	echo Reiniciando a verifica��o para confirmar que o Numlock foi ativado ao iniciar a tela de login
	timeout /t 5 >nul 2>&1
	goto startNumLockOnLogin
	)
)
:checkFiles
rem --> Verifica a exist�ncia do arquivo de restart e caso exista remove o arquivo de logoff
if exist %tmp%\restart.txt (
	del /q %tmp%\logoff.txt >nul 2>&1
	exit /b
) else (
	exit /b
	)
