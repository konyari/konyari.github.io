@echo off
chcp 65001 > nul
cls
echo =========================================================================
echo   BIOKURI // Publicador no GitHub Pages para MICHELI MAC INTIR (@macintir)
echo =========================================================================
echo.
echo Olá! Este script irá publicar o portfólio diretamente na conta @macintir.
echo.
echo Certifique-se de que a conta aberta no Chrome seja: macintir
echo.
echo Escolha uma das opções:
echo  [1] Publicar o Portfólio em: https://macintir.github.io/ (Recomendado)
echo  [2] Atualizar o Perfil Inicial do GitHub (Repositório macintir/macintir)
echo  [3] Abrir no Chrome a página para convidar @lucasaosf como colaborador
echo  [4] Abrir o Portfólio Localmente para testar antes de enviar
echo.
set /p opt="Digite o número da opção desejada (1, 2, 3 ou 4): "

cd /d "%~dp0"

if "%opt%"=="3" (
    echo.
    echo Abrindo página de Colaboradores no repositório...
    start "" "https://github.com/macintir/macintir.github.io/settings/access"
    echo.
    echo No Chrome:
    echo 1. Clique no botão verde "Add people"
    echo 2. Digite: lucasaosf
    echo 3. Clique em "Add lucasaosf to this repository"
    echo.
    pause
    exit /b
)

if "%opt%"=="4" (
    start "" "%~dp0index.html"
    exit /b
)

if not exist ".git" (
    echo.
    echo [1/4] Inicializando repositório Git local...
    git init
    git branch -M main
)

echo [2/4] Configurando autor do commit como Micheli Mac Intir...
git config user.name "Micheli Mac Intir"
git config user.email "michelidinizmacintir@gmail.com"

echo [3/4] Preparando arquivos e imagens para envio...
git add .
git commit -m "feat: portfolio micheli mac intir - biokuri e supervisao ambiental" 2>nul

if "%opt%"=="1" (
    echo.
    echo [4/4] Conectando ao repositório https://github.com/macintir/macintir.github.io ...
    echo.
    echo NOTA: Se ainda não tiver criado o repositório 'macintir.github.io' no GitHub,
    echo crie-o como PÚBLICO (Public) acessando: https://github.com/new
    echo.
    git remote remove origin 2>nul
    git remote add origin https://github.com/macintir/macintir.github.io.git
    echo Enviando arquivos...
    git push -u origin main
    echo.
    echo =========================================================================
    echo   PUBLICAÇÃO CONCLUÍDA COM SUCESSO!
    echo =========================================================================
    echo.
    echo O seu site estará disponível no ar em instantes em:
    echo 🌐 https://macintir.github.io/
    echo.
    echo Próximo passo: Convide o @lucasaosf como colaborador:
    echo Acesse: https://github.com/macintir/macintir.github.io/settings/access
    echo.
    start "" "https://macintir.github.io/"
)

if "%opt%"=="2" (
    echo.
    echo [4/4] Enviando README para o perfil https://github.com/macintir/macintir ...
    echo.
    git remote remove origin 2>nul
    git remote add origin https://github.com/macintir/macintir.git
    git push -u origin main
    echo.
    echo Perfil atualizado! Acesse: https://github.com/macintir
)

pause
