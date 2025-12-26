# Release Notes - SMARTI v01.00.03

**Release Date:** 2025-12-26

## Added

- Core logging system (`libs/log.lib.sh`)
  - Centralized logging with standardized format `[YYYY-MM-DD HH:MM:SS] LEVEL:SCRIPT:"MESSAGE"`
  - Four severity levels: DEBUG, INFO (default), WARN, ERROR
  - Generic events log (`logs/events.log`) for INFO-level SUCCESS/FAILURE tracking
  - Script-specific logs (`logs/<script>.log`) with full severity support
  - Verbose and silence mode integration
  - Automatic log directory creation with secure permissions
  - Log rotation support preparation (integration with backup system)
  - Thread-safe log writing with file locking mechanism

---

**Full Changelog:** https://github.com/gitdias/SMARTI/blob/main/docs/CHANGELOG.md
