@echo off
chcp 65001 > nul
cls
echo =========================================================================
echo   BIOKURI // Publicador no GitHub Pages para MICHELI MAC INTIR (@macintir)
echo =========================================================================
echo.
echo Autor atual do Git:
git config user.name
git config user.email
echo.
echo Escolha uma das opções:
echo  [1] Publicar atualizações em https://macintir.github.io/ (Git Push)
echo  [2] Atualizar o Perfil Inicial do GitHub (Repositório macintir/macintir)
echo  [3] Testar / Abrir o Portfólio Localmente no Navegador
echo  [4] Alterar autor do commit (Lucas Aøsf ou Micheli Mac Intir)
echo.
set /p opt="Digite o número da opção desejada (1, 2, 3 ou 4): "

cd /d "%~dp0"

if "%opt%"=="3" (
    start "" "%~dp0index.html"
    exit /b
)

if "%opt%"=="4" (
    echo.
    echo Escolha o autor:
    echo  [L] Lucas Aøsf (lucasaosf@gmail.com)
    echo  [M] Micheli Mac Intir (michelidinizmacintir@gmail.com)
    set /p author_opt="Digite L ou M: "
    if /i "%author_opt%"=="M" (
        git config user.name "Micheli Mac Intir"
        git config user.email "michelidinizmacintir@gmail.com"
        echo Autor configurado como Micheli Mac Intir.
    ) else (
        git config user.name "Lucas Aøsf"
        git config user.email "lucasaosf@gmail.com"
        echo Autor configurado como Lucas Aøsf.
    )
    pause
    exit /b
)

if not exist ".git" (
    echo.
    echo Inicializando repositório Git local...
    git init
    git branch -M main
)

echo.
echo Preparando arquivos e imagens para envio...
git add .
set /p commit_msg="Digite a mensagem do commit (ou Enter para padrao): "
if "%commit_msg%"=="" set commit_msg=feat: redesign bio-canopy interactivo, terminal console e bio-canvas vaga-lumes

git commit -m "%commit_msg%"

if "%opt%"=="1" (
    echo.
    echo Conectando ao repositório https://github.com/macintir/macintir.github.io ...
    git remote remove origin 2>nul
    git remote add origin https://github.com/macintir/macintir.github.io.git
    echo Enviando arquivos via conta atual...
    git push -u origin main
    echo.
    echo =========================================================================
    echo   PUBLICAÇÃO CONCLUÍDA COM SUCESSO!
    echo =========================================================================
    echo.
    echo O site estará disponível em:
    echo 🌐 https://macintir.github.io/
    echo.
    start "" "https://macintir.github.io/"
)

if "%opt%"=="2" (
    echo.
    echo Enviando README para o perfil https://github.com/macintir/macintir ...
    git remote remove origin 2>nul
    git remote add origin https://github.com/macintir/macintir.git
    git push -u origin main
    echo.
    echo Perfil atualizado! Acesse: https://github.com/macintir
)

pause
