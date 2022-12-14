@echo off

cls

rem Versâo do script: 0.1.3r
rem Data da criação: 20/10/2022
rem Data da revisão: 01/12/2022


rem PS: Essa script foi baseado no antigo script que havia criado para atualização dos desktop.

rem --> Função para alterar a pagina do CMD para 1252 deste modo posso trabalhar com acentos e caracteres especiais
chcp 1252 >nul 2>&1

rem --> Esta função verifica se o CMD esta realmente sendo executado como Administrador
net file >nul 2>&1

rem --> Esta função verifica se o script esta sendo executado como ADM
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

rem -->Esta função define o caminho do Script
:begin
set "batchPath=%~0"
cd /d %~dp0

rem -->Essa função limpa os arquivos "log" da script de atualização
title Limpando os logs antigos

echo.
echo Executando a limpeza dos logs antes de iniciar o Menu Ações
del /q %tmp%\logoff.txt >nul 2>&1
del /q %tmp%\restart.txt >nul 2>&1
del /q %tmp%\folderIcones.txt >nul 2>&1
timeout /t 3 >nul 2>&1

:startMenu
rem --> Abaixo temos as opções que será exibida no menu de ações:
cls

title Menu de Ações

echo.
echo Escolha qual opção deseja executar e pressione Enter:
echo.
echo 	1� Atualizar Desktop (Esta opção não precisa de verificação)
echo.
echo 	2� Atualizar Desktop Vip (Esta opção não precisa de verificação)
echo.
echo 	3� Atualizar Icones do Desktop
echo.
echo 	4� Atualizar Icones do Desktop Vip
echo.
echo 	5� Ativar NumLock na Tela de Login
echo.
echo 	6� Correção para o Delay de Instalação das Impressoras
echo.
echo 	7� Desativar os Perfis de Firewall
echo.
echo 	8� Desativar o UAC
echo.
echo 	9� Desativar o Smartscreen
echo.
echo 	10� Desativar o Bing Search
echo.
echo 	11� Verificar se será preciso Realizar o Logoff ou Reiniciar após as ações executadas
echo.
echo 	12� Sair
echo.

set menuOption=
set /p menuOption=Digite a opção:
if /i '%menuOption%' EQU '1'  goto updateDesktop
if /i '%menuOption%' EQU '2'  goto updateDesktopVip
if /i '%menuOption%' EQU '3'  goto updateIconesDesktop
if /i '%menuOption%' EQU '4'  goto updateIconesDesktopVip
if /i '%menuOption%' EQU '5'  goto activeNumLockLogin






