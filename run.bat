@echo off
cd /d %~dp0
where ollama >nul 2>nul || (echo Install Ollama first:  winget install Ollama.Ollama & pause & exit /b)
curl -s http://127.0.0.1:11434 >nul 2>nul || start "" /min ollama serve
if "%OLLAMA_MODEL%"=="" set OLLAMA_MODEL=qwen2.5:1.5b
ollama pull %OLLAMA_MODEL%
where python >nul 2>nul && (python server.py) || (py server.py)
pause
