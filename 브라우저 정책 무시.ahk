#Requires AutoHotkey v2.0
#SingleInstance Force

; 1. 관리자 권한으로 자동 재실행
if not A_IsAdmin {
    try {
        Run '*RunAs "' A_ScriptFullPath '"'
    }
    ExitApp
}

; 2. 2초(2000ms)마다 CheckAndDeleteRegistry 함수 실행
SetTimer CheckAndDeleteRegistry, 2000

CheckAndDeleteRegistry() {
    ; 검사할 레지스트리 경로 배열
    paths := [
        "HKLM\SOFTWARE\Policies\Google\Chrome",
        "HKCU\SOFTWARE\Policies\Google\Chrome"
    ]

    for path in paths {
        try {
            ; 레지스트리 키가 존재하면 삭제 (없으면 catch로 넘어가 에러 무시)
            RegDeleteKey path
        } catch {
            continue
        }
    }
}