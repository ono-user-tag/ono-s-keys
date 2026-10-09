@echo off
title ono's - Generador de Keys (ADMIN)
color 0A
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$chars='ABCDEFGHJKLMNPQRSTUVWXYZ23456789'.ToCharArray();" ^
  "function NewKey { $p=@(); for($g=0;$g -lt 2;$g++){ $s=''; for($i=0;$i -lt 4;$i++){ $s+=$chars | Get-Random }; $p+=$s }; return 'ONO-'+($p -join '-') }" ^
  "Write-Host ''; Write-Host '  ono''s - GENERADOR DE KEYS (solo para ti)' -ForegroundColor Green;" ^
  "Write-Host '  ----------------------------------------' -ForegroundColor DarkGreen;" ^
  "$n = Read-Host '  Cuantas keys quieres generar';" ^
  "if($n -notmatch '^[0-9]+$' -or [int]$n -lt 1){ $n = 1 };" ^
  "Write-Host '';" ^
  "$keys = 1..([int]$n) | ForEach-Object { NewKey };" ^
  "$keys | ForEach-Object { Write-Host ('   ' + $_) -ForegroundColor White };" ^
  "Write-Host '';" ^
  "Set-Content -Path (Join-Path ([Environment]::GetFolderPath('Desktop')) 'keys_generadas.txt') -Value $keys -Encoding UTF8;" ^
  "Write-Host '  Tambien se guardaron en: Escritorio\keys_generadas.txt' -ForegroundColor Gray;" ^
  "Write-Host '';" ^
  "Write-Host '  Pega estas keys (una por linea) en tu archivo keys.txt de GitHub.' -ForegroundColor Green;" ^
  "Write-Host '  Para REVOCAR a alguien: borra su linea de ese archivo en GitHub.' -ForegroundColor Green;"
echo.
pause
