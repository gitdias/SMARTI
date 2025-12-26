# Changelog Project SMARTI [https://github.com/gitdias/SMARTI]

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com),
and this project adheres to [Semantic Versioning](https://semver.org).

## [01.00.03] - 2025-12-26

### Added

- Core logging system (`libs/log.lib.sh`)
  - Centralized logging with standardized format `[YYYY-MM-DD HH:MM:SS] LEVEL:SCRIPT:"MESSAGE"`
  - Four severity levels: DEBUG, INFO (default), WARN, ERROR
  - Generic events log (`logs/events.log`) for INFO-level SUCCESS/FAILURE tracking
  - Script-specific logs (`logs/<script>.log`) with full severity support
  - Verbose and silence mode integration
  - Automatic log directory creation with secure permissions
  - Log rotation support preparation (integration with backup system)
  - Thread-safe log writing with file locking mechanism

## [01.00.02] - 2025-12-26

### Added

- Technical standards documentation (`docs/STANDARDS.md`)
  - Shell script coding conventions
  - File organization and naming standards
  - Semantic versioning guidelines (vMAJOR.MINOR.PATCH_uYYYY-MM-DD)
  - Commit message conventions (Conventional Commits)
  - Error handling patterns and exit codes
  - Internationalization implementation (us.lang default, pt_BR.lang fallback)
  - Security guidelines (privilege management, input validation, secure temp files)
  - Logging system specifications (INFO default level)
  - Testing guidelines and best practices

## [01.00.01] - 2025-12-26

### Changed

- Optimized `conf/colors.conf` by removing terminal color detection logic (moved to future ui.lib.sh)
- Optimized `conf/symbols.conf` by removing compatibility fallback function (moved to future ui.lib.sh)
- Simplified `conf/dep.conf` by removing version constraint from bash dependency
- Reduced initial distribution support in `conf/distros.conf` (commented SUSE and Independent families for focused testing)

### Fixed

- Corrected separation of concerns: configuration files now contain only data, not logic

## [01.00.00] - 2025-12-26

### Added

- Initial project structure with 8 main directories (bins, libs, conf, docs, i18n, logs, bkps, mans)
- Complete configuration system with 12 standardized .conf files
- Author and repository metadata (author.conf)
- ANSI color definitions for terminal output (colors.conf)
- 100+ Unicode symbols organized by category (symbols.conf)
- Update notification counter (sub.conf)
- Version tracking system (version.conf, current_version.conf)
- Multi-distribution support database (distros.conf)
- Symbolic links registry (installed_links.conf)
- Backup retention policy (backup.conf)
- Script usage history tracking (history.conf)
- Component descriptions registry (sh.conf)
- Dependency mapping system (dep.conf)
