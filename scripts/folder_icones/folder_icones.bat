title Icones

rem --> Verifica a exist�ncia da pasta icones em \Users\Public (\Usu�rios\Publicos)
cls

rem -- > Lista todos os arquivos e diret�rios em  Usuarios\Publicos e procura pela pasta icones, gera o arquivo folderIcones.txt
dir %public% | find /i /c "icones" > %tmp%\folderIcones.txt

rem -->  Define a vari�vel com os valores dos dados armazenados dentro do arquivo folderIcones.txt
set /p checkFolderIcones=<%tmp%\folderIcones.txt

rem --> Define o valor da variav�l igual a 1
set folderIcones=1

rem --> Compara a vari�vel folderIcones com a vari�vel checkFolderIcones, executa os comandos de acordo com o resultado
if '%folderIcones%' EQU '%checkFolderIcones%' (
    echo.
	echo A pasta icones j� existe, removendo a pasta com os dados antigos e criando uma nova
	rd /s /q %public%\icones
    md %public%\icones
	del /q %tmp%\folderIcones.txt >nul 2>&1
    timeout /t 5 >nul 2>&1
	exit /b
) else (
	echo.
	echo Criando a pasta icones
	md %public%\icones
	del /q %tmp%\folderIcones.txt >nul 2>&1
    timeout /t 5 >nul 2>&1
    exit /b
	)
