rem --> Limpa a tela e informa o usu�rio qual a��o ser� tomada para atualizar a �rea de trabalho
cls

title Verificando o pr�ximo passo

echo.
echo Verificando as a��es a serem executadas aguarde um momento!
	if exist %tmp%\restart.txt (
	del /q %tmp%\restart.txt >nul 2>&1
	del /q %tmp%\logoff.txt >nul  2>&1
	timeout /t 5 >nul 2>&1
	goto restart
) else (
    if exist %tmp%\logoff.txt (
	del /q %tmp%\logoff.txt >nul 2>&1
	timeout /t 5 >nul 2>&1
	goto logoff
	)
)

rem --> Segue para a reinicializa��o do sistema operacional
:restart

cls

title Reiniciar

echo.
echo O computador ser� reiniciado para atualizar de �rea de Trabalho.
	timeout /t 5 >nul 2>&1
cls
echo.
echo Entre novamente quando sua senha for solicitada.
	timeout /t 5 >nul 2>&1
    shutdown /f /r /t 0
    exit /b

rem --> Segue para o logoff do desktop
:logoff

cls

title Logoff

echo.
echo Ser� executado o Logoff para atualizar de �rea de Trabalho.
	timeout /t 5 >nul 2>&1
cls
echo.
echo Entre novamente quando sua senha for solicitada.
	timeout /t 5 >nul 2>&1
    shutdown /f /l
    exit /b
