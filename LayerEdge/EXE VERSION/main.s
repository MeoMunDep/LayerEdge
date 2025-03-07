.386
.model flat, stdcall
include windows.inc
include kernel32.inc
include user32.inc
includelib kernel32.lib
includelib user32.lib

.data
    message db 'Last update: 7-3-2025', 0

.code
start:
    invoke MessageBox, NULL, addr message, addr message, MB_OK
    invoke ExitProcess, 0
end start