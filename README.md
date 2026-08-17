# Windows 11 & Workspace Setup Guide

## 1. 윈도우 11
* **작업표시줄/검색창 왼쪽 정렬**: 설정 > 개인 설정 > 작업 표시줄 > 작업 표시줄 동작 > 정렬 '왼쪽'
* **날씨 위젯 비활성화**: 설정 > 개인 설정 > 작업 표시줄 > 위젯 '끔'
* **초 단위 시계 표시**: 설정 > 개인 설정 > 작업 표시줄 > 작업 표시줄 동작 > '시스템 트레이 시계에 초 표시' 체크
* **클립보드 기록 활성화**: `Win + V` > '켜기'
* **시작 프로그램 정리**: `Ctrl + Shift + Esc` (작업 관리자) > 시작 앱 > 불필요 항목 '사용 안 함'
* **가상 데스크톱 활용**: `Win + Ctrl + D` (생성), `Win + Ctrl + Left/Right` (이동)

## 2. 엣지 브라우저
* **uBlock Origin**: Edge 확장 스토어 검색 후 설치 (광고 차단)

## 3. 키보드 & 디바이스
* **ThinkPad Fn/Ctrl 키 반전 상세**:
  * **방법 1 (앱)**: Lenovo Vantage 실행 > 입력/장치 설정 > Fn 및 Ctrl 키 교체 켜기
  * **방법 2 (BIOS)**: 재부팅 시 `F1` 연타 > Config > Keyboard/Mouse > Swap Fn and Ctrl Key 'Enabled' 선택 > `F10` 저장
* **PowerToys로 CapsLock / PrintScreen 비활성화 상세**:
  * PowerToys 실행 > Keyboard Manager 메뉴 진입
  * '키 재매핑(Remap a key)' 클릭
  * `+` 클릭 > 물리적 키 `CapsLock` -> 매핑할 키 `backspace` 선택
  * `+` 클릭 > 물리적 키 `PrintScreen` -> 매핑할 키 `Undefined` 선택
  * 오른쪽 상단 '확인' 클릭

## 4. AHK (AutoHotkey) 대략적 기능
* 키 매핑 및 단축키 변경
* 텍스트 자동 입력 (핫스트링)
* 특정 앱 실행 시 보조 프로그램 자동 연동
* 창 관리 및 볼륨 조절 자동화
