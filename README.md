# Windows 11 & Workspace Setup Guide

업무용 랩탑 및 데스크톱 윈도우 11 환경 설정, 오토핫키(AHK v2) 스크립트, 생산성 툴 정리.

---

## 1. 윈도우 11 기본 설정 (Windows 11 Settings)

* **작업표시줄 정렬**: 설정 > 개인 설정 > 작업 표시줄 > 작업 표시줄 동작 > 정렬을 **왼쪽**으로 변경
* **위젯 비활성화**: 설정 > 개인 설정 > 작업 표시줄 > 위젯 끔
* **초 단위 시계 표시**: 설정 > 개인 설정 > 작업 표시줄 > 작업 표시줄 동작 > 시스템 트레이 시계에 초 표시 체크
* **클립보드 검색 기록**: `Win + V` 입력 후 클립보드 검색 기록 활성화
* **시작 프로그램 정돈**: 설정 > 앱 > 시작 프로그램 > 불필요한 앱 비활성화
* **가상 데스크톱**: `Win + Tab` 또는 `Win + Ctrl + Left/Right` 이용한 업무/개인 환경 분리

---

## 2. 브라우저 설정 (Microsoft Edge)

* **세로 탭 (Vertical Tabs)**: `Ctrl + Shift + ,` 또는 좌상단 [탭 작업] -> [세로 탭 켜기]
* **세로 탭 자동 접기**: 세로 탭 패널 오른쪽 상단 접기 아이콘 클릭 (호버 시에만 확장)
* **탭 그룹화 & 효율성 모드**: 관련 탭 그룹 묶음, 수면 탭 활성화로 메모리 절약
* **워크스페이스**: 프로젝트별 탭 세트 모음 관리

---

## 3. 키보드 & 디바이스 설정 (Hardware & Layout)

* **Fn / Ctrl 키 변환 (ThinkPad)**: Lenovo Vantage 앱 또는 BIOS 설정(Config > Keyboard/Mouse)에서 Swap Fn/Ctrl 변경
* **독거미 키보드**: Fn/F키 모드 상호 전환
* **오토핫키 키 비활성화**:
  * CapsLock 키 비활성화
  * 스페이스바 우측 캡처 키(PrintScreen) 비활성화

---

## 4. 생산성 유틸리티 (Tools)

* **Microsoft PowerToys**:
  * `FancyZones`: 화면 영역 레이아웃 맞춤 분할
  * `Text Extractor`: 화면 텍스트 OCR 추출 (`Win + Shift + T`)
* **Everything**: 초고속 파일 검색 도구

---

## 5. AutoHotkey (v2) 스크립트 모음

`startup` 폴더 (`Win + R` -> `shell:startup`)에 `.ahk` 파일을 넣거나 바로가기 배치.

### 주요 기능
1. **키 비활성화**:
   ```autohotkey
   CapsLock::Return
   PrintScreen::Return
   ```
2. **사운드 조절**: 작업표시줄 마우스 휠로 볼륨 컨트롤
3. **창 관리**: 창 숨기기/복구 단축키, Always-on-Top 고정
4. **자동화 & 핫스트링**: 앱 자동 실행(게임/업무 앱), 영-한 오타 변환, 텍스트 상용구 자동 교체
