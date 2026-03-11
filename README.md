# Fine Dust Tracker

A Flutter application that tracks real-time fine dust (PM10 & PM2.5) air quality data based on your current location, using South Korea's public air quality API.

[한국어 버전은 아래를 참고하세요 ↓](#한국어)

---

## Features

- **Real-time air quality data** – Fetches PM10 and PM2.5 measurements from the nearest monitoring station
- **GPS-based location detection** – Automatically determines your location and finds the closest station
- **Station search** – Search for air quality data by station name
- **Auto-refresh** – Manually refresh data with a tap

## Getting Started

### Prerequisites

- Flutter SDK `>=3.4.0 <4.0.0`
- Dart SDK
- An API key from [data.go.kr](https://www.data.go.kr) (Korea Public Data Portal)

### Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/fine_dust_tracker.git
   cd fine_dust_tracker
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Create a `.env` file in the project root:
   ```
   API_KEY=your_data_go_kr_api_key
   ```

4. Run the app:
   ```bash
   flutter run
   ```

### Permissions

The app requires location permissions to detect your current position. You will be prompted to grant access on first launch.

## Tech Stack

| Package | Purpose |
|---|---|
| `geolocator` | GPS location access |
| `geocoding` | Reverse geocoding (coordinates → address) |
| `proj4dart` | Coordinate projection (WGS84 → TM) |
| `http` | HTTP requests to air quality API |
| `xml` | Parsing XML API responses |
| `flutter_dotenv` | Environment variable management |
| `intl` | Date/time formatting (Korean locale) |

## API

This app uses the [Air Korea](https://www.airkorea.or.kr) real-time measurement API (`ArpltnInforInqireSvc`) provided through data.go.kr.

## Project Structure

```
lib/
├── models/
│   └── measurement_station_model.dart
├── screens/
│   └── home_screen.dart
└── services/
    ├── fine_dust_api_service.dart
    ├── location_api_service.dart
    └── search_api_service.dart
```

---

<a name="한국어"></a>

# 미세먼지 트래커

현재 위치를 기반으로 실시간 미세먼지(PM10 & PM2.5) 대기질 정보를 제공하는 Flutter 앱입니다. 한국 공공데이터 포털의 에어코리아 API를 활용합니다.

## 주요 기능

- **실시간 대기질 정보** – 가장 가까운 측정소의 PM10 및 PM2.5 수치를 실시간으로 조회
- **GPS 기반 위치 감지** – 현재 위치를 자동으로 파악하여 인근 측정소를 탐색
- **측정소 검색** – 측정소 이름으로 대기질 정보 검색
- **새로고침** – 버튼 탭으로 수동 데이터 갱신

## 시작하기

### 사전 준비

- Flutter SDK `>=3.4.0 <4.0.0`
- Dart SDK
- [공공데이터 포털(data.go.kr)](https://www.data.go.kr) API 키

### 설치 방법

1. 저장소 클론:
   ```bash
   git clone https://github.com/your-username/fine_dust_tracker.git
   cd fine_dust_tracker
   ```

2. 패키지 설치:
   ```bash
   flutter pub get
   ```

3. 프로젝트 루트에 `.env` 파일 생성:
   ```
   API_KEY=발급받은_API_키
   ```

4. 앱 실행:
   ```bash
   flutter run
   ```

### 권한 설정

앱은 현재 위치 파악을 위해 위치 권한이 필요합니다. 최초 실행 시 권한 허용 요청이 표시됩니다.

## 기술 스택

| 패키지 | 용도 |
|---|---|
| `geolocator` | GPS 위치 접근 |
| `geocoding` | 역지오코딩 (좌표 → 주소 변환) |
| `proj4dart` | 좌표계 변환 (WGS84 → TM) |
| `http` | 대기질 API HTTP 요청 |
| `xml` | XML 응답 파싱 |
| `flutter_dotenv` | 환경 변수 관리 |
| `intl` | 날짜/시간 포맷 (한국어 로케일) |

## API

이 앱은 [에어코리아](https://www.airkorea.or.kr)의 실시간 측정 API(`ArpltnInforInqireSvc`)를 공공데이터 포털을 통해 활용합니다.

## 프로젝트 구조

```
lib/
├── models/
│   └── measurement_station_model.dart
├── screens/
│   └── home_screen.dart
└── services/
    ├── fine_dust_api_service.dart
    ├── location_api_service.dart
    └── search_api_service.dart
```
