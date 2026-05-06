@echo off
REM generate_slides.bat — Compile a cherwellmaths .tex file into slides and accessible PDFs
REM Usage: generate_slides.bat filename  (without .tex extension)

if "%~1"=="" (
    echo Usage: generate_slides.bat filename  ^(without .tex extension^)
    exit /b 1
)

set "NAME=%~1"
set "TMPNAME=%NAME%-accessible"

if not exist "%NAME%.tex" (
    echo Error: %NAME%.tex not found.
    exit /b 1
)

REM --- Build presentation slides ---
echo === Building slides: %NAME%.pdf ===
pdflatex -interaction=nonstopmode "%NAME%.tex" > nul 2>&1
pdflatex -interaction=nonstopmode "%NAME%.tex" > nul 2>&1
if exist "%NAME%.pdf" (
    echo    Created %NAME%.pdf
) else (
    echo    ERROR: Failed to build slides.
)

REM --- Build accessible version ---
echo === Building accessible version: %TMPNAME%.pdf ===
REM Copy source and replace documentclass to add accessible option
copy /y "%NAME%.tex" "%TMPNAME%.tex" > nul
powershell -Command "(Get-Content '%TMPNAME%.tex') -replace '\\documentclass(\[.*?\])?{cherwellmaths}', '\documentclass[accessible]{cherwellmaths}' | Set-Content '%TMPNAME%.tex'"
pdflatex -interaction=nonstopmode "%TMPNAME%.tex" > nul 2>&1
pdflatex -interaction=nonstopmode "%TMPNAME%.tex" > nul 2>&1
if exist "%TMPNAME%.pdf" (
    echo    Created %TMPNAME%.pdf
) else (
    echo    ERROR: Failed to build accessible version.
)

REM --- Clean up temp files ---
echo === Cleaning up temporary files ===
del /q "%TMPNAME%.tex" "%TMPNAME%.aux" "%TMPNAME%.log" "%TMPNAME%.nav" "%TMPNAME%.out" "%TMPNAME%.snm" "%TMPNAME%.toc" "%TMPNAME%.synctex.gz" 2>nul
del /q "%NAME%.aux" "%NAME%.log" "%NAME%.nav" "%NAME%.out" "%NAME%.snm" "%NAME%.toc" "%NAME%.synctex.gz" 2>nul

echo === Done ===
