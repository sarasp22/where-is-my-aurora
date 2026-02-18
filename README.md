# 🌌 Where is my Aurora

A mobile-first web app to report and discover aurora borealis sightings around the world in real time — no sign-up needed. Just open the app, share your location, and see where the northern lights are dancing right now.

---

## ✨ Features

- **Live Map** — full-screen dark map showing active aurora sightings as glowing pings
- **KP Index** — real-time geomagnetic activity index fetched from NOAA
- **Add Sighting** — report an aurora with your current location, a description, and a photo
- **Sightings List** — dropdown menu with all recent sightings (last 30 minutes)
- **Aurora Detail** — view each sighting with map, coordinates, distance from you, description and photo
- **Weather** — current weather conditions at your location with aurora visibility advice
- **Forecast** — KP index history, cloud cover, and KP predictions for the next 6 hours
- **No login required** — every user is identified by an anonymous session token

---

## 🛠️ Tech Stack

- **Ruby on Rails 7** — backend framework
- **PostgreSQL** — database
- **Leaflet.js + Mapbox** — interactive dark map
- **NOAA Space Weather API** — real-time KP index (free, no key required)
- **OpenWeatherMap API** — weather and cloud cover data
- **Active Storage** — photo uploads
- **Render** — deployment platform

---

## 🎨 Design

- Mobile-first layout
- Night sky aesthetic with starry overlay
- Aurora-inspired color palette: deep purple `#7c3aed` and aurora green `#34d399`
- Fonts: **Orbitron** (titles & numbers) + **Inter** (body text)

---

## 🚀 Getting Started

### Prerequisites

- Ruby 3.3+
- Rails 7.1+
- PostgreSQL
- Node.js

### Installation

```bash
git clone https://github.com/YOUR_USERNAME/where-is-my-aurora.git
cd where-is-my-aurora
bundle install
```

### Environment Variables

Create a `.env` file in the root directory:

```
MAPBOX_API_KEY=your_mapbox_key
OPENWEATHER_API_KEY=your_openweather_key
```

### Database Setup

```bash
rails db:create
rails db:migrate
```

### Run the App

```bash
rails server
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

---

## 📱 How it Works

1. User opens the app — an anonymous session token is generated automatically
2. The browser requests geolocation permission
3. The map centers on the user's position and loads nearby aurora sightings
4. The KP index for the current location is fetched from NOAA
5. Users can report a sighting — it appears as a glowing ping on the map for 30 minutes
6. Sightings expire automatically after 30 minutes
