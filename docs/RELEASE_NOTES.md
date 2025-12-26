# Release Notes - SMARTI v01.00.01

**Release Date:** 2025-12-26

## Changed

- Optimized `conf/colors.conf` by removing terminal color detection logic (moved to future ui.lib.sh)
- Optimized `conf/symbols.conf` by removing compatibility fallback function (moved to future ui.lib.sh)
- Simplified `conf/dep.conf` by removing version constraint from bash dependency
- Reduced initial distribution support in `conf/distros.conf` (commented SUSE and Independent families for focused testing)

## Fixed

- Corrected separation of concerns: configuration files now contain only data, not logic

---

**Full Changelog:** https://github.com/gitdias/SMARTI/blob/main/docs/CHANGELOG.md
