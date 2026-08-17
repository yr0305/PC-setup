# Windows 11 & Workspace Setup Guide

## 1. Win 11
* **작업표시줄/검색창 왼쪽 정렬**: 설정 > 개인 설정 > 작업 표시줄 > 작업 표시줄 동작 > 정렬 '왼쪽'
* **날씨 위젯 비활성화**: 설정 > 개인 설정 > 작업 표시줄 > 위젯 '끔'
* **초 단위 시계 표시**: 설정 > 개인 설정 > 작업 표시줄 > 작업 표시줄 동작 > '시스템 트레이 시계에 초 표시' 체크
* **클립보드 기록 활성화**: `Win + v` > '켜기'
* **시작 프로그램 정리**: `Ctrl + Shift + Esc` (작업 관리자) > 시작 앱 > 불필요 항목 '사용 안 함'
* **가상 데스크톱 활용**: `Win + Ctrl + D` (생성), `Win + Ctrl + Left/Right` (이동)

## 2. 브라우저 확장
* **uBlock Origin**: Edge 확장 스토어 검색 후 설치 (광고 차단)

## 3. 키보드
* **ThinkPad Fn/Ctrl 키 반전 상세**:
  * **방법 1 (앱)**: Lenovo Vantage 실행 > 입력/장치 설정 > Fn 및 Ctrl 키 교체 켜기
  * **방법 2 (BIOS)**: 재부팅 시 `F1` 연타 > Config > Keyboard/Mouse > Swap Fn and Ctrl Key 'Enabled' 선택 > `F10` 저장
* **PowerToys로 CapsLock / PrintScreen 비활성화 상세**:
  * PowerToys 실행 > Keyboard Manager 메뉴 진입
  * '키 재매핑(Remap a key)' 클릭
  * `+` 클릭 > 물리적 키 `CapsLock` -> 매핑할 키 `backspace` 선택
  * `+` 클릭 > 물리적 키 `PrintScreen` -> 매핑할 키 `Undefined` 선택
  * 오른쪽 상단 '확인' 클릭

## 4. AHK
* 조직에서 관리함 정책으로 비활성화되는 익스텐션 강제 활성화
* `Ctrl + Shift + s`로 선택한 문자열 한영 변환
* `Win + R 입력` -> `shell:startup` 폴더에 바로가기 생성 시 자동 시작
