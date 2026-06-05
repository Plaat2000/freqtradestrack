# Freqtrade Multi-Container Unified Repository

Complete Docker Compose stacks for Freqtrade trading bot - both Official and Custom builds in one repository.

## 📦 Repository: `plaat2000/multicontainer4freqtrade`

All images now unified under a single Docker Hub repository.

### Available Images

#### Custom Stack (Pre-configured with 31 strategies)
- `plaat2000/multicontainer4freqtrade:freqtrade-v1.0` (1.24GB)
- `plaat2000/multicontainer4freqtrade:frequi-v1.0` (96.9MB)
- `plaat2000/multicontainer4freqtrade:postgres-v1.0` (636MB)

#### Official Stack (Clean official builds)
- `plaat2000/multicontainer4freqtrade:freqtrade-official` (1.24GB)
- `plaat2000/multicontainer4freqtrade:frequi-official` (96.9MB)
- `plaat2000/multicontainer4freqtrade:postgres-official` (636MB)

---

## 🚀 Pull Images

```bash
# Custom Stack
docker pull plaat2000/multicontainer4freqtrade:freqtrade-v1.0
docker pull plaat2000/multicontainer4freqtrade:frequi-v1.0
docker pull plaat2000/multicontainer4freqtrade:postgres-v1.0

# Official Stack
docker pull plaat2000/multicontainer4freqtrade:freqtrade-official
docker pull plaat2000/multicontainer4freqtrade:frequi-official
docker pull plaat2000/multicontainer4freqtrade:postgres-official
```

---

## 📋 Compose Files

### Production Stack (Custom - Recommended)
**File:** `docker-compose.prod.yml`
- Ports: 8080 (API), 3000 (UI), 5432 (DB)
- Status: Production-ready
- Features: 31 strategies, pre-configured

```bash
docker-compose -f docker-compose.prod.yml up -d
```

### Custom Stack (Alternative)
**File:** `docker-compose.custom.yml`
- Ports: 8082 (API), 3002 (UI), 5432 (DB)
- Status: Pre-configured
- Features: Same as Production, different ports

```bash
docker-compose -f docker-compose.custom.yml up -d
```

### Official Stack (Learning)
**File:** `docker-compose.official.yml`
- Ports: 8081 (API), 3001 (UI), 5432 (DB)
- Status: Clean official builds
- Features: Minimal customization, full flexibility

```bash
docker-compose -f docker-compose.official.yml up -d
```

---

## 🎯 Quick Start

```bash
# 1. Create directory
mkdir freqtrade && cd freqtrade

# 2. Set up structure
mkdir -p user_data/{strategies,data}

# 3. Create config.json in user_data/
cat > user_data/config.json << 'EOF'
{
  "max_open_trades": 4,
  "stake_currency": "USDT",
  "stake_amount": "unlimited",
  "dry_run": true,
  "exchange": {
    "name": "binance",
    "key": "",
    "secret": "",
    "pair_whitelist": ["BTC/USDT"]
  },
  "api_server": {
    "enabled": true,
    "listen_ip_address": "0.0.0.0",
    "listen_port": 8080,
    "username": "freqtrader",
    "password": "YourPassword"
  }
}
EOF

# 4. Get compose file
curl -o docker-compose.yml https://path/to/docker-compose.prod.yml

# 5. Deploy
docker-compose up -d

# 6. Access
# UI: http://localhost:3000
# API: http://localhost:8080/api/v1
```

---

## 📊 Stack Comparison

| Feature | Custom (v1.0) | Official |
|---------|---------------|----------|
| Base Images | freqtradeorg official | freqtradeorg official |
| Strategies | 31 included | None |
| CORS | Pre-configured | Manual setup |
| Use Case | Production | Learning |
| Setup Time | Minutes | Hours |
| Flexibility | Fixed | Maximum |
| API Port | 8080 (prod), 8082 (custom) | 8081 |
| UI Port | 3000 (prod), 3002 (custom) | 3001 |

---

## 🔐 Login Credentials

Default credentials (change before production):

```
API Username:      freqtrader
API Password:      (Set in config.json)
Database User:     freqtrade
Database Password: Eism1gw0100! (Set in compose file)
```

---

## 🛠️ Management Commands

### Status
```bash
docker-compose ps
```

### Logs
```bash
docker-compose logs -f freqtrade
docker-compose logs -f frequi
docker-compose logs -f postgres
```

### Stop
```bash
docker-compose down
```

### Restart
```bash
docker-compose restart freqtrade
```

### Pull Latest
```bash
docker-compose pull
docker-compose up -d
```

---

## 📊 Available Compose Files

All files located in the project root:

1. **docker-compose.prod.yml**
   - Production: 8080 (API), 3000 (UI)
   - Uses: freqtrade-v1.0, frequi-v1.0, postgres-v1.0
   - Status: RECOMMENDED

2. **docker-compose.custom.yml**
   - Alternative: 8082 (API), 3002 (UI)
   - Uses: freqtrade-v1.0, frequi-v1.0, postgres-v1.0
   - Status: Pre-configured

3. **docker-compose.official.yml**
   - Learning: 8081 (API), 3001 (UI)
   - Uses: freqtrade-official, frequi-official, postgres-official
   - Status: Clean builds

---

## 🚀 Run Multiple Stacks

You can run all three simultaneously on different ports:

```bash
# Terminal 1: Production (8080, 3000)
docker-compose -f docker-compose.prod.yml up -d

# Terminal 2: Custom (8082, 3002)
docker-compose -f docker-compose.custom.yml up -d

# Terminal 3: Official (8081, 3001)
docker-compose -f docker-compose.official.yml up -d

# Test all
curl http://localhost:8080/api/v1/ping  # Production
curl http://localhost:8081/api/v1/ping  # Official
curl http://localhost:8082/api/v1/ping  # Custom
```

---

## 📚 Documentation

| File | Purpose |
|------|---------|
| **INDEX.md** | Master navigation |
| **README.md** | Quick start |
| **DEPLOYMENT.md** | Setup guide |
| **STACKS_COMPARISON.md** | Detailed comparison |
| **STACK_SUMMARY.md** | Complete reference |
| **BUILD_SUMMARY.md** | Build overview |
| **UNIFIED_REPOSITORY.md** | This file |

---

## ✅ Verification

All images are pushed and available:

```bash
# View all images
docker images plaat2000/multicontainer4freqtrade

# Test pull
docker pull plaat2000/multicontainer4freqtrade:freqtrade-v1.0
```

---

## 🔗 Docker Hub

Repository: https://hub.docker.com/r/plaat2000/multicontainer4freqtrade

All 6 images (3 Custom + 3 Official) available in single repository.

---

## 📞 Support

- **Freqtrade**: https://www.freqtrade.io
- **GitHub**: https://github.com/freqtrade/freqtrade
- **Docker Hub**: https://hub.docker.com/u/plaat2000

---

## 🎉 Status

✅ All builds complete
✅ All images pushed to unified repository
✅ All compose files ready
✅ Full documentation available
✅ Production ready

**Repository Version**: 1.0.0
**Created**: 2026-06-04
**Status**: ✅ Production Ready
