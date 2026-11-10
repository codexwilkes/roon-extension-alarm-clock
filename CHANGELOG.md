# Changelog

All notable changes follow [SemVer](https://semver.org/).

## [0.10.0] - 2026-11-10

### Changed
- Base image: `multiarch/alpine:*-v3.12` → official `node:24-alpine`.
  tzdata 2022a → 2026f. Node 12.22.12 → 24.x.
- Build is multi-arch through `--platform`. Build argument `build_arch` removed.

### Fixed
- America/Vancouver used PST after 2026-11-01. BC moved to permanent -07 (MST).

### Added
- `test/smoke.sh`.
