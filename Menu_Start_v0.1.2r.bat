@echo off

cls

rem Vers�o do script: 0.1.2r
rem Data da cria��o: 18/09/2022
rem Data da revis�o: 04/10/2022


rem PS: Este script foi baseado no antigo script que havia criado para atualiza��o dos desktop.

rem --> Altera a pagina do cmd para 1252 deste modo posso trabalhar com acentos e caracteres especiais
chcp 1252 >nul 2>&1

rem --> Verifica se o cmd esta sendo executado como Administrador
net file >nul 2>&1

rem --> Verifica se o script esta sendo executado como Administrador
if '%errorlevel%' == '0' (
    goto begin
) else (
    echo.
    echo Não � possível executar este script corretamente se voce não possuir privilégios de Administrador
    timeout /t 3 >nul 2>&1
    cls
    echo.
    echo O script será encerrado, execute ele novamente como Administrador para prosseguir.
    timeout /t 3 >nul 2>&1
    goto eof
    )

rem -->Define o caminho do script
:begin
set "batchPath=%~0"
cd /d %~dp0

rem --> Limpa os arquivos "log" da script de atualização
title Limpando os logs antigos

echo.
echo Executando a limpeza dos logs antes de iniciar o Menu ações
del /q %tmp%\logoff.txt >nul 2>&1
del /q %tmp%\restart.txt >nul 2>&1
del /q %tmp%\folderIcones.txt >nul 2>&1
timeout /t 3 >nul 2>&1

:startMenu
rem --> Menu de ações
cls

title Menu de ações

echo.
echo Escolha qual opção deseja executar e pressione enter:
echo.
echo 	1� Atualizar desktop (Esta opção não precisa de verificação)
echo.
echo 	2� Atualizar desktop vip (Esta opção não precisa de verificação)
echo.
echo 	3� Atualizar icones do desktop
echo.
echo 	4� Atualizar icones do desktop vip
echo.
echo 	5� Ativar NumLock na tela de login
echo.
echo 	6� Correção para o delay de instalação das impressoras
echo.
echo 	7� Desativar os perfis de Firewall
echo.
echo 	8� Desativar o UAC
echo.
echo 	9� Desativar o Smartscreen
echo.
echo 	10� Desativar o Bing Search
echo.
echo 	11� Verificar se será preciso realizar o logoff ou reiniciar após as ações executadas
echo.
echo 	12� Sair
echo.

set menuOption=
set /p menuOption=Digite a opção:
if /i '%menuOption%' EQU '1'  goto updateDesktop
if /i '%menuOption%' EQU '2'  goto updateDesktopVip
if /i '%menuOption%' EQU '3'  goto updateIconesDesktop




