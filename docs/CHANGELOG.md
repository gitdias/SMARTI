# Changelog Project SMARTI [https://github.com/gitdias/SMARTI]

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com),
and this project adheres to [Semantic Versioning](https://semver.org).

## [01.00.01] - 2025-12-26

### Changed

- Optimized `conf/colors.conf` by removing terminal color detection logic (moved to future ui.lib.sh)
- Optimized `conf/symbols.conf` by removing compatibility fallback function (moved to future ui.lib.sh)
- Simplified `conf/dep.conf` by removing version constraint from bash dependency
- Reduced initial distribution support in `conf/distros.conf` (commented SUSE and Independent families for focused testing)

### Fixed

- Corrected separation of concerns: configuration files now contain only data, not logic

## [01.00.00] - 2025-11-24

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
